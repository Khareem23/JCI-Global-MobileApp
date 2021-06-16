import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/auth/register/viewmodels/register_state.dart';
import 'package:jci_remit_mobile/UI/auth/register/viewmodels/register_vm.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/common/custom_text_field.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:jci_remit_mobile/utils/theme.dart';

import '../register.model.dart';

class SecurityInfoScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = useState(GlobalKey<FormState>());

    final password = useState('');
    final confirmPassword = useState('');
    final pin = useState('');

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
    var theme = context.themeData.textTheme;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey.value,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Secure your account',
                textAlign: TextAlign.left,
                overflow: TextOverflow.clip,
                style: theme.headline3!
                    .copyWith(fontSize: 13, color: Colors.grey.shade500),
              ),
              SizedBox(
                height: 20,
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
                    icon:
                        Icon(ispwdShown.value ? Feather.eye_off : Feather.eye),
                    onPressed: () => ispwdShown.value = !ispwdShown.value),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Password is required';
                  }

                  // validator has to return something :)
                  return null;
                },
              ),
              Text(
                'Minimum of 8 characters with at least 1 uppercase, 1 lowercase and 1 digit.',
                textAlign: TextAlign.left,
                overflow: TextOverflow.clip,
                style: theme.headline3!
                    .copyWith(fontSize: 13, color: Colors.grey.shade500),
              ),
              SizedBox(
                height: 20,
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
                    icon:
                        Icon(iscpwdShown.value ? Feather.eye_off : Feather.eye),
                    onPressed: () => iscpwdShown.value = !iscpwdShown.value),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Password is required';
                  }
                  if (value != password.value) {
                    return 'Passwords do not match';
                  }

                  // validator has to return something :)
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                focusNode: pinFocusNode,
                fillColor: pinBgColor.value,
                onChanged: (v) => pin.value = v,
                textInputType: TextInputType.number,
                obscured: !ispinShown.value,
                hintText: 'Enter a 6-digit Pin',
                hasSuffixIcon: true,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                ],
                suffixIcon: IconButton(
                    icon:
                        Icon(ispinShown.value ? Feather.eye_off : Feather.eye),
                    onPressed: () => ispinShown.value = !ispinShown.value),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Pin is required';
                  }
                  if (value.length < 6) return 'Pin can only be 6 digits';

                  // validator has to return something :)
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Consumer(
                builder: (context, watch, child) {
                  final state = watch(registerNotifierProvider);
                  return CustomButton(
                      width: MediaQuery.of(context).size.width,
                      onPressed: state is RegisterLoading
                          ? () {}
                          : () {
                              if (!_formKey.value.currentState!.validate()) {
                                return null;
                              }
                              _formKey.value.currentState!.save();
                              context.flow<Register>().complete((register) =>
                                  register.copyWith(
                                      password: password.value,
                                      pin: pin.value));
                              // context.read(registerNotifierProvider).register(
                              //       context,
                              //       email.value.trim(),
                              //       firstName.value.trim(),
                              //       lastName.value.trim(),
                              //       userName.value.trim(),
                              //     );
                            },
                      title: Text(
                        state is RegisterLoading ? 'Loading...' : 'Continue',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.TEXT_SIZE_16),
                      ));
                },
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
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
