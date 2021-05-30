import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:jci_remit_mobile/widgets/avatar_icon.dart';

class TransactionCard extends StatelessWidget {
  final String name, sendingCountry, receivingCounty;
  final num amountToSend, amountToReceive;
  final DateTime transactionDate;

  const TransactionCard(
      {Key key,
      @required this.name,
      @required this.transactionDate,
      @required this.sendingCountry,
      @required this.receivingCounty,
      @required this.amountToSend,
      @required this.amountToReceive})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvatarIcon(text: 'AT'),
          SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: theme.headline4
                      .copyWith(fontSize: 16, color: AppColors.blackShade1),
                ),
                Text(
                  formatDate(transactionDate, [dd, ' ', M, ' ', yyyy]),
                  textAlign: TextAlign.start,
                  style: theme.headline3
                      .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '',
                  style: theme.headline3.copyWith(fontSize: 12),
                  children: [
                    TextSpan(
                      text: sendingCountry + ' ',
                      style: theme.headline3.copyWith(fontSize: 12),
                    ),
                    TextSpan(
                      text: amountToSend.toString(),
                      style: theme.headline4
                          .copyWith(fontSize: 18, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '',
                  style: theme.headline3.copyWith(fontSize: 12),
                  children: [
                    TextSpan(
                      text: receivingCounty + ' ',
                      style: theme.headline3.copyWith(fontSize: 8),
                    ),
                    TextSpan(
                      text: amountToReceive.toString(),
                      style: theme.headline4
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ],
          ),
          // Text(
          //   '+ NGN2,000',
          //   style: theme.headline4
          //       .copyWith(fontSize: 18, fontWeight: FontWeight.w400),
          // ),
        ],
      ),
    );
  }
}
