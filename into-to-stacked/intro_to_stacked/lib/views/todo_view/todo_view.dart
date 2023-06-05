import 'package:flutter/material.dart';
import 'package:intro_to_stacked/views/todo_view/todo_view_model.dart';
import 'package:stacked/stacked.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TodoViewModel>.reactive(
      viewModelBuilder: () => TodoViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Flutter Stacked Todos')),
          body: ListView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            children: [
              if (model.todos.isEmpty)
                Opacity(
                  opacity: 0.5,
                  child: Column(
                    children: const [
                      SizedBox(height: 64),
                      Icon(Icons.emoji_food_beverage_outlined, size: 48),
                      SizedBox(height: 16),
                      Text('No todos yet. Click + to add a new one.'),
                    ],
                  ),
                ),
              ...model.todos.map((todo) {
                return ListTile(
                  leading: IconButton(
                    icon: Icon(
                      todo.isCompleted ? Icons.task_alt : Icons.circle_outlined,
                    ),
                    onPressed: () => model.toggleStatus(todo.id),
                  ),
                  title: TextField(
                    controller: TextEditingController(text: todo.content),
                    decoration: null,
                    focusNode: model.getFocusNode(todo.id),
                    maxLines: null,
                    onChanged: (text) => model.updateTodoContent(todo.id, text),
                    style: TextStyle(
                      fontSize: 20,
                      decoration:
                          todo.isCompleted ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.horizontal_rule),
                    onPressed: () => model.removeTodo(todo.id),
                  ),
                );
              }),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: model.newTodo,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
