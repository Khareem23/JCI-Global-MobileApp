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
            child: Stack(
              children: [
                Container(
                    height: context.screenHeight(1),
                    width: context.screenWidth(1),
                    child: Image.asset("assets/images/welcome.png",
                        fit: BoxFit.cover)),
                Container(
                    height: context.screenHeight(1),
                    width: context.screenWidth(1),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: RaisedButton(
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              child: Text("REGISTER",
                                  style: TextStyle(
                                    fontSize: Sizes.TEXT_SIZE_16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red.shade900,
                                  )),
                              color: Colors.white,
                              onPressed: () =>
                                  context.navigate(RegisterScreen())),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: RaisedButton(
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                  side:
                                      BorderSide(width: 2, color: Colors.white),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Text("LOG IN",
                                  style: TextStyle(
                                    fontSize: Sizes.TEXT_SIZE_16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  )),
                              color: Colors.transparent,
                              onPressed: () => context.navigate(LoginScreen())),
                        ),
                        SizedBox(height: 30),
                      ],
                    ))
              ],
            )),
      ),
    );
  }
}
