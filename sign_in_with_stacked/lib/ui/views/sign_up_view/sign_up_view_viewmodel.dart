import 'package:sign_in_with_stacked/app/app.bottomsheets.dart';
import 'package:sign_in_with_stacked/core/model/user_model.dart';
import 'package:sign_in_with_stacked/core/services/api_service.dart';
import 'package:sign_in_with_stacked/ui/utils/error_handler.dart';
import 'package:sign_in_with_stacked/ui/utils/validation_manager.dart';
import 'package:sign_in_with_stacked/ui/views/sign_up_view/sign_up_view_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:sign_in_with_stacked/app/app.locator.dart';
import 'package:sign_in_with_stacked/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:http/http.dart' as http;

class SignUpViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _firebaseService = locator<ApiService>();
  final _bottomSheetService = locator<BottomSheetService>();
  bool get isDisabled =>
      !isFormValid ||
      emailValue == null ||
      passwordValue == null ||
      firstNameValue == null ||
      lastNameValue == null;

  void onSuccess() {
    User user = User(
      email: emailValue!,
      password: passwordValue!,
      firstName: firstNameValue!,
      lastName: lastNameValue!,
      accessToken: '',
    );
    _navigationService.navigateTo(
      Routes.otpView,
      arguments: OtpViewArguments(user: user),
    );
  }

  void onError400() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      description: 'Something went wrong. Please try again later thank you',
    );
  }

  void onError500() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      description: 'Something went wrong. Please try again later thank you',
    );
  }

  Future submitForm(bool accept) async {
    if (accept) {
      setBusy(true);
      var response = await _firebaseService.getOtp(email: emailValue!);
      log.i(response);
      if (response != null) {
        var newResponse = response as http.Response;
        errorHandler(
          response: newResponse,
          onSuccess: onSuccess,
          onError400: onError400,
          onError500: onError500,
        );
        setBusy(false);
      } else {
        _bottomSheetService.showCustomSheet(
          variant: BottomSheetType.notice,
          title: 'Connection Error',
          description: 'Something went wrong please try again later',
        );
        setBusy(false);
      }
    }
  }

  void navigateToSignin() {
    _navigationService.navigateTo(Routes.signInView);
  }

  @override
  void setFormStatus() {
    setEmailValidationMessage(
      emailValidator(value: emailValue ?? ''),
    );
    setPasswordValidationMessage(
      passwordValidator(value: passwordValue ?? ''),
    );
    setFirstNameValidationMessage(
      firstNameValidator(value: firstNameValue ?? ''),
    );
    setLastNameValidationMessage(lastNameValidator(value: lastNameValue ?? ''));
  }
}
