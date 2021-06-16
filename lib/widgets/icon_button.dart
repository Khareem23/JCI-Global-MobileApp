import 'package:flutter/material.dart';
import 'package:jci_remit_mobile/values/values.dart';

class IconButtonAction extends StatelessWidget {
  final IconData icon;

  const IconButtonAction({Key? key, required this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: AppColors.accentColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
