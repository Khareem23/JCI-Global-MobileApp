import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:jci_remit_mobile/UI/transactions/direct_debit_screen.dart';
import 'package:jci_remit_mobile/UI/transactions/poli_lander_screen.dart';
import 'package:jci_remit_mobile/UI/transactions/wire_transfer_screen.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/transaction_res.dart';
import 'package:jci_remit_mobile/utils/extensions.dart';
import 'package:jci_remit_mobile/utils/navigator.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:jci_remit_mobile/utils/theme.dart';

class TransactionSuccessScreen extends HookWidget {
  final TransactionData transaction;
  const TransactionSuccessScreen({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _selectedIndex = useState(1);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Transaction Status',
            style: TextStyle(color: Colors.black87),
          ),
        ),
        body: Container(
            color: Colors.white,
            child: Center(
                child: Padding(
              padding: EdgeInsets.all(20),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Icon(
                    Feather.check_circle,
                    color: Colors.green,
                    size: 80,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Proceed with payment',
                      style: context.textTheme.headline4!
                          .copyWith(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // Text(
                  //   'Now you can make payment for the transaction.',
                  //   textAlign: TextAlign.center,
                  //   style: context.textTheme.headline5!
                  //       .copyWith(fontWeight: FontWeight.w300, fontSize: 16),
                  // ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'How do you want to pay for this transfer?',
                    textAlign: TextAlign.center,
                    style: context.textTheme.headline4!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: _selectedIndex.value == 1
                                ? AppColors.primaryColor
                                : AppColors.blackShade1)),
                    child: ListTile(
                        onTap: () {
                          _selectedIndex.value = 1;
                        },
                        selected: _selectedIndex.value == 1,
                        leading: Icon(Feather.corner_up_right,
                            color: _selectedIndex.value == 1
                                ? AppColors.primaryColor
                                : AppColors.blackShade1),
                        selectedTileColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        title: Text(
                          'Direct Debit (POLI)',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: _selectedIndex.value == 1
                                  ? AppColors.primaryColor
                                  : AppColors.blackShade1),
                        ),
                        trailing: Icon(AntDesign.right,
                            color: _selectedIndex.value == 1
                                ? AppColors.primaryColor
                                : AppColors.blackShade1)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: _selectedIndex.value == 2
                                ? AppColors.primaryColor
                                : AppColors.blackShade1)),
                    child: ListTile(
                        onTap: () {
                          _selectedIndex.value = 2;
                        },
                        selected: _selectedIndex.value == 2,
                        leading: Icon(
                          Feather.corner_right_up,
                          color: _selectedIndex.value == 2
                              ? AppColors.primaryColor
                              : AppColors.blackShade1,
                        ),
                        title: Text('Domestic Wire Transfer',
                            style: TextStyle(
                                color: _selectedIndex.value == 2
                                    ? AppColors.primaryColor
                                    : AppColors.blackShade1,
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                        trailing: Icon(
                          AntDesign.right,
                          color: _selectedIndex.value == 2
                              ? AppColors.primaryColor
                              : AppColors.blackShade1,
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: _selectedIndex.value == 3
                                ? AppColors.primaryColor
                                : AppColors.blackShade1)),
                    child: ListTile(
                        onTap: () {
                          _selectedIndex.value = 3;
                        },
                        selected: _selectedIndex.value == 3,
                        selectedTileColor: AppColors.primaryColor,
                        leading: Icon(
                          Feather.credit_card,
                          color: _selectedIndex.value == 3
                              ? AppColors.primaryColor
                              : AppColors.blackShade1,
                        ),
                        title: Text('Credit Card',
                            style: TextStyle(
                                color: _selectedIndex.value == 3
                                    ? AppColors.primaryColor
                                    : AppColors.blackShade1,
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                        trailing: Icon(
                          AntDesign.right,
                          color: _selectedIndex.value == 3
                              ? AppColors.primaryColor
                              : AppColors.blackShade1,
                        )),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Transaction will be processed upon fund confirmation only. Please use your own account to pay for the transaction. We do not accept any payments made through third party accounts via net banking. Using third party account would result in your transaction being cancelled/rejected in order to protect you from fraud. We do not accept cash/cheque deposit into our account. Pls make use of the listed payment options above.',
                    textAlign: TextAlign.center,
                    style: context.textTheme.headline5!
                        .copyWith(fontWeight: FontWeight.w300, fontSize: 8),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                      color: Colors.black,
                      onPressed: () {
                        if (_selectedIndex.value == 1) {
                          context.navigate(
                              PoliLanderScreen(transactionData: transaction));
                          // Poli transfer
                        } else if (_selectedIndex.value == 2) {
                          // Domestic Wire Transfer
                          return context.navigate(
                              WireTransferScreen(transactionData: transaction));
                        } else if (_selectedIndex.value == 3) {
                          // Credit Card

                        }
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
            ))));
  }
}
