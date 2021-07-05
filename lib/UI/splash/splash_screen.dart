import 'package:flutter/material.dart';
import 'package:jci_remit_mobile/utils/extensions.dart';
import 'package:jci_remit_mobile/utils/theme.dart';

class SplashScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: context.screenWidth(1),
          height: context.screenHeight(1),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xff790300), Color(0xff790300), Color(0xff440100)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.4, 0.9],
          )),
          child: Center(
              child: Text(
            'JCI Remit Mobile',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ))),
    );
  }
}
