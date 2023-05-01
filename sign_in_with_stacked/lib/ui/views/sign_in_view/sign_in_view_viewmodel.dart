import 'package:sign_in_with_stacked/app/app.locator.dart';
import 'package:sign_in_with_stacked/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignInViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  void navigateToSignUp() {
    _navigationService.navigateTo(Routes.signUpView);
  }
}
