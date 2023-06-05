import 'package:flutter/material.dart';
import 'package:sign_in_with_stacked/ui/common/text_styles.dart';
import 'package:sign_in_with_stacked/ui/common/ui_helpers.dart';
import 'package:sign_in_with_stacked/ui/widgets/custom_button.dart';
import 'package:sign_in_with_stacked/ui/widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'sign_up_view_view.form.dart';
import 'sign_up_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'firstName'),
  FormTextField(name: 'lastName'),
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class SignUpView extends StackedView<SignUpViewModel> with $SignUpView {
  const SignUpView({Key? key}) : super(key: key);
  @override
  Widget builder(
    BuildContext context,
    SignUpViewModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get Started on',
                    style: kHeadlineLarge.copyWith(fontSize: 28),
                  ),
                  Text(
                    'Stacked Form Validation',
                    style: kHeadlineLarge.copyWith(fontSize: 28),
                  ),
                  verticalSpaceSmall,
                  CustomTextField(
                    labelText: 'First Name',
                    controller: firstNameController,
                    hintText: 'Enter First Name',
                    validationMessage: viewModel.firstNameValidationMessage,
                    hasValidationMessage:
                        viewModel.hasFirstNameValidationMessage,
                  ),
                  verticalSpaceSmall,
                  CustomTextField(
                    labelText: 'Last Name',
                    controller: lastNameController,
                    hintText: 'Enter Last Name',
                    validationMessage: viewModel.lastNameValidationMessage,
                    hasValidationMessage:
                        viewModel.hasLastNameValidationMessage,
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
                    hasValidationMessage:
                        viewModel.hasPasswordValidationMessage,
                  ),
                  CustomButton(
                    isLoading: viewModel.isBusy,
                    onPressed: () async {
                      await viewModel.submitForm(!viewModel.isDisabled);
                    },
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
                        onPressed: () => viewModel.navigateToSignin(),
                        child: const Text('Sign in'),
                      )
                    ],
                  )
                ],
              ),
            ),
          
          ),
        ),
      ),
    );
  }

  @override
  void onDispose(SignUpViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  void syncFormWithViewModel(FormViewModel model) {
    syncFormWithViewModel(model);
  }

  @override
  SignUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignUpViewModel();
}
