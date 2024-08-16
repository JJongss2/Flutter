import 'package:fast_app_base/data/memory/bloc/bloc_status.dart';
import 'package:fast_app_base/data/memory/bloc/todo_bloc_state.dart';
import 'package:fast_app_base/data/memory/bloc/todo_event.dart';
import 'package:fast_app_base/data/memory/vo/todo_status.dart';
import 'package:fast_app_base/data/memory/vo/vo_todo.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../screen/main/write/d_write_todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class TodoBloc extends Bloc<TodoEvent, TodoBlocState> {

  TodoBloc() : super(const TodoBlocState(BlocStatus.initial, <Todo>[])){
    on<TodoAddEvent>(_addTodo);
    on<TodoStatusUpdateEvent>(_changeTodoStatus);
    on<TodoContentUpdateEvent>(_editTodo);
    on<TodoRemovedEvent>(_removeTodo);
  }

  
  void _addTodo(TodoAddEvent event, Emitter<TodoBlocState> emit) async {
    final result = await WriteTodoDialog().show();
    if (result != null) { // 스크린이 살아있는지 체크해줌
      final copiedOldTodoList = List.of(state.todoList); // 수정이 가능한 리스트로 만듬
      copiedOldTodoList.add(Todo(
        id: DateTime
            .now()
            .millisecondsSinceEpoch,
        title: result.text,
        dueDate: result.dateTime,
        createdTime: DateTime.now(),
        status: TodoStatus.incomplete,
      ),);
      emitNewList(copiedOldTodoList, emit);
    }
  }

  void _changeTodoStatus(TodoStatusUpdateEvent event, Emitter<TodoBlocState> emit) async {
    final copiedOldTodoList = List.of(state.todoList); // 수정이 가능한 리스트로 만듬
    final todo = event.updatedTodo;
    final todoIndex = copiedOldTodoList.indexWhere((element)=> element.id == todo.id);
    TodoStatus status = todo.status;
    switch (todo.status) {
      case TodoStatus.incomplete:
        status = TodoStatus.ongoing;
      case TodoStatus.ongoing:
        status = TodoStatus.complete;
      case TodoStatus.complete:
        final result = await ConfirmDialog('정말로 처음 상태로 변경하시겠어요?').show();
        result?.runIfSuccess((data) {
          status = TodoStatus.incomplete;
        });
    }
    copiedOldTodoList[todoIndex] = todo.copyWith(status: status);
    emitNewList(copiedOldTodoList, emit);
  }



  void _editTodo(TodoContentUpdateEvent event, Emitter<TodoBlocState> emit) async{
    final todo = event.updatedTodo;
    final result = await WriteTodoDialog(todoForEdit : todo).show();
    if(result != null){
      final oldCopiedList = List<Todo>.from(state.todoList);
      oldCopiedList[oldCopiedList.indexOf(todo)] = todo.copyWith(
          title: result.text,dueDate:result.dateTime, modifyTime: DateTime.now());
      emitNewList(oldCopiedList, emit);
    }
  }

  void _removeTodo(TodoRemovedEvent event,Emitter<TodoBlocState> emit ) {
    final todo = event.removedTodo;
    final oldCopiedList = List<Todo>.from(state.todoList);
    oldCopiedList.removeWhere((element) => element.id == todo.id);
    emitNewList(oldCopiedList, emit);
  }

  void emitNewList(List<Todo> oldCopiedList, Emitter<TodoBlocState> emit) { // cubit이 아닌 bloc에서는 emit함수를 직접적으로 사용하면 안됨

    emit(state.copyWith(todoList: oldCopiedList));
  }

}
