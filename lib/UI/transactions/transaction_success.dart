import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:jci_remit_mobile/UI/transactions/direct_debit_screen.dart';
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
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
                  Text(
                    'Transaction Completed',
                    style: context.textTheme.headline4!
                        .copyWith(fontSize: 25, color: Colors.green),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Now you can make payment for the transaction.',
                    textAlign: TextAlign.center,
                    style: context.textTheme.headline5!
                        .copyWith(fontWeight: FontWeight.w300, fontSize: 16),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    'How do you want to pay for this transfer?',
                    textAlign: TextAlign.center,
                    style: context.textTheme.headline4!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.green),
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
                        leading: Icon(Feather.corner_up_right),
                        selectedTileColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        title: Text(
                          'Direct Debit (POLI)',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(
                          AntDesign.right,
                        )),
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
                        leading: Icon(Feather.corner_right_up),
                        title: Text('Domestic Wire Transfer',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        trailing: Icon(
                          AntDesign.right,
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
                        leading: Icon(Feather.credit_card),
                        title: Text('Credit Card',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        trailing: Icon(
                          AntDesign.right,
                        )),
                  ),
                  Spacer(),
                  CustomButton(
                      color: Colors.black,
                      onPressed: () {
                        if (_selectedIndex.value == 1) {
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
