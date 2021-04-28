import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jci_remit_mobile/values/values.dart';

class CustomTextFormField extends StatelessWidget {
  final TextStyle textStyle;
  final TextStyle hintTextStyle;
  final TextStyle labelStyle;
  final TextStyle titleStyle;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  final String labelText;
  final String errorText;
  final String title;
  final bool obscured;
  final bool hasPrefixIcon;
  final bool hasSuffixIcon;
  final bool hasTitle;
  final bool hasTitleIcon;
  final Widget titleIcon;
  final FocusNode focusNode;
  final Color fillColor;
  final TextInputType textInputType;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final List<TextInputFormatter> inputFormatters;
  final InputBorder border;
  final InputBorder enabledBorder;
  final InputBorder focusedBorder;
  final double width;
  final double height;
  final EdgeInsetsGeometry contentPadding;
  final EdgeInsetsGeometry textFormFieldMargin;
  final int maxlines;
  final int maxlength;
  final TextEditingController controller;
  final bool readOnly;
  final VoidCallback onTap;
  final Key key;

  CustomTextFormField(
      {this.prefixIcon,
      this.suffixIcon,
      this.textStyle,
      this.hintTextStyle = const TextStyle(
          color: Color(0xFF2C2948), fontSize: 15, fontWeight: FontWeight.w400),
      this.labelStyle,
      this.titleStyle,
      this.titleIcon,
      this.hasTitleIcon = false,
      this.title,
      this.contentPadding,
      this.textFormFieldMargin,
      this.hasTitle = false,
      this.border = Borders.primaryInputBorder,
      this.focusedBorder = Borders.focusedBorder,
      this.enabledBorder = Borders.enabledBorder,
      this.hintText,
      this.labelText,
      this.hasPrefixIcon = false,
      this.hasSuffixIcon = false,
      this.obscured = false,
      this.textInputType,
      this.onChanged,
      this.validator,
      this.inputFormatters,
      this.width,
      this.height,
      this.maxlines = 1,
      this.controller,
      this.key,
      this.readOnly = false,
      this.onTap,
      this.errorText,
      this.focusNode,
      this.maxlength,
      this.fillColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            hasTitleIcon ? titleIcon : Container(),
            hasTitle ? Text(title, style: titleStyle) : Container(),
          ],
        ),
//        hasTitle ? SpaceH4() : Container(),
        Container(
          key: key,
          width: width,
          height: height,
          margin: textFormFieldMargin,
          child: TextFormField(
            autofocus: false,
            maxLength: maxlength,
            focusNode: focusNode,
            onTap: onTap,
            style: textStyle,
            cursorColor: AppColors.primaryColor,
            keyboardType: textInputType,
            onChanged: onChanged,
            validator: validator,
            maxLines: maxlines,
            inputFormatters: inputFormatters,
            controller: controller,
            readOnly: readOnly,
            decoration: InputDecoration(
                filled: true,
                fillColor: fillColor,
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                labelText: labelText,
                labelStyle: labelStyle,
                border: Borders.customOutlineInputBorder(),
                enabledBorder: Borders.customOutlineInputBorder(),
                focusedBorder: Borders.customOutlineInputBorder(
                    color: AppColors.primaryColor),
                focusColor: AppColors.accentColor.withOpacity(0.8),
                prefixIcon: hasPrefixIcon ? prefixIcon : null,
                suffixIcon: hasSuffixIcon ? suffixIcon : null,
                hintText: hintText,
                hintStyle: hintTextStyle,
                errorText: errorText),
            obscureText: obscured,
          ),
        ),
      ],
    );
  }
}
