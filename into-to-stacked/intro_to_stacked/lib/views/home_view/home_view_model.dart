import 'package:intro_to_stacked/app/app.locator.dart';
import 'package:intro_to_stacked/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  String declarationId = 'Fuck you Mfs...!';
  final _navigationService = locator<NavigationService>();

  String get getDeclaredvars => declarationId;

  void updateText() {
    declarationId = 'Interesting things about my personality';
    notifyListeners();
  }

  void navigateToNextScreen() {
    _navigationService.navigateTo(Routes.profileView);
  }

  void navigateToTodoScreen() {
    _navigationService.navigateTo(Routes.todoView);
  }
}
