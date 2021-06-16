import 'package:flutter/material.dart';
import 'package:jci_remit_mobile/services/api/user/models/user_transaction.dart';
import 'package:jci_remit_mobile/utils/extensions.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/values/values.dart';

class TransactionDetail extends StatelessWidget {
  final Datum data;

  const TransactionDetail({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Transaction Summary'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: context.screenHeight(0.1),
            width: context.screenWidth(1),
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: '',
                      style:
                          context.textTheme.headline3!.copyWith(fontSize: 12),
                      children: [
                        TextSpan(
                          text: 'AUD ',
                          style: context.textTheme.headline3!
                              .copyWith(fontSize: 12),
                        ),
                        TextSpan(
                          text: '12.99',
                          style: context.textTheme.headline4!.copyWith(
                              fontSize: 40, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  Text(
                    'September 24, 2021',
                    textAlign: TextAlign.center,
                    style: context.textTheme.headline3!
                        .copyWith(color: Colors.grey, fontSize: 14),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: context.screenWidth(1),
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reference Number',
                  textAlign: TextAlign.center,
                  style: context.textTheme.headline3!.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.accentColor,
                      fontSize: 14),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '12843ubjeihtuehr3984u02340',
                  textAlign: TextAlign.center,
                  style: context.textTheme.headline3!.copyWith(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(),
                SizedBox(
                  height: 5,
                ),
                TrnxDetailItem(
                  title: 'Amount Sent',
                  item: '\$185.65',
                ),
                SizedBox(
                  height: 10,
                ),
                TrnxDetailItem(
                  title: 'Amount Charged',
                  item: '\$262.65',
                ),
                SizedBox(
                  height: 10,
                ),
                TrnxDetailItem(
                  title: 'Amount Received',
                  item: '\$262.65',
                ),
                SizedBox(
                  height: 10,
                ),
                TrnxDetailItem(
                  title: 'PayIn Method',
                  item: 'Poli',
                ),
                SizedBox(
                  height: 10,
                ),
                TrnxDetailItem(
                  title: 'Status',
                  item: 'Completed',
                ),
                SizedBox(
                  height: 10,
                ),
                TrnxDetailItem(
                  title: 'Date & Time Processed',
                  item: '25 JUN 2020',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: context.screenWidth(1),
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Status Description',
                  textAlign: TextAlign.center,
                  style: context.textTheme.headline3!.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.accentColor,
                      fontSize: 14),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: context.screenWidth(1),
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Receiver's Info",
                  textAlign: TextAlign.center,
                  style: context.textTheme.headline3!.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.accentColor,
                      fontSize: 14),
                ),
                SizedBox(
                  height: 20,
                ),
                TrnxDetailItem(
                  title: 'Name',
                  item: 'Bankolade Bimbo',
                ),
                SizedBox(
                  height: 20,
                ),
                TrnxDetailItem(
                  title: 'Bank Name',
                  item: 'First Bank Nigeria',
                ),
                SizedBox(
                  height: 20,
                ),
                TrnxDetailItem(
                  title: 'Account Number',
                  item: '09084938749343',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Have a problem with this summary?\nContact support.',
            textAlign: TextAlign.center,
            style: context.textTheme.headline3!.copyWith(
                fontWeight: FontWeight.w800,
                color: Colors.blueGrey,
                fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class TrnxDetailItem extends StatelessWidget {
  final String title;
  final String item;
  const TrnxDetailItem({
    Key? key,
    required this.title,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.textTheme.headline3!.copyWith(
              color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 13),
        ),
        Spacer(),
        Text(
          item,
          textAlign: TextAlign.center,
          style: context.textTheme.headline3!.copyWith(
              color: Colors.blueGrey,
              fontWeight: FontWeight.w600,
              fontSize: 14),
        ),
      ],
    );
  }
}
