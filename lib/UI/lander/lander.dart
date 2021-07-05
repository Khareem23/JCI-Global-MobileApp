import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jci_remit_mobile/UI/auth/login/login.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/utils/extensions.dart';
import 'package:jci_remit_mobile/utils/navigator.dart';
import 'package:jci_remit_mobile/values/values.dart';

class LanderScreen extends StatelessWidget {
  const LanderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xff790300), Color(0xff790300), Color(0xff440100)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.4, 0.9],
        )),
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
              SvgPicture.asset(
                'assets/images/svg/transfer_money.svg',
                height: 200,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Send your Money',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'Across The World',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'To multiple countries.\nSeamlessly. ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white54),
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
                  color: AppColors.white,
                  width: MediaQuery.of(context).size.width,
                  onPressed: () {},
                  title: Text(
                    'Sign Up with Email',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Sizes.TEXT_SIZE_16),
                  )),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
