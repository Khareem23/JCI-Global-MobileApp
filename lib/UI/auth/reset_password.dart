import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/values/values.dart';

class ResetPassword extends HookWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final email = useTextEditingController();
    final isNewPwdShown = useState(false);
    final isConfirmPwdShown = useState(false);
    final password = useTextEditingController();
    final confirmPassword = useTextEditingController();
    final _formKey = useState(GlobalKey<FormState>());
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reset your password',
                  style: context.textTheme.headline4!
                      .copyWith(fontSize: 30, color: Colors.white),
                ),
                Text(
                  'Change your password using your reset code',
                  style: context.textTheme.headline5!
                      .copyWith(fontSize: 12, color: Colors.white60),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey.value,
              child: Column(
                children: [
                  TextFormField(
                    controller: email,
                    validator: (val) {
                      if (val == null || val.isEmpty)
                        return 'Field cannot be empty';
                      if (!RegExp(
                              "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
                          .hasMatch(val)) {
                        return 'Enter a valid email address';
                      }

                      // validator has to return something :)
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      hintText: '',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: email,
                    validator: (val) {
                      if (val == null || val.isEmpty)
                        return 'Field cannot be empty';

                      // validator has to return something :)
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password Reset Code',
                      hintText: '',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: password,
                    validator: (val) {
                      if (val == null || val.isEmpty)
                        return 'Field cannot be empty';

                      // validator has to return something :)
                      return null;
                    },
                    obscureText: !isNewPwdShown.value,
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      hintText: '',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      suffixIcon: IconButton(
                          icon: Icon(isNewPwdShown.value
                              ? Feather.eye_off
                              : Feather.eye),
                          onPressed: () =>
                              isNewPwdShown.value = !isNewPwdShown.value),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: confirmPassword,
                    validator: (val) {
                      if (val == null || val.isEmpty)
                        return 'Field cannot be empty';

                      if (val != password.text) {
                        return 'Passwords do not match';
                      }
                      // validator has to return something :)
                      return null;
                    },
                    obscureText: !isConfirmPwdShown.value,
                    decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        hintText: '',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        suffixIcon: IconButton(
                            icon: Icon(isConfirmPwdShown.value
                                ? Feather.eye_off
                                : Feather.eye),
                            onPressed: () => isConfirmPwdShown.value =
                                !isConfirmPwdShown.value)),
                  ),
                  Spacer(),
                  CustomButton(
                      color: AppColors.primaryColor,
                      width: MediaQuery.of(context).size.width,
                      onPressed: () {
                        if (!_formKey.value.currentState!.validate()) {
                          return null;
                        }
                        _formKey.value.currentState!.save();
                        // context.navigate(LoginScreen());
                      },
                      title: Text(
                        'Reset Password',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.TEXT_SIZE_16),
                      )),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
