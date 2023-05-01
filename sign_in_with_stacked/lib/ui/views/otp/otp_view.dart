import 'package:flutter/material.dart';
import 'package:sign_in_with_stacked/core/model/user_model.dart';
import 'package:sign_in_with_stacked/ui/common/text_styles.dart';
import 'package:sign_in_with_stacked/ui/common/ui_helpers.dart';
import 'package:sign_in_with_stacked/ui/widgets/custom_button.dart';
import 'package:sign_in_with_stacked/ui/widgets/custom_text_field.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked/stacked.dart';
import 'otp_view.form.dart';
import 'otp_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'otp'),
])
class OtpView extends StackedView<OtpViewModel> with $OtpView {
  final User user;
  const OtpView({Key? key, required this.user}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OtpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: kHeadlineLarge.copyWith(fontSize: 28),
                ),
                verticalSpaceSmall,
                CustomTextField(
                  labelText: 'Otp',
                  type: 'number',
                  error: viewModel.otpError,
                  controller: otpController,
                  hintText: 'Enter Email',
                  validationMessage: viewModel.otpError
                      ? 'The verification code provided is incorrect or has expired, please request for another code and try again.'
                      : viewModel.otpValidationMessage,
                  hasValidationMessage: viewModel.hasOtpValidationMessage,
                ),
                verticalSpaceSmall,
                CustomButton(
                  isLoading: viewModel.isBusy,
                  onPressed: () => viewModel.submitForm(user),
                  text:
                      viewModel.isBusy ? 'Verifying account' : 'Verify account',
                ),
                verticalSpaceSmall,
                Center(
                  child: TextButton(
                    onPressed: () => viewModel.resentCode,
                    child: const Text('Resend Code'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(OtpViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(OtpViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  OtpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OtpViewModel();
}
