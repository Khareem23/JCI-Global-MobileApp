import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:jci_remit_mobile/utils/theme.dart';

class RegisterSuccessScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var theme = context.themeData.textTheme;
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 40),
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Image.asset(
            'assets/icons/thumbs_up.png',
            scale: 2,
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            'Account Created!',
            style: theme.headline2,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Dear user your account has been created successfully. Continue to start using app',
            textAlign: TextAlign.center,
            style: theme.headline3,
          ),
          Spacer(),
          Consumer(builder: (context, watch, _) {
            return CustomButton(
                width: MediaQuery.of(context).size.width,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                title: Text(
                  'Proceed',
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
                  style: theme.headline3!.copyWith(
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
                  style: theme.headline3!.copyWith(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
