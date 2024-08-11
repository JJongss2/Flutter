import 'package:fast_app_base/data/memory/vo/todo_data_notifier.dart';
import 'package:flutter/material.dart';

class TodoDataHolder extends InheritedWidget{

  final TodoDataNotifier notifier;

  const TodoDataHolder({
    super.key,
    required super.child,
    required this.notifier,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}