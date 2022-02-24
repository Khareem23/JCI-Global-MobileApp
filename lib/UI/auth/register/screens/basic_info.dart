import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:jci_remit_mobile/UI/auth/login/login.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/common/custom_text_field.dart';
import 'package:jci_remit_mobile/utils/navigator.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:jci_remit_mobile/utils/theme.dart';

import '../register.model.dart';

class BasicInfoScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = useState(GlobalKey<FormState>());
    final initialCountry = useState('AU');
    PhoneNumber number = PhoneNumber(isoCode: initialCountry.value);
    var _genders = ['Male', 'Female'];
    var _accountTypes = ['Individual Account', 'Business Account'];
    final gender = useState('Male');

    final refCode = useState('');
    final firstName = useState('');
    final lastName = useState('');
    final dob = useState<DateTime>(DateTime.now());
    final email = useState('');
    var phoneNumber = useState('');
    final accountType = useState('Individual Account');

    final refCodeFocusNode = useFocusNode();
    final fnameFocusNode = useFocusNode();
    final lnameFocusNode = useFocusNode();
    final emailFocusNode = useFocusNode();
    final phoneFocusNode = useFocusNode();
    final refCodeBgColor = useState(Colors.white);
    final fnameBgColor = useState(Colors.white);
    final lnameBgColor = useState(Colors.white);
    final emailBgColor = useState(Colors.white);
    final phoneBgColor = useState(Colors.white);
    txtFieldListener(phoneFocusNode, phoneBgColor);
    txtFieldListener(refCodeFocusNode, refCodeBgColor);
    txtFieldListener(fnameFocusNode, fnameBgColor);
    txtFieldListener(lnameFocusNode, lnameBgColor);
    txtFieldListener(emailFocusNode, emailBgColor);
    var theme = context.themeData.textTheme;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey.value,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter your basic information',
                textAlign: TextAlign.left,
                overflow: TextOverflow.clip,
                style:
                    theme.headline3!.copyWith(fontSize: 13, color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                onChanged: (v) => firstName.value = v,
                focusNode: fnameFocusNode,
                fillColor: fnameBgColor.value,
                textInputType: TextInputType.text,
                hintText: 'First Name',
                labelText: 'First Name',
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'First Name is required';
                  }

                  // validator has to return something :)
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                focusNode: lnameFocusNode,
                fillColor: lnameBgColor.value,
                onChanged: (v) => lastName.value = v,
                textInputType: TextInputType.text,
                hintText: 'Last Name',
                labelText: 'Last Name',
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Last Name is required';
                  }

                  // validator has to return something :)
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              DateTimeFormField(
                decoration: const InputDecoration(
                  labelText: 'Date of Birth',
                  hintStyle: TextStyle(color: Colors.black45),
                  errorStyle: TextStyle(color: Colors.redAccent),
                  hintText: 'Date of birth',
                  filled: true,
                  // fillColor: AppColors.primaryColor,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(Sizes.RADIUS_8)),
                    borderSide: BorderSide(
                      color: AppColors.grey,
                      width: Sizes.WIDTH_1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(Sizes.RADIUS_8)),
                    borderSide: BorderSide(
                      color: AppColors.grey,
                      width: Sizes.WIDTH_1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(Sizes.RADIUS_8)),
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
                // validator: (e) =>
                //     (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                onDateSelected: (DateTime value) {
                  print(value);
                  dob.value = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                focusNode: emailFocusNode,
                fillColor: emailBgColor.value,
                onChanged: (v) => email.value = v,
                textInputType: TextInputType.text,
                hintText: 'Email Address',
                labelText: 'Email Address',
                validator: (String? value) {
                  if (value!.isEmpty) {
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
                height: 20,
              ),
              InternationalPhoneNumberInput(
                focusNode: phoneFocusNode,
                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber);
                  initialCountry.value = number.isoCode!;
                  phoneNumber.value = number.phoneNumber!;
                },
                onInputValidated: (bool value) {
                  print(value);
                },
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.DIALOG,
                ),
                ignoreBlank: false,
                initialValue: number,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: TextStyle(color: Colors.black),
                inputDecoration: InputDecoration(
                  hintText: 'Phone',
                  labelText: 'Phone',
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
                formatInput: false,

                // keyboardType:
                //     TextInputType.numberWithOptions(signed: true, decimal: true),
                // inputBorder: Borders.customOutlineInputBorder(),
                onSaved: (number) {
                  print('On Saved: $number');
                },
              ),
              SizedBox(
                height: 20,
              ),

              DropdownButtonFormField<String>(
                // value: gender.value,
                hint: Text("Select Gender"),
                decoration: InputDecoration(
                  hintText: 'Select Gender',
                  labelText: 'Select Gender',
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  border: Borders.customOutlineInputBorder(),
                  enabledBorder: Borders.customOutlineInputBorder(),
                  focusedBorder: Borders.customOutlineInputBorder(
                      color: AppColors.primaryColor),
                  // focusColor: AppColors.accentColor.withOpacity(0.8),
                ),
                onChanged: (String? newValue) {
                  gender.value = newValue!;
                },
                validator: (String? value) {
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
              ),
              SizedBox(
                height: 20,
              ),

              DropdownButtonFormField<String>(
                // value: accountType.value,
                hint: Text("Select Account Type"),
                decoration: InputDecoration(
                  hintText: 'Select Account Type',
                  labelText: 'Select Account Type',
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  border: Borders.customOutlineInputBorder(),
                  enabledBorder: Borders.customOutlineInputBorder(),
                  focusedBorder: Borders.customOutlineInputBorder(
                      color: AppColors.primaryColor),
                  // focusColor: AppColors.accentColor.withOpacity(0.8),
                ),
                onChanged: (String? newValue) {
                  accountType.value = newValue!;
                },
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please select an account type';
                  }
                  return null;
                },
                items:
                    _accountTypes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                focusNode: refCodeFocusNode,
                fillColor: refCodeBgColor.value,
                onChanged: (v) => refCode.value = v,
                textInputType: TextInputType.text,
                hintText: 'Referral Code',
                labelText: 'Referral Code',
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                  width: MediaQuery.of(context).size.width,
                  onPressed: () {
                    if (!_formKey.value.currentState!.validate()) {
                      return null;
                    }
                    _formKey.value.currentState!.save();
                    final accountEnum =
                        accountType.value == 'Individual Account' ? 0 : 1;
                    context.flow<Register>().update((register) =>
                        register.copyWith(
                            refCode: refCode.value,
                            firstName: firstName.value,
                            lastName: lastName.value,
                            email: email.value,
                            dateOfBirth: dob.value,
                            phoneNumber: phoneNumber.value,
                            accountType: accountEnum,
                            userRole: 0,
                            gender: gender.value));
                  },
                  title: Text(
                    'Continue',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: Sizes.TEXT_SIZE_16),
                  )),

              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => context.navigate(LoginScreen()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: theme.headline3!
                          .copyWith(fontSize: 15, color: AppColors.black),
                    ),
                    Text(
                      'Login',
                      style: theme.headline3!.copyWith(
                          fontSize: 15, color: AppColors.primaryColor),
                    ),
                  ],
                ),
              ),
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
              //             !.copyWith(fontWeight: FontWeight.w700),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
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
