// ignore_for_file: public_member_api_docs, sort_constructors_first

class TodoModel {
  final String id;
  bool isCompleted;
  String content;

  TodoModel({
    required this.id,
    this.isCompleted = false,
    this.content = '',
  });
}
