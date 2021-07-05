import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/common/custom_text_field.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/values/values.dart';

import 'viewmodel/login_state.dart';
import 'viewmodel/login_vm.dart';

class PinLoginScreen extends HookWidget {
  const PinLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = useState(GlobalKey<FormState>());
    var theme = context.themeData.textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey.value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/svg/login.svg', height: 150),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Sign in with your email',
                    textAlign: TextAlign.center,
                    style: theme.headline3,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                // onChanged: (value) => {username.value = value},
                textInputType: TextInputType.text,
                hintText: 'Email Address',
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Email is required';
                  }

                  // if (!RegExp(
                  //         "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
                  //     .hasMatch(value)) {
                  //   return 'Enter a valid email address';
                  // }

                  // validator has to return something :)
                  return null;
                },
              ),
              SizedBox(
                height: 50,
              ),
              Consumer(builder: (context, watch, _) {
                final vm = watch(loginNotifierProvider);
                return CustomButton(
                    color: AppColors.primaryColor,
                    width: MediaQuery.of(context).size.width,
                    onPressed: vm is LoginLoading
                        ? null
                        : () {
                            if (!_formKey.value.currentState!.validate()) {
                              return null;
                            }
                            _formKey.value.currentState!.save();
                            // context.read(loginNotifierProvider.notifier).login(
                            //     context, username.value.trim(), password.value);
                          },
                    title: Text(
                      vm is LoginLoading ? 'Signing you in...' : 'Sign in',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: Sizes.TEXT_SIZE_16),
                    ));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
