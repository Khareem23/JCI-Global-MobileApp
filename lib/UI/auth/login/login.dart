import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/auth/login/viewmodel/login_state.dart';
import 'package:jci_remit_mobile/UI/auth/login/viewmodel/login_vm.dart';
import 'package:jci_remit_mobile/UI/auth/register/register.dart';
import 'package:jci_remit_mobile/UI/lander/lander.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/common/custom_text_field.dart';
import 'package:jci_remit_mobile/common/snackbar.dart';
import 'package:jci_remit_mobile/controllers/auth_controller.dart';
import 'package:jci_remit_mobile/utils/navigator.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/values/values.dart';

import '../reset_password.dart';

class LoginScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final ispwdShown = useState(false);
    final _formKey = useState(GlobalKey<FormState>());
    final username = useState('');
    final password = useState('');

    final emailFocusNode = useFocusNode();
    final pwdFocusNode = useFocusNode();
    final emailBgColor = useState(Color(0xFFF7F7F7));
    final pwdBgColor = useState(Color(0xFFF7F7F7));
    txtFieldListener(emailFocusNode, emailBgColor);
    txtFieldListener(pwdFocusNode, pwdBgColor);
    var theme = context.themeData.textTheme;

    return ProviderListener<LoginState>(
        provider: loginNotifierProvider,
        onChange: (context, state) {
          if (state is LoginSuccess) {
            return context
                .read(authControllerProvider.notifier)
                .auth(AuthenticationStatus.authenticated);
          }
          if (state is LoginError) {
            return AppSnackBar.showErrorSnackBar(context,
                message: state.message);
          }
          if (state is UserNotConfirmed) {
            return context
                .read(authControllerProvider.notifier)
                .auth(AuthenticationStatus.notVerified);
          }
        },
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
            ),
            backgroundColor: Colors.white,
            body: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset('assets/images/watermark.png',
                    width: MediaQuery.of(context).size.width * 0.8),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    // height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LanderScreen()));
                            },
                            child: Image.asset('assets/images/logo.png',
                                height: 120)),
                        SizedBox(
                          height: 100,
                        ),

                        Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: _formKey.value,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sign in with your email',
                                    textAlign: TextAlign.center,
                                    style: theme.headline3,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomTextFormField(
                                focusNode: emailFocusNode,
                                fillColor: emailBgColor.value,
                                onChanged: (value) => {username.value = value},
                                textInputType: TextInputType.text,
                                hintText: 'Email Address',
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Email is required';
                                  }

                                  // if (!RegExp(
                                  //         "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
                                  //     .hasMatch(value)) {
                                  //   return 'Enter a valid email address';
                                  // }

                                  // validator has to return something :)
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomTextFormField(
                                focusNode: pwdFocusNode,
                                fillColor: pwdBgColor.value,
                                onChanged: (value) => {password.value = value},
                                textInputType: TextInputType.text,
                                obscured: !ispwdShown.value,
                                hintText: 'Password',
                                hasSuffixIcon: true,
                                suffixIcon: IconButton(
                                    icon: Icon(ispwdShown.value
                                        ? Feather.eye_off
                                        : Feather.eye),
                                    onPressed: () =>
                                        ispwdShown.value = !ispwdShown.value),
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Password is required';
                                  }

                                  // validator has to return something :)
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Consumer(builder: (context, watch, _) {
                                final vm = watch(loginNotifierProvider);
                                return CustomButton(
                                    color: AppColors.primaryColor,
                                    width: MediaQuery.of(context).size.width,
                                    onPressed: vm is LoginLoading
                                        ? null
                                        : () {
                                            if (!_formKey.value.currentState!
                                                .validate()) {
                                              return null;
                                            }
                                            _formKey.value.currentState!.save();
                                            context
                                                .read(loginNotifierProvider
                                                    .notifier)
                                                .login(
                                                    context,
                                                    username.value.trim(),
                                                    password.value);
                                          },
                                    title: Text(
                                      vm is LoginLoading
                                          ? 'Signing you in...'
                                          : 'Sign in',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: Sizes.TEXT_SIZE_16),
                                    ));
                              }),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: 40,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text(
                        //       'Verify Account',
                        //       textAlign: TextAlign.left,
                        //       overflow: TextOverflow.clip,
                        //       style: theme.headline3!.copyWith(
                        //           color: AppColors.primaryColor,
                        //           fontSize: 13,
                        //           fontWeight: FontWeight.bold),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          onTap: () => context.navigate(ResetPassword()),
                          child: Text(
                            'Forgot Password?',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                            style: theme.headline3!.copyWith(
                                fontSize: 15, color: AppColors.primaryColor),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          onTap: () => context.navigate(RegisterScreen()),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account? ',
                                style: theme.headline3!.copyWith(
                                    fontSize: 15, color: AppColors.black),
                              ),
                              Text(
                                'Register',
                                style: theme.headline3!.copyWith(
                                    fontSize: 15,
                                    color: AppColors.primaryColor),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: 40,
                        // ),
                        // RichText(
                        //   text: TextSpan(
                        //     text: 'Don\'t have an account?',
                        //     style: theme.headline3,
                        //     children: [
                        //       TextSpan(
                        //         text: ' - ',
                        //         style: theme.headline3,
                        //       ),
                        //       TextSpan(
                        //         recognizer: TapGestureRecognizer()
                        //           ..onTap = () => {
                        //                 Navigator.push(
                        //                     context,
                        //                     MaterialPageRoute(
                        //                         builder: (context) =>
                        //                             RegisterScreen()))
                        //               },
                        //         text: "Sign Up",
                        //         style: context.textTheme.headline3!.copyWith(
                        //             fontWeight: FontWeight.w700,
                        //             color: AppColors.primaryColor),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }

  void txtFieldListener(FocusNode focusNode, dynamic colorState) {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        colorState.value = AppColors.primaryColor.withOpacity(0.2);
      } else {
        colorState.value = Color(0xFFF7F7F7);
      }
    });
  }
}
