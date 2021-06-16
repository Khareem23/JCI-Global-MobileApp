import 'package:flutter/material.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AppSnackBar {
  // static void showSuccessSnackBar(BuildContext context,
  //     {required String message,
  //     int milliseconds = 10000,
  //     SnackBarBehavior snackBarBehavior = SnackBarBehavior.floating}) {
  //   Flushbar(
  //     title: "Success",
  //     flushbarPosition: FlushbarPosition.TOP,
  //     flushbarStyle: FlushbarStyle.FLOATING,
  //     reverseAnimationCurve: Curves.decelerate,
  //     forwardAnimationCurve: Curves.elasticOut,
  //     backgroundColor: Colors.black,
  //     boxShadows: [
  //       BoxShadow(
  //           color: AppColors.black, offset: Offset(0.0, 2.0), blurRadius: 3.0)
  //     ],
  //     backgroundGradient:
  //         LinearGradient(colors: [AppColors.green, Colors.greenAccent]),
  //     isDismissible: true,
  //     duration: Duration(seconds: 4),
  //     icon: Icon(
  //       Icons.error,
  //       color: AppColors.white,
  //     ),
  //     leftBarIndicatorColor: Colors.black,
  //     messageText: Text(
  //       '$message',
  //       style: TextStyle(
  //           color: AppColors.white,
  //           fontSize: Sizes.TEXT_SIZE_14,
  //           fontWeight: FontWeight.w300),
  //     ),
  //   )..show(context);
  // }

  // static void showErrorSnackBar(BuildContext context,
  //     {required String message,
  //     int milliseconds = 10000,
  //     SnackBarBehavior snackBarBehavior = SnackBarBehavior.floating}) {
  //   Flushbar(
  //     title: "Oh no!",
  //     flushbarPosition: FlushbarPosition.TOP,
  //     flushbarStyle: FlushbarStyle.FLOATING,
  //     reverseAnimationCurve: Curves.decelerate,
  //     forwardAnimationCurve: Curves.elasticOut,
  //     backgroundColor: Colors.red,
  //     boxShadows: [
  //       BoxShadow(
  //           color: AppColors.red, offset: Offset(0.0, 2.0), blurRadius: 3.0)
  //     ],
  //     backgroundGradient:
  //         LinearGradient(colors: [AppColors.red, Colors.redAccent]),
  //     isDismissible: true,
  //     duration: Duration(seconds: 4),
  //     icon: Icon(
  //       Icons.error,
  //       color: AppColors.white,
  //     ),
  //     // mainButton: FlatButton(
  //     //   onPressed: null,
  //     //   child: Text(
  //     //     "DISMISS",
  //     //     style: TextStyle(color: Colors.white),
  //     //   ),
  //     // ),
  //     leftBarIndicatorColor: Colors.black,
  //     messageText: Text(
  //       '$message',
  //       style: TextStyle(
  //           color: AppColors.white,
  //           fontSize: Sizes.TEXT_SIZE_14,
  //           fontWeight: FontWeight.w300),
  //     ),
  //   )..show(context);
  // }
  static void showErrorSnackBar(BuildContext context,
      {required String message}) {
    showTopSnackBar(
      context,
      CustomSnackBar.error(
        message: message,
      ),
    );
  }

  static void showSuccessSnackBar(BuildContext context,
      {required String message}) {
    showTopSnackBar(
      context,
      CustomSnackBar.success(
        message: message,
      ),
    );
  }

  static void showInfoSnackBar(BuildContext context,
      {required String message}) {
    showTopSnackBar(
      context,
      CustomSnackBar.info(
        message: message,
      ),
    );
  }
}
