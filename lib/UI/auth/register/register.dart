import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/auth/register/screens/address_info.dart';
import 'package:jci_remit_mobile/UI/auth/register/viewmodels/register_state.dart';
import 'package:jci_remit_mobile/UI/auth/register/viewmodels/register_vm.dart';
import 'package:jci_remit_mobile/common/cool_stepper/cool_stepper.dart';
import 'package:jci_remit_mobile/common/cool_stepper/src/models/cool_step.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/common/snackbar.dart';
import 'package:jci_remit_mobile/values/values.dart';

import 'register_success.dart';
import 'screens/basic_info.dart';

class RegisterScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final currentStep = useState(0);
    final complete = useState(false);

    goTo(int step) {
      currentStep.value = step;
    }

    final List<Step> steps = [
      Step(
          title: const Text('Account'),
          isActive: currentStep.value >= 0,
          state:
              currentStep.value >= 0 ? StepState.complete : StepState.disabled,
          content: BasicInfoScreen()),
      Step(
          title: const Text('Address'),
          isActive: currentStep.value >= 0,
          state:
              currentStep.value >= 1 ? StepState.complete : StepState.disabled,
          content: AddressInfo()),
      Step(
          title: const Text('Security'),
          isActive: currentStep.value >= 0,
          state:
              currentStep.value >= 2 ? StepState.complete : StepState.disabled,
          content: Container()),
    ];

    next() {
      currentStep.value + 1 != steps.length
          ? goTo(currentStep.value + 1)
          : complete.value = true;
    }

    cancel() {
      if (currentStep.value > 0) {
        goTo(currentStep.value - 1);
      }
    }

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
          body: Column(
            children: [
              Expanded(
                  child: Stepper(
                type: StepperType.horizontal,
                steps: steps,
                currentStep: currentStep.value,
                onStepContinue: next,
                onStepTapped: (step) => goTo(step),
                onStepCancel: cancel,
                controlsBuilder: _createEventControlBuilder,
              ))
            ],
          )
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

  Widget _createEventControlBuilder(BuildContext context,
      {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
    return CustomButton(
        width: MediaQuery.of(context).size.width,
        onPressed: onStepContinue,
        title: Text(
          'Continue',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: Sizes.TEXT_SIZE_16),
        ));
    // Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: <Widget>[
    //       FlatButton(
    //         onPressed: onStepCancel,
    //         child: const Text('BACK'),
    //       ),
    //       FlatButton(
    //         onPressed: onStepContinue,
    //         child: const Text('NEXT'),
    //       ),
    //     ]);
  }
}
