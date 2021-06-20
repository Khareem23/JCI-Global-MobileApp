import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:jci_remit_mobile/UI/transactions/direct_debit_screen.dart';
import 'package:jci_remit_mobile/UI/transactions/wire_transfer_screen.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/transaction_res.dart';
import 'package:jci_remit_mobile/utils/navigator.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:jci_remit_mobile/utils/theme.dart';

class TransactionSuccessScreen extends StatelessWidget {
  final TransactionData transaction;
  const TransactionSuccessScreen({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  ListTile(
                      enabled: true,
                      leading: Icon(Feather.corner_up_right),
                      shape: RoundedRectangleBorder(
                          side: Borders.customBorder(color: Colors.red),
                          borderRadius: BorderRadius.circular(5)),
                      title: Text(
                        'Direct Debit (POLI)',
                        style:
                            context.textTheme.headline4!.copyWith(fontSize: 18),
                      ),
                      trailing: Icon(
                        AntDesign.right,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                      onTap: () => context.navigate(
                          WireTransferScreen(transactionData: transaction)),
                      leading: Icon(Feather.corner_right_up),
                      title: Text('Domestic Wire Transfer',
                          style: context.textTheme.headline4!
                              .copyWith(fontSize: 18)),
                      trailing: Icon(
                        AntDesign.right,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                      leading: Icon(Feather.credit_card),
                      title: Text('Credit Card',
                          style: context.textTheme.headline4!
                              .copyWith(fontSize: 18)),
                      trailing: Icon(
                        AntDesign.right,
                      ))
                ],
              ),
            ))));
  }
}
