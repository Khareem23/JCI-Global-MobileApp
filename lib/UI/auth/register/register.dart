import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/auth/register/viewmodels/register_state.dart';
import 'package:jci_remit_mobile/UI/auth/register/viewmodels/register_vm.dart';
import 'package:jci_remit_mobile/common/cool_stepper/cool_stepper.dart';
import 'package:jci_remit_mobile/common/cool_stepper/src/models/cool_step.dart';
import 'package:jci_remit_mobile/common/snackbar.dart';

import 'register_success.dart';
import 'screens/basic_info.dart';

class RegisterScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderListener<RegisterState>(
      provider: registerNotifierProvider.state,
      onChange: (context, state) {
        if (state is RegisterSuccess) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => RegisterSuccessScreen()));
        }
        if (state is RegisterError) {
          AppSnackBar.showErrorSnackBar(context, message: state.message);
        }
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(),
          // resizeToAvoidBottomPadding: true,
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(30),
              child: CoolStepper(
                onCompleted: () {},
                steps: <CoolStep>[
                  CoolStep(
                      title: "Basic Information",
                      subtitle:
                          "Please fill some of the basic information to get started",
                      content: BasicInfoScreen(),
                      validation: () {}),
                ],
              ),
            ),
          )),
    );
  }
}
