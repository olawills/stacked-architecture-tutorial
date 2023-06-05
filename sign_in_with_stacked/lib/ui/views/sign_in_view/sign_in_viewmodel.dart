import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:sign_in_with_stacked/app/app.bottomsheets.dart';
import 'package:sign_in_with_stacked/app/app.locator.dart';
import 'package:sign_in_with_stacked/app/app.logger.dart';
import 'package:sign_in_with_stacked/app/app.router.dart';
import 'package:sign_in_with_stacked/core/model/user_model.dart';
import 'package:sign_in_with_stacked/core/services/api_service.dart';
import 'package:sign_in_with_stacked/core/services/provider/user_provider.dart';
import 'package:sign_in_with_stacked/ui/utils/error_handler.dart';
import 'package:sign_in_with_stacked/ui/utils/validation_manager.dart';
import 'package:sign_in_with_stacked/ui/views/sign_in_view/sign_in_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignInViewModel extends FormViewModel {
// Services Locators

  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _apiService = locator<ApiService>();
  late BuildContext _context;
  final log = getLogger('SigninViewModel');

// set the current build context
  void setContext(BuildContext context) {
    _context = context;
  }

  // check the form validation, email value and password value

  bool get hasValidation =>
      !isFormValid || emailValue == null || passwordValue == null;

  // This method

  void onSuccess(http.Response response) {
    var result = jsonDecode(response.body);
    var user = User(
        email: result['data']['email'],
        password: '',
        firstName: result['data']['first_name'],
        lastName: result['data']['last_name'],
        accessToken: result['data']['token']['access_token']);
    Provider.of<UserProvider>(_context, listen: false).setUserFromModel(user);
    var newUser = Provider.of<UserProvider>(_context, listen: false).user;
    log.i(newUser);
    setBusy(false);
    _navigationService.navigateTo(Routes.homeView);
  }

  void onError400() {
    log.d('Api response is 400');
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: 'Log in error',
      description:
          'The email or password you entered is incorrect. Kindly check and retry or click Forgot password to reset the password for this account.',
    );
    setBusy(false);
  }

  void onError500() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: 'Connection Error!',
      description: 'Please try agin later',
    );
  }

  void gotToHomeView(BuildContext context) async {
    if (emailValue == null || passwordValue == null) {
      return;
    } else if (emailValue!.isEmpty || emailValue!.isEmpty) {
      return;
    } else {
      if (!isFormValid) {
        log.d('Form is valid');
        setBusy(true);
        var apiRes = await _apiService.sigInUsers(
            email: emailValue!, password: passwordValue!);
        if (apiRes != null) {
          log.d('Api response is not null');
          var newResponse = apiRes as http.Response;
          errorHandler(
              response: newResponse,
              onSuccess: () => onSuccess(apiRes),
              onError400: onError400,
              onError500: onError500);
        } else {
          log.d('Api response is null');
          _bottomSheetService.showCustomSheet(
            variant: BottomSheetType.notice,
            title: 'Connection error!',
            description:
                'There seem to be something wrong with your WiFi network or mobile service. Kindly check and try again. Thank you.',
          );
          // onError500;
          setBusy(false);
        }
      } else {
        return;
      }
    }
  }

  void navigateToSignUp() {
    _navigationService.navigateTo(Routes.signUpView);
  }

  @override
  void setFormStatus() {
    setEmailValidationMessage(
      emailValidator(value: emailValue ?? ''),
    );
    setPasswordValidationMessage(
      passwordValidator(value: passwordValue ?? ''),
    );
  }
}
