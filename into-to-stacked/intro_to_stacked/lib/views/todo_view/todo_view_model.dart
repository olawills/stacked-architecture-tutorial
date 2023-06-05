import 'package:flutter/material.dart';
import 'package:intro_to_stacked/app/app.locator.dart';
import 'package:intro_to_stacked/services/models/todo_model.dart';
import 'package:intro_to_stacked/services/todo_services.dart';
import 'package:stacked/stacked.dart';

class TodoViewModel extends ReactiveViewModel {
  final _firstTodoFocusNode = FocusNode();
  final _todosService = locator<TodosService>();
  late final toggleStatus = _todosService.toggleStatus;
  late final removeTodo = _todosService.removeTodo;
  late final updateTodoContent = _todosService.updateTodoContent;

  List<TodoModel> get todos => _todosService.todos;

  void newTodo() {
    _todosService.newTodo();
    _firstTodoFocusNode.requestFocus();
  }

  FocusNode? getFocusNode(String id) {
    final index = todos.indexWhere((todo) => todo.id == id);
    return index == 0 ? _firstTodoFocusNode : null;
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_todosService];
}
