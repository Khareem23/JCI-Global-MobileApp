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
          title: Text(
            'Domestic Wire Transfer',
            style: TextStyle(color: Colors.black87),
          ),
        ),
        body: useProvider(getbankAccountsProvider).when(
            data: (List<BankAccountData> accounts) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter Beneficiary Details',
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
                          if (val == null || val.isEmpty) return 'Select Bank';
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
                      Text(selectedAccount.value.accountName!,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(selectedAccount.value.bankAccountNumber!,
                          style: TextStyle(fontSize: 20)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(selectedAccount.value.bankName!,
                          style: TextStyle(fontSize: 20)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(selectedAccount.value.bankSwiftCode!,
                          style: TextStyle(fontSize: 20)),
                      Spacer(),
                      CustomButton(
                          color: Colors.black,
                          onPressed: () {
                            if (!_formKey.value.currentState!.validate()) {
                              return null;
                            }
                            _formKey.value.currentState!.save();
                            context.navigate(ManualPaymentReportScreen(
                                transactionData: transactionData));
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
                refreshCallBack: () => context.refresh(getbankAccountsProvider),
              );
            },
            loading: () => Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
