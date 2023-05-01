import 'package:flutter/material.dart';
import 'package:sign_in_with_stacked/ui/common/text_styles.dart';
import 'package:sign_in_with_stacked/ui/common/ui_helpers.dart';
import 'package:sign_in_with_stacked/ui/widgets/custom_button.dart';
import 'package:sign_in_with_stacked/ui/widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'sign_in_view_viewmodel.dart';
import 'sign_in_view_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class SignInView extends StackedView<SignInViewModel> with $SignInView {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignInViewModel viewModel,
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
                  labelText: 'Email',
                  controller: emailController,
                  hintText: 'Enter Email',
                  validationMessage: viewModel.emailValidationMessage,
                  hasValidationMessage: viewModel.hasEmailValidationMessage,
                ),
                verticalSpaceSmall,
                CustomTextField(
                  suffixIcon: true,
                  labelText: 'Password',
                  controller: passwordController,
                  hintText: 'Enter Password',
                  validationMessage: viewModel.passwordValidationMessage,
                  hasValidationMessage: viewModel.hasPasswordValidationMessage,
                ),
                CustomButton(
                  isLoading: viewModel.isBusy,
                  onPressed: () async {},
                  text: viewModel.isBusy ? 'Signing up' : 'Sign Up',
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already got an account?',
                      style: kBodyMedium,
                    ),
                    TextButton(
                      onPressed: () => viewModel.navigateToSignUp(),
                      child: const Text('Sign up'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(SignInViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(SignInViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  SignInViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignInViewModel();
}
