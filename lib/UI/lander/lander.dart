import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jci_remit_mobile/UI/auth/login/login.dart';
import 'package:jci_remit_mobile/UI/auth/mobile/mobile_auth_screen.dart';
import 'package:jci_remit_mobile/UI/auth/register/register.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/utils/extensions.dart';
import 'package:jci_remit_mobile/utils/navigator.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:jci_remit_mobile/utils/theme.dart';

class LanderScreen extends StatelessWidget {
  const LanderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = context.themeData.textTheme;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Container(
          height: context.screenHeight(1),
          width: context.screenWidth(1),
          color: Colors.white,
          padding: EdgeInsets.all(20),
          // height: context.screenHeight(1),
          // width: context.screenWidth(1),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                ),
                Image.asset(
                  'assets/images/logo.png',
                  height: 200,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Cross-border',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  'Money Transfer',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Made Easy. ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                Spacer(),
                CustomButton(
                    color: AppColors.primaryColor,
                    width: MediaQuery.of(context).size.width,
                    onPressed: () {
                      context.navigate(LoginScreen());
                    },
                    title: Text(
                      'Sign In with Email',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: Sizes.TEXT_SIZE_16),
                    )),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                    color: AppColors.grey,
                    width: MediaQuery.of(context).size.width,
                    onPressed: () {
                      context.navigate(RegisterScreen());
                    },
                    title: Text(
                      'Sign Up with Email',
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: Sizes.TEXT_SIZE_16),
                    )),
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    text: "Can't login yet?",
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
                                // context.navigate(MobileAuthScreen())
                              },
                        text: "Activate Your Account!",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.underline),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Text(
                //             'Verify Account',
                //             textAlign: TextAlign.left,
                //             overflow: TextOverflow.clip,
                //             style: theme.headline3!.copyWith(
                //                 color: AppColors.primaryColor,
                //                 fontSize: 13,
                //                 fontWeight: FontWeight.bold),
                //           ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
