import 'package:fast_app_base/data/memory/bloc/bloc_status.dart';
import 'package:fast_app_base/data/memory/bloc/todo_bloc_state.dart';
import 'package:fast_app_base/data/memory/vo/todo_status.dart';
import 'package:fast_app_base/data/memory/vo/vo_todo.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../screen/main/write/d_write_todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class TodoCubit extends Cubit<TodoBlocState> {

  TodoCubit() : super(TodoBlocState(BlocStatus.initial, <Todo>[]));

  
  void addTodo() async {
    final result = await WriteTodoDialog().show();
    if (result != null) { // 스크린이 살아있는지 체크해줌
      final copiedOldTodoList = List.of(state.todoList); // 수정이 가능한 리스트로 만듬
      copiedOldTodoList.add(Todo(
        id: DateTime
            .now()
            .millisecondsSinceEpoch,
        title: result.text,
        dueDate: result.dateTime,
      ),);
      emitNewList(copiedOldTodoList);
    }
  }

  void changeTodoStatus(Todo todo) async {
    final copiedOldTodoList = List.of(state.todoList); // 수정이 가능한 리스트로 만듬
    final todoIndex = copiedOldTodoList.indexWhere((element)=> element.id == todo.id);
    switch (todo.status) {
      case TodoStatus.incomplete:
        todo.status = TodoStatus.ongoing;
      case TodoStatus.ongoing:
        todo.status = TodoStatus.complete;
      case TodoStatus.complete:
        final result = await ConfirmDialog('정말로 처음 상태로 변경하시겠어요?').show();
        result?.runIfSuccess((data) {
          todo.status = TodoStatus.incomplete;
        });
    }
    copiedOldTodoList[todoIndex] = todo;
    emitNewList(copiedOldTodoList);
  }



  void editTodo(Todo todo) async{
    final result = await WriteTodoDialog(todoForEdit : todo).show();
    if(result != null){
      todo.title = result.text;
      todo.dueDate = result.dateTime;
      final oldCopiedList = List<Todo>.from(state.todoList);
      oldCopiedList[oldCopiedList.indexOf(todo)] = todo;
      emitNewList(oldCopiedList);
    }
  }

  void removeTodo(Todo todo) {
    final oldCopiedList = List<Todo>.from(state.todoList);
    oldCopiedList.removeWhere((element) => element.id == todo.id);
    emitNewList(oldCopiedList);
  }

  void emitNewList(List<Todo> oldCopiedList) {
    emit(state.copyWith(todoList: oldCopiedList));
  }

}
