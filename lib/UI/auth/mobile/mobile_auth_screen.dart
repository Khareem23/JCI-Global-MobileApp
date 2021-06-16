import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:jci_remit_mobile/UI/auth/mobile/verify_otp_screen.dart';
import 'package:jci_remit_mobile/UI/auth/mobile/viewmodels/mobile_auth_state.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/common/snackbar.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:jci_remit_mobile/utils/theme.dart';

import 'viewmodels/mobile_auth_vm.dart';

class MobileAuthScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final formKey = useState(GlobalKey<FormState>());
    final phone = useState<PhoneNumber>(PhoneNumber());
    var theme = context.themeData.textTheme;
    return ProviderListener(
      provider: mobileAuthProvider,
      onChange: (context, state) {
        if (state is MobileAuthSent) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VerifyOTPScreen(
                        phone: phone.value.toString(),
                      )));
        }
        if (state is MobileAuthError) {
          AppSnackBar.showErrorSnackBar(context, message: state.message);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                'Phone Number',
                style: theme.headline2,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              Text(
                'Please enter your valid phone number.\nWe will send you 4-digit code to verify account.',
                textAlign: TextAlign.center,
                style: theme.headline3,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(60),
              ),
              Form(
                key: formKey.value,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black54.withOpacity(0.1),
                            blurRadius: 40,
                            offset: Offset(0, 10))
                      ],
                      borderRadius: BorderRadius.circular(8)),
                  child: InternationalPhoneNumberInput(
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    onInputChanged: (v) => phone.value = v,
                    countries: ['NG'],
                    selectorConfig: SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      // backgroundColor: Colors.white,
                    ),
                    inputBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(150),
              ),
              Consumer(builder: (context, watch, _) {
                final vm = watch(mobileAuthProvider);
                return CustomButton(
                    width: MediaQuery.of(context).size.width,
                    onPressed: vm is MobileAuthSending
                        ? () {}
                        : () {
                            if (!formKey.value.currentState!.validate()) {
                              return null;
                            }
                            formKey.value.currentState!.save();
                            print(phone.value);
                            context
                                .read(mobileAuthProvider.notifier)
                                .sendOtp(phone.value.toString());
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => MobileAuthScreen()));
                          },
                    title: Text(
                      vm is MobileAuthSending ? 'Sending...' : 'Send Code',
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
