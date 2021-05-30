import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/auth/mobile/viewmodels/verify_otp_vm.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/common/pin_code_fields/pin_code_fields.dart';
import 'package:jci_remit_mobile/common/snackbar.dart';
import 'package:jci_remit_mobile/controllers/auth_controller.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:jci_remit_mobile/utils/theme.dart';

import 'viewmodels/verify_otp_state.dart';

class VerifyOTPScreen extends StatefulWidget {
  final String phone;

  const VerifyOTPScreen({Key key, @required this.phone}) : super(key: key);
  @override
  _VerifyOTPScreenState createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final formKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType> errorController;
  TextEditingController textEditingController = TextEditingController();
  String text = '';
  String currentText = "";
  bool isCompleted = false;
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
      provider: verifyOtpProvider.state,
      onChange: (context, state) {
        if (state is VerifyOtpSent) {
          Navigator.of(context).pop();
          context
              .read(authControllerProvider)
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
        appBar: AppBar(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 40),
          child: Column(
            children: [
              Text(
                'Verify Account!',
                style: theme.headline2,
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Enter the 4-digit code we sent to you at\n',
                  style: theme.headline3,
                  children: [
                    TextSpan(
                      text: "${widget.phone}",
                      style:
                          theme.headline3.copyWith(fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Form(
                key: formKey,
                child: PinCodeTextField(
                  length: 6,
                  cursorColor: AppColors.accentColor,
                  textStyle: theme.headline2,
                  //obsecureText: false,
                  //autoFocus: true,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  autoDismissKeyboard: true,
                  animationType: AnimationType.scale,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    fieldHeight: 50,
                    fieldWidth: 48,
                    borderWidth: 3.0,
                    inactiveColor: AppColors.accentColor,
                    activeFillColor: Colors.white,
                    selectedFillColor: AppColors.primaryColor,
                    selectedColor: AppColors.primaryColor,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  // backgroundColor: Colors.blue.shade50,
                  errorAnimationController: errorController,
                  controller: textEditingController,
                  // enableActiveFill: true,
                  onCompleted: (v) {
                    print("Completed");
                    setState(() {
                      isCompleted = true;
                    });
                    // context.read(currentAuthProvider).authenticate2FA(
                    //     currentText, context, args.authType);
                  },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      if (value.length != 6) {
                        isCompleted = false;
                      }
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    return false;
                  },
                  appContext: context,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Did not receive the code?',
                textAlign: TextAlign.center,
                style: theme.headline3,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Resend Code',
                textAlign: TextAlign.center,
                style: theme.headline3.copyWith(
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor),
              ),
              Spacer(),
              Consumer(builder: (context, watch, _) {
                final vm = watch(verifyOtpProvider.state);
                return CustomButton(
                    width: MediaQuery.of(context).size.width,
                    onPressed: vm is VerifyOtpSending
                        ? null
                        : () {
                            if (!formKey.currentState.validate()) {
                              return null;
                            }
                            formKey.currentState.save();
                            if (!isCompleted)
                              return AppSnackBar.showErrorSnackBar(context,
                                  message:
                                      'Looks like you didn\'t enter your OTP correctly');

                            context
                                .read(verifyOtpProvider)
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
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'By clicking start, you agree to our ',
                  style: theme.headline3,
                  children: [
                    TextSpan(
                      text: "Privacy Policy",
                      style: theme.headline3.copyWith(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor),
                    ),
                    TextSpan(
                      text: " and our ",
                      style: theme.headline3,
                    ),
                    TextSpan(
                      text: "Terms and conditions",
                      style: theme.headline3.copyWith(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
