import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:jci_remit_mobile/common/custom_text_field.dart';
import 'package:jci_remit_mobile/values/values.dart';

class SecurityInfoScreen extends HookWidget {
  final GlobalKey<FormState> formKey;

  SecurityInfoScreen({@required this.formKey});
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: false);

    final password = useState();
    final confirmPassword = useState();
    final pin = useState();

    final confirmPasswordFocusNode = useFocusNode();
    final pinFocusNode = useFocusNode();
    final pwdFocusNode = useFocusNode();
    final confirmPasswordBgColor = useState(Colors.white);
    final pinBgColor = useState(Colors.white);
    final pwdBgColor = useState(Colors.white);
    final ispwdShown = useState(false);
    final iscpwdShown = useState(false);
    final ispinShown = useState(false);
    txtFieldListener(confirmPasswordFocusNode, confirmPasswordBgColor);
    txtFieldListener(pinFocusNode, pinBgColor);
    txtFieldListener(pwdFocusNode, pwdBgColor);
    var theme = Theme.of(context).textTheme;
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Secure your account',
            textAlign: TextAlign.left,
            overflow: TextOverflow.clip,
            style: theme.headline3
                .copyWith(fontSize: 13, color: Colors.grey.shade500),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          CustomTextFormField(
            focusNode: pwdFocusNode,
            fillColor: pwdBgColor.value,
            onChanged: (v) => password.value = v,
            textInputType: TextInputType.text,
            obscured: !ispwdShown.value,
            hintText: 'Password',
            hasSuffixIcon: true,
            suffixIcon: IconButton(
                icon: Icon(ispwdShown.value ? Feather.eye_off : Feather.eye),
                onPressed: () => ispwdShown.value = !ispwdShown.value),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Password is required';
              }

              // validator has to return something :)
              return null;
            },
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          CustomTextFormField(
            focusNode: confirmPasswordFocusNode,
            fillColor: confirmPasswordBgColor.value,
            onChanged: (v) => confirmPassword.value = v,
            textInputType: TextInputType.text,
            obscured: !iscpwdShown.value,
            hintText: 'Confirm Password',
            hasSuffixIcon: true,
            suffixIcon: IconButton(
                icon: Icon(iscpwdShown.value ? Feather.eye_off : Feather.eye),
                onPressed: () => iscpwdShown.value = !iscpwdShown.value),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Password is required';
              }

              // validator has to return something :)
              return null;
            },
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          CustomTextFormField(
            focusNode: pinFocusNode,
            fillColor: pinBgColor.value,
            onChanged: (v) => pin.value = v,
            textInputType: TextInputType.number,
            obscured: !ispinShown.value,
            hintText: 'Enter a 6-digit Pin',
            hasSuffixIcon: true,
            suffixIcon: IconButton(
                icon: Icon(ispinShown.value ? Feather.eye_off : Feather.eye),
                onPressed: () => ispinShown.value = !ispinShown.value),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Pin is required';
              }

              // validator has to return something :)
              return null;
            },
          ),
          Text(
            'Minimum of 8 characters with at least 1 uppercase, 1 lowercase and 1 digit.',
            textAlign: TextAlign.left,
            overflow: TextOverflow.clip,
            style: theme.headline3
                .copyWith(fontSize: 13, color: Colors.grey.shade500),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(60),
          ),
        ],
      ),
    );
  }

  void txtFieldListener(FocusNode focusNode, dynamic colorState) {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        colorState.value = AppColors.primaryColor.withOpacity(0.2);
      } else {
        colorState.value = Colors.white;
      }
    });
  }
}
