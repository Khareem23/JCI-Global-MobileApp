import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/transactions/manual_payment_report_screen.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/common/network_error_widget.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/bank_account_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/transaction_res.dart';
import 'package:jci_remit_mobile/utils/extensions.dart';
import 'package:jci_remit_mobile/utils/navigator.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/values/values.dart';

import 'vm/transaction_vm.dart';

class WireTransferScreen extends HookWidget {
  final TransactionData transactionData;

  const WireTransferScreen({required this.transactionData, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = useState(GlobalKey<FormState>());
    final bank = useTextEditingController();
    // var states =
    // getbankAccountsBySendingCountryCodeProvider(List<BankAccountData>rec, countryOfResidence.value);
print(transactionData);

    final selectedAccount = useState<BankAccountData>(BankAccountData(
        id: 1,
        country: '',
        countryCode: '',
        bankAccountNumber: '',
        bankName: '',
        accountName: '',
        bankSwiftCode: ''));
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: AppColors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text('Domestic Wire Transfer',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.TEXT_SIZE_18,
                  fontWeight: FontWeight.bold)),
          backgroundColor: AppColors.red,
        ),

        body: Stack(alignment: AlignmentDirectional.center, children: [
          Image.asset('assets/images/watermark.png',
              width: MediaQuery.of(context).size.width * 0.8),

          useProvider(getbankAccountsBySendingCountryCodeProvider(transactionData.sendingCountry.toString())).when(
              data: (List<BankAccountData> accounts) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Beneficiary Bank',
                          textAlign: TextAlign.center,
                          style: context.textTheme.headline3!
                              .copyWith(color: Colors.black, fontSize: 14),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: bank,
                          readOnly: true,
                          validator: (val) {
                            if (val == null || val.isEmpty)
                              return 'Select Bank';
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Select Banks',
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            suffixIcon: PopupMenuButton<BankAccountData>(
                              icon: const Icon(Icons.arrow_drop_down),
                              onSelected: (BankAccountData value) {
                                bank.text = value.bankAccountNumber!;
                                selectedAccount.value = value;
                                // countryCode.value = value.alpha3Code!;
                                // accCurrency.value = value.currency!;
                                // print(value.alpha3Code);
                              },
                              itemBuilder: (BuildContext context) {
                                return accounts
                                    .map<PopupMenuItem<BankAccountData>>(
                                        (BankAccountData value) {
                                  return new PopupMenuItem(
                                      child: new Text(
                                          '${value.bankAccountNumber!} - ${value.accountName!}'),
                                      value: value);
                                }).toList();
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Bank Account Details',
                          textAlign: TextAlign.center,
                          style: context.textTheme.headline3!
                              .copyWith(color: Colors.black, fontSize: 14),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            "Account Name: " +
                                selectedAccount.value.accountName!,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal)),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                            "Bank Account Number: " +
                                selectedAccount.value.bankAccountNumber!,
                            style: TextStyle(fontSize: 20)),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Bank Name: " + selectedAccount.value.bankName!,
                            style: TextStyle(fontSize: 20)),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                            "Bank Swift Code: " +
                                selectedAccount.value.bankSwiftCode!,
                            style: TextStyle(fontSize: 20)),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                            "Bank Country : " +
                                selectedAccount.value.country!,
                            style: TextStyle(fontSize: 20)),
                        Spacer(),
                        CustomButton(
                            color: AppColors.primaryColor,
                            onPressed: () {
                              if (!_formKey.value.currentState!.validate()) {
                                return null;
                              }
                              _formKey.value.currentState!.save();
                              context.navigate(ManualPaymentReportScreen(
                                  transactionData: transactionData,
                                  accountData: selectedAccount.value));
                            },
                            width: context.screenWidth(1),
                            title: Text(
                              'CONTINUE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.TEXT_SIZE_16),
                            )),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                );
              },
              error: (Object error, StackTrace? stackTrace) {
                return NetworkErrorWidget(
                  error:
                      'Looks like we are unable to fetch accounts at this time. Please try again',
                  refreshCallBack: () =>
                      context.refresh(getbankAccountsProvider),
                );
              },
              loading: () => Center(
                    child: CircularProgressIndicator(),
                  ))
        ]));
  }
}
