import 'package:flutter/material.dart';
import 'package:jci_remit_mobile/values/values.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.title,
    this.onPressed,
    this.width = Sizes.WIDTH_100,
    this.height = Sizes.HEIGHT_60,
    this.elevation = Sizes.ELEVATION_1,
    this.borderRadius = Sizes.RADIUS_10,
    this.color = AppColors.primaryColor,
    this.borderSide = Borders.defaultPrimaryBorder,
    this.textStyle,
  });

  final VoidCallback? onPressed;
  final double width;
  final double height;
  final double elevation;
  final double borderRadius;
  final Widget title;
  final Color color;
  final BorderSide borderSide;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: onPressed == null ? Colors.grey : color),
          child: Center(child: title)),
    );
  }
}
