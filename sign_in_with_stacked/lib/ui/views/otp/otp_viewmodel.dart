import 'dart:convert';

import 'package:sign_in_with_stacked/app/app.bottomsheets.dart';
import 'package:sign_in_with_stacked/app/app.locator.dart';
import 'package:sign_in_with_stacked/app/app.router.dart';
import 'package:sign_in_with_stacked/core/model/user_model.dart';
import 'package:sign_in_with_stacked/core/services/api_service.dart';
import 'package:sign_in_with_stacked/ui/utils/error_handler.dart';
import 'package:sign_in_with_stacked/ui/views/otp/otp_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'package:stacked_services/stacked_services.dart';

class OtpViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _firebaseService = locator<ApiService>();
  final _bottomSheetService = locator<BottomSheetService>();
  bool _otpError = false;
  bool get isEmpty => otpValue == null || otpValue!.length < 6;
  bool get otpError => _otpError;

  void onSuccess(http.Response res) {
    var user = jsonDecode(res.body);
    log.i(user);
    notifyListeners();
    _navigationService.navigateTo(
      Routes.homeView,
      arguments: HomeViewArguments(user: user),
    );
  }

  void onError400() {
    _otpError = true;
    log.i(_otpError);
    notifyListeners();
  }

  void onError500() {
    _otpError = true;
    log.i(_otpError);
    notifyListeners();
  }

  Future submitForm(User user) async {
    if (isEmpty) {
      log.i('the form is empty or null');
      return;
    } else {
      setBusy(true);
      var response = await _firebaseService.signUpUser(
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
        password: user.password,
        code: otpValue!,
      );
      if (response != null) {
        var newResponse = response as http.Response;
        setBusy(false);
        errorHandler(
            response: newResponse,
            onSuccess: () => onSuccess(newResponse),
            onError400: onError400,
            onError500: onError500);
      } else {
        setBusy(false);
        _bottomSheetService.showCustomSheet(
          variant: BottomSheetType.notice,
          title: 'Connection error!',
          description:
              'There seem to be something wrong with your network, Please check and try again later..',
        );
      }
    }
  }

  void resentCode(){
    
  }

  String? otpValidator({String? value}) {
    if (value == "") {
      return null;
    } else if (value!.length != 6) {
      return 'Enter a valid OTP';
    } else if (_otpError == true) {
      return 'The verification code provided is incorrect or has expired, please request for another code and try again';
    }
    return null;
  }

  @override
  void setFormStatus() {
    setOtpValidationMessage(
      otpValidator(value: otpValue ?? ''),
    );
  }
}
