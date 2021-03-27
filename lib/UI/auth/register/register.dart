import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/auth/register/viewmodels/register_state.dart';
import 'package:jci_remit_mobile/UI/auth/register/viewmodels/register_vm.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/common/custom_checkbox.dart';
import 'package:jci_remit_mobile/common/custom_text_field.dart';
import 'package:jci_remit_mobile/common/snackbar.dart';
import 'package:jci_remit_mobile/values/values.dart';

import 'register_success.dart';

class RegisterScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: false);
    final _formKey = useState(GlobalKey<FormState>());

    final email = useState();
    final password = useState();
    final firstName = useState();
    final lastName = useState();
    final userName = useState();

    final fnameFocusNode = useFocusNode();
    final lnameFocusNode = useFocusNode();
    final emailFocusNode = useFocusNode();
    final pwdFocusNode = useFocusNode();
    final userNameFocusNode = useFocusNode();
    final fnameBgColor = useState(Colors.white);
    final lnameBgColor = useState(Colors.white);
    final emailBgColor = useState(Colors.white);
    final pwdBgColor = useState(Colors.white);
    final userNameBgColor = useState(Colors.white);
    final ispwdShown = useState(false);
    final tos = useState(false);
    txtFieldListener(fnameFocusNode, fnameBgColor);
    txtFieldListener(lnameFocusNode, lnameBgColor);
    txtFieldListener(emailFocusNode, emailBgColor);
    txtFieldListener(pwdFocusNode, pwdBgColor);
    var theme = Theme.of(context).textTheme;

    return ProviderListener<RegisterState>(
      provider: registerNotifierProvider.state,
      onChange: (context, state) {
        if (state is RegisterSuccess) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => RegisterSuccessScreen()));
        }
        if (state is RegisterError) {
          AppSnackBar.showErrorSnackBar(context, message: state.message);
        }
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(),
          // resizeToAvoidBottomPadding: true,
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(30),
              child: Form(
                key: _formKey.value,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome!',
                      style: theme.headline2,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(30),
                    ),
                    Text(
                      'Please provide following\ndetails for your new account',
                      textAlign: TextAlign.center,
                      style: theme.headline3,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(60),
                    ),
                    CustomTextFormField(
                      onChanged: (v) => firstName.value = v,
                      focusNode: fnameFocusNode,
                      fillColor: fnameBgColor.value,
                      textInputType: TextInputType.text,
                      hintText: 'First Name',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'First Name is required';
                        }

                        // validator has to return something :)
                        return null;
                      },
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    CustomTextFormField(
                      focusNode: lnameFocusNode,
                      fillColor: lnameBgColor.value,
                      onChanged: (v) => lastName.value = v,
                      textInputType: TextInputType.text,
                      hintText: 'Last Name',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Last Name is required';
                        }

                        // validator has to return something :)
                        return null;
                      },
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    CustomTextFormField(
                      focusNode: userNameFocusNode,
                      fillColor: userNameBgColor.value,
                      onChanged: (v) => userName.value = v,
                      textInputType: TextInputType.text,
                      hintText: 'Username',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Username is required';
                        }

                        // validator has to return something :)
                        return null;
                      },
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    CustomTextFormField(
                      focusNode: emailFocusNode,
                      fillColor: emailBgColor.value,
                      onChanged: (v) => email.value = v,
                      textInputType: TextInputType.text,
                      hintText: 'Email Address',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Email Address is required';
                        }

                        if (!RegExp(
                                "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
                            .hasMatch(value)) {
                          return 'Enter a valid email address';
                        }

                        // validator has to return something :)
                        return null;
                      },
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    CustomTextFormField(
                      focusNode: pwdFocusNode,
                      fillColor: pwdBgColor.value,
                      onChanged: (v) => password.value = v,
                      textInputType: TextInputType.text,
                      obscured: !ispwdShown.value,
                      hintText: 'Password',
                      hasSuffixIcon: true,
                      suffixIcon: IconButton(
                          icon: Icon(
                              ispwdShown.value ? Feather.eye_off : Feather.eye),
                          onPressed: () =>
                              ispwdShown.value = !ispwdShown.value),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Password is required';
                        }

                        // validator has to return something :)
                        return null;
                      },
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(10),
                    ),
                    Text(
                      'Minimum of 8 characters with at least 1 uppercase, 1 lowercase and 1 digit.',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style: theme.headline3
                          .copyWith(fontSize: 13, color: Colors.grey.shade500),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(60),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  //height: 60,
                                  // width: MediaQuery.of(context).size.width,
                                  child: CustomCheckbox(
                                isChecked: tos.value,
                                selectedColor:
                                    AppColors.primaryColor.withOpacity(0.5),
                                size: 25,
                                onSelect: (bool value) => tos.value = value,
                              ))
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'By creating your account you have to agree with our Terms and Conditions.',
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.clip,
                                  style: theme.headline3.copyWith(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(50),
                    ),
                    Consumer(
                      builder: (context, watch, _) {
                        final vm = watch(registerNotifierProvider.state);
                        return CustomButton(
                            width: MediaQuery.of(context).size.width,
                            onPressed: vm is RegisterLoading
                                ? null
                                : () {
                                    if (!_formKey.value.currentState
                                        .validate()) {
                                      return null;
                                    }
                                    _formKey.value.currentState.save();
                                    if (!tos.value) {
                                      return AppSnackBar.showErrorSnackBar(
                                          context,
                                          message:
                                              "Looks like you must agree with our terms and conditions to continue. Click on the checkbox to agree.");
                                    }
                                    context
                                        .read(registerNotifierProvider)
                                        .register(
                                          context,
                                          email.value.trim(),
                                          firstName.value.trim(),
                                          lastName.value.trim(),
                                          password.value,
                                          userName.value.trim(),
                                        );
                                  },
                            title: Text(
                              vm is RegisterLoading
                                  ? 'Signing up your Account...'
                                  : 'Sign up my Account',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.TEXT_SIZE_16),
                            ));
                      },
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(40),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Already have an account?',
                        style: Theme.of(context).textTheme.headline3,
                        children: [
                          TextSpan(
                            text: ' - ',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => {},
                            text: "Sign In",
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                .copyWith(fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  void txtFieldListener(FocusNode focusNode, dynamic colorState) {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        colorState.value = AppColors.primaryColor.withOpacity(0.2);
      } else {
        colorState.value = Colors.white;
      }
    });
  }
}
