import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/dashboard/viewmodels/user_dash_vm.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/common/snackbar.dart';
import 'package:jci_remit_mobile/controllers/request_state_notifier.dart';
import 'package:jci_remit_mobile/utils/navigator.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/utils/extensions.dart';
import 'package:jci_remit_mobile/values/values.dart';

import 'vm/profile_vm.dart';

class BankAccountScreen extends HookWidget {
  final Map<String, dynamic>? customerBankAccount;
  const BankAccountScreen(this.customerBankAccount, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = useState(GlobalKey<FormState>());
    final accountNumber = useTextEditingController(
        text: customerBankAccount != null
            ? customerBankAccount!["accNumber"]
            : " ");
    final accName = useTextEditingController(
        text: customerBankAccount != null
            ? customerBankAccount!["accountName"]
            : " ");
    final bankName = useTextEditingController(
        text: customerBankAccount != null
            ? customerBankAccount!["accBankName"]
            : " ");
    final accCountry = useTextEditingController(
        text: customerBankAccount != null
            ? customerBankAccount!["accCountry"]
            : " ");
    final accSwiftCode = useTextEditingController(
        text: customerBankAccount != null
            ? customerBankAccount!["accSwiftCode"]
            : " ");
    return ProviderListener(
      onChange: (BuildContext context, value) {
        if (value is Success) {
          context.refresh(userProvider);
          context.popView();
          AppSnackBar.showSuccessSnackBar(context,
              message: 'Bank account updated');
          context.refresh(userProvider);
        }
        if (value is Error) {
          AppSnackBar.showErrorSnackBar(context,
              message: 'Unable to save your bank account. Please try again.');
        }
      },
      provider: addAccountProvider,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: AppColors.white,
            ),
            onPressed: () {
              Navigator.pop(context, 'BeneficiaryCreatedFailed');
            },
          ),
          title: Text('Bank Details',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.TEXT_SIZE_18,
                  fontWeight: FontWeight.bold)),
          backgroundColor: AppColors.red,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey.value,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset('assets/images/watermark.png',
                    width: MediaQuery.of(context).size.width * 0.8),
                ListView(children: [
                  SizedBox(
                    height: context.screenHeight(1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enter Bank Details',
                          textAlign: TextAlign.center,
                          style: context.textTheme.headline3!
                              .copyWith(color: Colors.grey, fontSize: 14),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: accountNumber,
                          validator: (val) {
                            if (val == null || val.isEmpty)
                              return 'Field cannot be empty';
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                          ],
                          decoration: InputDecoration(
                            labelText: 'Account Number / IBAN',
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
                          controller: accName,
                          validator: (val) {
                            if (val == null || val.isEmpty)
                              return 'Field cannot be empty';
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Account Name',
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
                          controller: bankName,
                          validator: (val) {
                            if (val == null || val.isEmpty)
                              return 'Field cannot be empty';
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Bank Name',
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
                          controller: accCountry,
                          validator: (val) {
                            if (val == null || val.isEmpty)
                              return 'Field cannot be empty';
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Country',
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
                          controller: accSwiftCode,
                          decoration: InputDecoration(
                            labelText: 'Swift Code',
                            hintText: '',
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                        // Spacer(),
                        SizedBox(height: 100),
                        Consumer(
                          builder: (BuildContext context,
                              T Function<T>(ProviderBase<Object?, T>) watch,
                              Widget? child) {
                            final vm = watch(addAccountProvider);
                            return CustomButton(
                                color: Colors.black,
                                width: MediaQuery.of(context).size.width,
                                onPressed: vm is Loading
                                    ? null
                                    : () {
                                        if (!_formKey.value.currentState!
                                            .validate()) {
                                          return null;
                                        }
                                        _formKey.value.currentState!.save();
                                        context
                                            .read(addAccountProvider.notifier)
                                            .addAccount(
                                                accCountry.text,
                                                bankName.text,
                                                accountNumber.text,
                                                accName.text,
                                                accSwiftCode.text);
                                        // context.popView();
                                      },
                                title: Text(
                                  vm is Loading ? 'UPDATING...' : 'UPDATE',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Sizes.TEXT_SIZE_16),
                                ));
                          },
                        ),
                      ],
                    ),
                  )
                ])
                // : EmptyStateWidget(
                //     error:
                //         "Seems like you've not added a bank account yet",
                //     textOnButton: '+ Add Bank Account',
                //     errorTitle: 'One minute!',

                //     // TODO: Navigate to a create transaction screen
                //     refreshCallBack: () {
                //       setState(() {
                //         isCreateAccount = false;
                //       });
                //     },
                //   )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
