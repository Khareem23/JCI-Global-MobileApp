import 'package:flutter/material.dart';
import 'package:jci_remit_mobile/utils/nulltext.dart';
import 'package:jci_remit_mobile/values/values.dart';

Widget popup(context, message) {
  showDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      builder: (_) {
        return Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.3,
                padding: EdgeInsets.all(20),
                child: Stack(
                  children: [
                    // Image.asset(
                    //     "assets/images/coffetti.png"),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 20),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                getText(message),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(height: 10),
                            CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(AppColors.pinkShade1)),
                            SizedBox(height: 10),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
      });
return Dialog();
}
