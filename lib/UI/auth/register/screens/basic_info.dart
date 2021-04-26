import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:jci_remit_mobile/UI/auth/register/register.dart';
import 'package:jci_remit_mobile/common/custom_text_field.dart';
import 'package:jci_remit_mobile/values/values.dart';

class BasicInfoScreen extends HookWidget {
  final GlobalKey<FormState> formKey;

  BasicInfoScreen({@required this.formKey});
  static RegistrationData data = new RegistrationData();
  @override
  Widget build(BuildContext context) {
    var _genders = ['Male', 'Female'];

    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: false);
    final userName = useState();
    final gender = useState('Male');

    final fnameFocusNode = useFocusNode();
    final lnameFocusNode = useFocusNode();
    final emailFocusNode = useFocusNode();
    final phoneFocusNode = useFocusNode();
    final userNameFocusNode = useFocusNode();
    final fnameBgColor = useState(Colors.white);
    final lnameBgColor = useState(Colors.white);
    final emailBgColor = useState(Colors.white);
    final phoneBgColor = useState(Colors.white);
    final userNameBgColor = useState(Colors.white);
    txtFieldListener(phoneFocusNode, phoneBgColor);
    txtFieldListener(fnameFocusNode, fnameBgColor);
    txtFieldListener(lnameFocusNode, lnameBgColor);
    txtFieldListener(emailFocusNode, emailBgColor);
    var theme = Theme.of(context).textTheme;
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Enter your basic information',
            textAlign: TextAlign.left,
            overflow: TextOverflow.clip,
            style: theme.headline3.copyWith(fontSize: 13, color: Colors.grey),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          CustomTextFormField(
            onChanged: (v) => data.firstName = v,
            focusNode: fnameFocusNode,
            fillColor: fnameBgColor.value,
            textInputType: TextInputType.text,
            hintText: 'First Name',
            validator: (String value) {
              if (value.isEmpty) {
                return 'First Name is required';
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
            onChanged: (v) => data.lastName = v,
            textInputType: TextInputType.text,
            hintText: 'Last Name',
            validator: (String value) {
              if (value.isEmpty) {
                return 'Last Name is required';
              }

              // validator has to return something :)
              return null;
            },
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          DateTimeFormField(
            decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.black45),
              errorStyle: TextStyle(color: Colors.redAccent),
              hintText: 'Date of birth',
              filled: true,
              // fillColor: phoneBgColor.value,
              contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(Sizes.RADIUS_8)),
                borderSide: BorderSide(
                  color: AppColors.grey,
                  width: Sizes.WIDTH_1,
                  style: BorderStyle.solid,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(Sizes.RADIUS_8)),
                borderSide: BorderSide(
                  color: AppColors.grey,
                  width: Sizes.WIDTH_1,
                  style: BorderStyle.solid,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(Sizes.RADIUS_8)),
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                  width: Sizes.WIDTH_1,
                  style: BorderStyle.solid,
                ),
              ),
              // focusColor: Color(0xFF262624),
            ),
            mode: DateTimeFieldPickerMode.date,
            autovalidateMode: AutovalidateMode.always,
            validator: (e) =>
                (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
            onDateSelected: (DateTime value) {
              print(value);
              data.dateOfBirth = value.toIso8601String();
            },
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          CustomTextFormField(
            focusNode: emailFocusNode,
            fillColor: emailBgColor.value,
            onChanged: (v) => data.email = v,
            textInputType: TextInputType.text,
            hintText: 'Email Address',
            validator: (String value) {
              if (value.isEmpty) {
                return 'Email Address is required';
              }

              if (!RegExp(
                      "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
                  .hasMatch(value)) {
                return 'Enter a valid email address';
              }

              // validator has to return something :)
              return null;
            },
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          InternationalPhoneNumberInput(
            focusNode: phoneFocusNode,
            onInputChanged: (PhoneNumber number) {
              print(number.phoneNumber);
              data.phoneNumber = number.phoneNumber;
            },
            onInputValidated: (bool value) {
              print(value);
            },
            selectorConfig: SelectorConfig(
              selectorType: PhoneInputSelectorType.DIALOG,
            ),
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: TextStyle(color: Colors.black),
            inputDecoration: InputDecoration(
              hintText: 'Phone',
              filled: true,
              fillColor: phoneBgColor.value,
              contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
              border: Borders.customOutlineInputBorder(),
              enabledBorder: Borders.customOutlineInputBorder(),
              focusedBorder: Borders.customOutlineInputBorder(
                  color: AppColors.primaryColor),
              focusColor: AppColors.accentColor.withOpacity(0.8),
            ),
            // initialValue: number,
            // textFieldController: controller,
            formatInput: false,

            // keyboardType:
            //     TextInputType.numberWithOptions(signed: true, decimal: true),
            // inputBorder: Borders.customOutlineInputBorder(),
            onSaved: (number) {
              print('On Saved: $number');
            },
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),

          DropdownButtonFormField<String>(
            value: gender.value,
            hint: Text("Select Gender"),
            decoration: InputDecoration(
              hintText: 'Select Gender',
              filled: true,
              fillColor: phoneBgColor.value,
              contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
              border: Borders.customOutlineInputBorder(),
              enabledBorder: Borders.customOutlineInputBorder(),
              focusedBorder: Borders.customOutlineInputBorder(
                  color: AppColors.primaryColor),
              // focusColor: AppColors.accentColor.withOpacity(0.8),
            ),
            onChanged: (String newValue) {
              gender.value = newValue;
            },
            validator: (String value) {
              if (value?.isEmpty ?? true) {
                return 'Please select a gender';
              }
              return null;
            },
            items: _genders.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onSaved: (val) => gender.value = val,
          ),

          // Text(
          //   'Minimum of 8 characters with at least 1 uppercase, 1 lowercase and 1 digit.',
          //   textAlign: TextAlign.left,
          //   overflow: TextOverflow.clip,
          //   style: theme.headline3
          //       .copyWith(fontSize: 13, color: Colors.grey.shade500),
          // ),
          // SizedBox(
          //   height: ScreenUtil().setHeight(60),
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Container(
          //       height: 50,
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Container(
          //               //height: 60,
          //               // width: MediaQuery.of(context).size.width,
          //               child: CustomCheckbox(
          //             isChecked: tos.value,
          //             selectedColor: AppColors.primaryColor.withOpacity(0.5),
          //             size: 25,
          //             onSelect: (bool value) => tos.value = value,
          //           ))
          //         ],
          //       ),
          //     ),
          //     SizedBox(
          //       width: 10,
          //     ),

          //   ],
          // ),
          SizedBox(
            height: ScreenUtil().setHeight(50),
          ),
          // Consumer(
          //   builder: (context, watch, _) {
          //     final vm = watch(registerNotifierProvider.state);
          //     return CustomButton(
          //         width: MediaQuery.of(context).size.width,
          //         onPressed: vm is RegisterLoading
          //             ? null
          //             : () {
          //                 if (!_formKey.value.currentState.validate()) {
          //                   return null;
          //                 }
          //                 _formKey.value.currentState.save();
          //                 if (!tos.value) {
          //                   return AppSnackBar.showErrorSnackBar(context,
          //                       message:
          //                           "Looks like you must agree with our terms and conditions to continue. Click on the checkbox to agree.");
          //                 }
          //                 context.read(registerNotifierProvider).register(
          //                       context,
          //                       email.value.trim(),
          //                       firstName.value.trim(),
          //                       lastName.value.trim(),
          //                       password.value,
          //                       userName.value.trim(),
          //                     );
          //               },
          //         title: Text(
          //           vm is RegisterLoading
          //               ? 'Signing up your Account...'
          //               : 'Sign up my Account',
          //           style: TextStyle(
          //               color: Colors.white,
          //               fontWeight: FontWeight.bold,
          //               fontSize: Sizes.TEXT_SIZE_16),
          //         ));
          //   },
          // ),
          // SizedBox(
          //   height: ScreenUtil().setHeight(40),
          // ),
          // RichText(
          //   text: TextSpan(
          //     text: 'Already have an account?',
          //     style: Theme.of(context).textTheme.headline3,
          //     children: [
          //       TextSpan(
          //         text: ' - ',
          //         style: Theme.of(context).textTheme.headline3,
          //       ),
          //       TextSpan(
          //         recognizer: TapGestureRecognizer()..onTap = () => {},
          //         text: "Sign In",
          //         style: Theme.of(context)
          //             .textTheme
          //             .headline3
          //             .copyWith(fontWeight: FontWeight.w700),
          //       )
          //     ],
          //   ),
          // ),
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
