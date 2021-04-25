import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:jci_remit_mobile/common/custom_text_field.dart';
import 'package:jci_remit_mobile/values/values.dart';

class AddressInfo extends HookWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: false);
    final _formKey = useState(GlobalKey<FormState>());

    final email = useState();
    final password = useState();
    final firstName = useState();
    final lastName = useState();
    final userName = useState();

    final fnameFocusNode = useFocusNode();
    final lnameFocusNode = useFocusNode();
    final emailFocusNode = useFocusNode();
    final pwdFocusNode = useFocusNode();
    final userNameFocusNode = useFocusNode();
    final fnameBgColor = useState(Colors.white);
    final lnameBgColor = useState(Colors.white);
    final emailBgColor = useState(Colors.white);
    final pwdBgColor = useState(Colors.white);
    final userNameBgColor = useState(Colors.white);
    final ispwdShown = useState(false);
    final tos = useState(false);
    txtFieldListener(fnameFocusNode, fnameBgColor);
    txtFieldListener(lnameFocusNode, lnameBgColor);
    txtFieldListener(emailFocusNode, emailBgColor);
    txtFieldListener(pwdFocusNode, pwdBgColor);
    var theme = Theme.of(context).textTheme;
    return Form(
      key: _formKey.value,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Enter your address information',
            textAlign: TextAlign.left,
            overflow: TextOverflow.clip,
            style: theme.headline3
                .copyWith(fontSize: 13, color: Colors.grey.shade500),
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            onChanged: (v) => firstName.value = v,
            focusNode: fnameFocusNode,
            fillColor: fnameBgColor.value,
            textInputType: TextInputType.text,
            hintText: 'Country',
            validator: (String value) {
              if (value.isEmpty) {
                return 'Country is required';
              }

              // validator has to return something :)
              return null;
            },
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          CustomTextFormField(
            focusNode: lnameFocusNode,
            fillColor: lnameBgColor.value,
            onChanged: (v) => lastName.value = v,
            textInputType: TextInputType.text,
            hintText: 'State/Region',
            validator: (String value) {
              if (value.isEmpty) {
                return 'State/Region';
              }

              // validator has to return something :)
              return null;
            },
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          CustomTextFormField(
            focusNode: emailFocusNode,
            fillColor: emailBgColor.value,
            onChanged: (v) => email.value = v,
            textInputType: TextInputType.text,
            hintText: 'Address',
            validator: (String value) {
              if (value.isEmpty) {
                return 'Address is required';
              }

              // validator has to return something :)
              return null;
            },
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          CustomTextFormField(
            focusNode: userNameFocusNode,
            fillColor: userNameBgColor.value,
            onChanged: (v) => userName.value = v,
            textInputType: TextInputType.text,
            hintText: 'Postal Code',
            validator: (String value) {
              if (value.isEmpty) {
                return 'Postal Code is required';
              }

              // validator has to return something :)
              return null;
            },
          ),
          SizedBox(
            height: ScreenUtil().setHeight(60),
          ),
        ],
      ),
    );
  }
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
