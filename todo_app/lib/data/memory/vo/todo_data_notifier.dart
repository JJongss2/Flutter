import 'package:fast_app_base/data/memory/vo/vo_todo.dart';
import 'package:flutter/cupertino.dart';

class TodoDataNotifier extends ValueNotifier<List<Todo>>{
  TodoDataNotifier(): super([]); // 처음에는 아무것도 받지 않고 긴 리스트로 초기화

  void addTodo(Todo todo){
    value.add(todo);
    notifyListeners(); // value가 변경되었음을 모든 리스너들에게 알림
                       // => UI가 변경된 데이터를 반영
  }

  void notify(){
    notifyListeners();
  }

}