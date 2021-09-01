import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/auth/login/login.dart';
import 'package:jci_remit_mobile/UI/auth/mobile/viewmodels/verify_otp_vm.dart';
import 'package:jci_remit_mobile/UI/lander/lander.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/common/pin_code_fields/pin_code_fields.dart';
import 'package:jci_remit_mobile/common/snackbar.dart';
import 'package:jci_remit_mobile/controllers/auth_controller.dart';
import 'package:jci_remit_mobile/utils/navigator.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:pinput/pin_put/pin_put.dart';

import 'viewmodels/verify_otp_state.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({Key? key}) : super(key: key);
  @override
  _VerifyOTPScreenState createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final formKey = GlobalKey<FormState>();
  late StreamController<ErrorAnimationType> errorController;
  final FocusNode _pinPutFocusNode = FocusNode();
  TextEditingController _pinPutController = TextEditingController();
  String text = '';
  String currentText = "";
  bool isCompleted = false;
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = context.themeData.textTheme;
    return ProviderListener(
      provider: verifyOtpProvider,
      onChange: (context, state) {
        if (state is VerifyOtpSent) {
          // Navigator.of(context).pop();
          context
              .read(authControllerProvider.notifier)
              .auth(AuthenticationStatus.authenticated);

          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => MobileAuthScreen()));
        }
        if (state is VerifyOtpError) {
          AppSnackBar.showErrorSnackBar(context, message: state.message);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: AppColors.primaryColor,
        // ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding:
                  EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 60),
              child: Column(
                children: [
                  Image.asset('assets/images/logo.png', height: 100),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Login with PIN',
                    style: theme.headline2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Enter your 6-digit pin',
                      style: theme.headline3,
                      children: [
                        TextSpan(
                          text: "",
                          style: theme.headline3!
                              .copyWith(fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    // color: Colors.white,
                    // margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.all(20.0),
                    child: PinPut(
                      fieldsCount: 6,
                      onSubmit: (String pin) => context
                          .read(verifyOtpProvider.notifier)
                          .validateOtp(pin),
                      focusNode: _pinPutFocusNode,
                      controller: _pinPutController,
                      submittedFieldDecoration: _pinPutDecoration.copyWith(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      selectedFieldDecoration: _pinPutDecoration,
                      followingFieldDecoration: _pinPutDecoration.copyWith(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.deepPurpleAccent.withOpacity(.5),
                        ),
                      ),
                    ),
                  ),
                  // Spacer(),
                  SizedBox(
                    height: 20,
                  ),
                  Consumer(builder: (context, watch, _) {
                    final vm = watch(verifyOtpProvider);
                    return CustomButton(
                        width: MediaQuery.of(context).size.width,
                        onPressed: vm is VerifyOtpSending
                            ? null
                            : () {
                                if (!formKey.currentState!.validate()) {
                                  return null;
                                }
                                formKey.currentState!.save();
                                // if (!isCompleted)
                                //   return AppSnackBar.showErrorSnackBar(context,
                                //       message:
                                //           'Looks like you didn\'t enter your OTP correctly');

                                context
                                    .read(verifyOtpProvider.notifier)
                                    .validateOtp(currentText);
                              },
                        title: Text(
                          vm is VerifyOtpSending
                              ? 'Verifying your Account...'
                              : 'Proceed',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: Sizes.TEXT_SIZE_16),
                        ));
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Can't login?",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                      ),
                      children: [
                        TextSpan(
                          text: ' - ',
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => {
                                  context.navigateReplaceRoot(LoginScreen())
                                  // context.navigate(MobileAuthScreen())
                                },
                          text: "Login with email instead",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              decoration: TextDecoration.underline),
                        )
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // RichText(
                  //   textAlign: TextAlign.center,
                  //   text: TextSpan(
                  //     text: 'By clicking start, you agree to our ',
                  //     style: theme.headline3,
                  //     children: [
                  //       TextSpan(
                  //         text: "Privacy Policy",
                  //         style: theme.headline3!.copyWith(
                  //             decoration: TextDecoration.underline,
                  //             fontWeight: FontWeight.w700,
                  //             color: AppColors.primaryColor),
                  //       ),
                  //       TextSpan(
                  //         text: " and our ",
                  //         style: theme.headline3,
                  //       ),
                  //       TextSpan(
                  //         text: "Terms and conditions",
                  //         style: theme.headline3!.copyWith(
                  //             decoration: TextDecoration.underline,
                  //             fontWeight: FontWeight.w700,
                  //             color: AppColors.primaryColor),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
