import 'package:flutter/material.dart';
import 'package:jci_remit_mobile/values/values.dart';

class CustomCheckbox extends StatefulWidget {
  final bool? isChecked;
  final double? size;
  final double? iconSize;
  final Color? selectedColor;
  final Color? selectedIconColor;
  final ValueChanged<bool> onSelect;

  CustomCheckbox(
      {this.isChecked,
      required this.onSelect,
      this.size,
      this.iconSize,
      this.selectedColor,
      this.selectedIconColor});

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isSelected = false;

  @override
  void initState() {
    _isSelected = widget.isChecked ?? false;
    super.initState();
  }

  void _onTap() {
    setState(() {
      _isSelected = !_isSelected;
    });
    widget.onSelect(_isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onTap();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
            color: _isSelected
                ? widget.selectedColor ?? Colors.blue
                : Colors.transparent,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: AppColors.primaryColor,
              width: 2.0,
            )),
        width: widget.size ?? 30,
        height: widget.size ?? 30,
        child: _isSelected
            ? Icon(
                Icons.check,
                color: widget.selectedIconColor ?? Colors.white,
                size: widget.iconSize ?? 20,
              )
            : null,
      ),
    );
  }
}
