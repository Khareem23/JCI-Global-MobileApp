import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:jci_remit_mobile/values/values.dart';

class ItemIcon extends StatelessWidget {
  final String text;

  const ItemIcon({Key key, @required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
        child: Icon(
          text == 'SELL' ? Feather.arrow_up : Feather.arrow_down,
          color: AppColors.primaryColor.withOpacity(0.5),
        ),
      ),
    );
  }
}
