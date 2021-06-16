import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/auth/login/viewmodel/login_state.dart';
import 'package:jci_remit_mobile/UI/auth/login/viewmodel/login_vm.dart';
import 'package:jci_remit_mobile/UI/auth/register/register.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/common/custom_text_field.dart';
import 'package:jci_remit_mobile/common/snackbar.dart';
import 'package:jci_remit_mobile/controllers/auth_controller.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/values/values.dart';

class LoginScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _tabController = useTabController(initialLength: 2);
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
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 140,
                    ),
                    Text(
                      'JCI Mobile',
                      style: context.textTheme.headline2!
                          .copyWith(color: AppColors.primaryColor),
                    ),
                    // SizedBox(
                    //   height: ScreenUtil().setHeight(30),
                    // ),
                    Text(
                      'Send money to accross the world',
                      textAlign: TextAlign.center,
                      style: theme.headline3,
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        controller: _tabController,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: AppColors.primaryColor,
                        tabs: [
                          Tab(
                            // icon: Icon(Icons.email, color: AppColors.colorShade2),
                            child: Text(
                              'Email',
                              style: TextStyle(color: Colors.black87),
                            ),
                          ),
                          Tab(
                            child: Text('Pin',
                                style: TextStyle(color: Colors.black87)),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.all(20),
                              child: Form(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                key: _formKey.value,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                      onChanged: (value) =>
                                          {username.value = value},
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
                                      onChanged: (value) =>
                                          {password.value = value},
                                      textInputType: TextInputType.text,
                                      obscured: !ispwdShown.value,
                                      hintText: 'Password',
                                      hasSuffixIcon: true,
                                      suffixIcon: IconButton(
                                          icon: Icon(ispwdShown.value
                                              ? Feather.eye_off
                                              : Feather.eye),
                                          onPressed: () => ispwdShown.value =
                                              !ispwdShown.value),
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          onPressed: vm is LoginLoading
                                              ? null
                                              : () {
                                                  if (!_formKey
                                                      .value.currentState!
                                                      .validate()) {
                                                    return null;
                                                  }
                                                  _formKey.value.currentState!
                                                      .save();
                                                  context
                                                      .read(
                                                          loginNotifierProvider
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
                            ),
                          ),
                          SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.all(30),
                              child: Form(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                key: _formKey.value,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Sign in with pin',
                                          textAlign: TextAlign.center,
                                          style: theme.headline3,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    CustomTextFormField(
                                      focusNode: pwdFocusNode,
                                      fillColor: pwdBgColor.value,
                                      onChanged: (value) =>
                                          {password.value = value},
                                      textInputType: TextInputType.text,
                                      obscured: !ispwdShown.value,
                                      hintText: 'Enter your 6 digit pin',
                                      hasSuffixIcon: true,
                                      suffixIcon: IconButton(
                                          icon: Icon(ispwdShown.value
                                              ? Feather.eye_off
                                              : Feather.eye),
                                          onPressed: () => ispwdShown.value =
                                              !ispwdShown.value),
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Pin is required';
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
                                      print(vm);
                                      return CustomButton(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          onPressed: vm is LoginLoading
                                              ? null
                                              : () {
                                                  if (!_formKey
                                                      .value.currentState!
                                                      .validate()) {
                                                    return null;
                                                  }
                                                  _formKey.value.currentState!
                                                      .save();
                                                  context
                                                      .read(
                                                          loginNotifierProvider
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
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Verify Account',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.clip,
                          style: theme.headline3!.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Forgot Password?',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.clip,
                          style: theme.headline3!.copyWith(
                              fontSize: 13, color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account?',
                        style: theme.headline3,
                        children: [
                          TextSpan(
                            text: ' - ',
                            style: theme.headline3,
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterScreen()))
                                  },
                            text: "Sign Up",
                            style: context.textTheme.headline3!.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryColor),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
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
