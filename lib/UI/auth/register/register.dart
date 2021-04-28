import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/auth/register/register.model.dart';
import 'package:jci_remit_mobile/UI/auth/register/screens/address_info.dart';
import 'package:jci_remit_mobile/UI/auth/register/screens/security_info.dart';
import 'package:jci_remit_mobile/UI/auth/register/viewmodels/register_vm.dart';
import 'package:jci_remit_mobile/UI/auth/register/viewmodels/register_state.dart';
import 'package:jci_remit_mobile/common/snackbar.dart';
import 'package:jci_remit_mobile/values/values.dart';

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
          appBar: AppBar(
            title: Text(
              'Register',
              style: TextStyle(color: AppColors.primaryColor),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Sign In',
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
          // resizeToAvoidBottomPadding: true,
          body: FlowBuilder<Register>(
            state: const Register(),
            onGeneratePages: (register, pages) {
              return [
                MaterialPage(child: BasicInfoScreen()),
                if (register.email != null) MaterialPage(child: AddressInfo()),
                if (register.country != null)
                  MaterialPage(child: SecurityInfoScreen()),
              ];
            },
            onComplete: (state) {
              print("Name: ${state.firstName}");
              print("Password: ${state.password}");
            },
          )
          // Form(
          //   key: _formKey,
          //   child: Column(
          //     children: [
          //       Expanded(
          //           child: Stepper(
          //               type: StepperType.horizontal,
          //               steps: steps,
          //               currentStep: currentStep.value,
          //               onStepContinue:
          //                   currentStep.value == 2 ? _submitDetails : next,
          //               onStepTapped: (step) => goTo(step),
          //               onStepCancel: cancel,
          //               controlsBuilder: (BuildContext context,
          //                       {VoidCallback onStepContinue,
          //                       VoidCallback onStepCancel}) =>
          //                   CustomButton(
          //                       width: MediaQuery.of(context).size.width,
          //                       onPressed: onStepContinue,
          //                       title: Text(
          //                         currentStep.value == 2
          //                             ? 'Complete'
          //                             : 'Continue',
          //                         style: TextStyle(
          //                             color: Colors.white,
          //                             fontWeight: FontWeight.bold,
          //                             fontSize: Sizes.TEXT_SIZE_16),
          //                       ))))
          //     ],
          //   ),
          // )
          // CoolStepper(
          //   onCompleted: () {},
          //   steps: <CoolStep>[
          //     CoolStep(
          //         title: "Basic Information",
          //         subtitle:
          //             "Please fill some of the basic information to get started",
          //         content: BasicInfoScreen(),
          //         validation: () {}),
          //   ],
          // )
          ),
    );
  }
}
