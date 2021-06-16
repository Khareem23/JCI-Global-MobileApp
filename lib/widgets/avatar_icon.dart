import 'package:flutter/material.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:jci_remit_mobile/utils/theme.dart';

class AvatarIcon extends StatelessWidget {
  final String text;

  const AvatarIcon({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = context.themeData.textTheme;
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: AppColors.black.withOpacity(0.2),
              offset: Offset(0.0, 6.0),
              blurRadius: 15.0)
        ],
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: theme.headline3!.copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
