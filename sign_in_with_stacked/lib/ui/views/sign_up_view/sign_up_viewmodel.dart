import 'package:http/http.dart' as http;
import 'package:sign_in_with_stacked/app/app.bottomsheets.dart';
import 'package:sign_in_with_stacked/app/app.locator.dart';
import 'package:sign_in_with_stacked/app/app.router.dart';
import 'package:sign_in_with_stacked/core/model/user_model.dart';
import 'package:sign_in_with_stacked/core/services/api_service.dart';
import 'package:sign_in_with_stacked/ui/utils/error_handler.dart';
import 'package:sign_in_with_stacked/ui/utils/validation_manager.dart';
import 'package:sign_in_with_stacked/ui/views/sign_up_view/sign_up_view_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends FormViewModel {
  //  Services Locators
  final _navigationService = locator<NavigationService>();
  final _apiService = locator<ApiService>();
  final _bottomSheetService = locator<BottomSheetService>();

  //  get the state of each values in the formfield
  bool get isDisabled =>
      !isFormValid ||
      emailValue == null ||
      passwordValue == null ||
      firstNameValue == null ||
      lastNameValue == null;

// method to sign up the user and navigate the user to the otp screen
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

//  Error 400 or 404 method, this method handles such errors from the api
  void onError400() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      description: 'Something went wrong. Please try again later thank you',
    );
  }

// the method handles error 500 or 502 from the api
  void onError500() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      description: 'Something went wrong. Please try again later thank you',
    );
  }

//  the submit form mehtod, accepts a boolean value, checks if all input are correct and sends it to the getOtp api

//   There is currently an error from the api so users can get an otp to complete the verification
  Future submitForm(bool accept) async {
    if (accept) {
      setBusy(true);
      var response = await _apiService.getOtp(email: emailValue!);
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

// The form validation message handler
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
