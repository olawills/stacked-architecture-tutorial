import 'package:intro_to_stacked/services/todo_services.dart';
import 'package:intro_to_stacked/views/home_view/home_view.dart';
import 'package:intro_to_stacked/views/profile_view/profile_view.dart';
import 'package:intro_to_stacked/views/todo_view/todo_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: HomeView, initial: true),
  MaterialRoute(page: ProfileView),
  MaterialRoute(page: TodoView)
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: TodosService)
])
class AppSetup {}
