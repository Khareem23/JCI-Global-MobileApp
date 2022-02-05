import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/widgets/item_icon.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final String name, sendingCountry, receivingCounty, transactionType;
  final num amountToSend, amountToReceive;
  final DateTime transactionDate;

  const TransactionCard(
      {Key? key,
      required this.name,
      required this.transactionDate,
      required this.sendingCountry,
      required this.receivingCounty,
      required this.amountToSend,
      required this.amountToReceive,
      required this.transactionType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,###,###.#');

    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ItemIcon(
            text: transactionType,
          ),
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
                  style: context.textTheme.headline4!
                      .copyWith(fontSize: 16, color: AppColors.blackShade1),
                ),
                Row(
                  children: [
                    Text(
                      formatDate(transactionDate, [dd, ' ', M, ' ', yyyy]),
                      textAlign: TextAlign.start,
                      style: context.textTheme.headline3!
                          .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Feather.loader,
                      color: Colors.green,
                      size: 12,
                    )
                  ],
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
                  style: context.textTheme.headline3!.copyWith(fontSize: 12),
                  children: [
                    TextSpan(
                      text: sendingCountry + ' ',
                      style:
                          context.textTheme.headline3!.copyWith(fontSize: 12),
                    ),
                    TextSpan(
                      text: formatter.format(amountToSend).toString(),
                      style: context.textTheme.headline4!
                          .copyWith(fontSize: 18, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '',
                  style: context.textTheme.headline3!.copyWith(fontSize: 12),
                  children: [
                    TextSpan(
                      text: receivingCounty + ' ',
                      style: context.textTheme.headline3!.copyWith(fontSize: 8),
                    ),
                    TextSpan(
                      // text: amountToReceive.toString(),
                      text: formatter.format(amountToReceive).toString(),
                      style: context.textTheme.headline4!
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
          //       !.copyWith(fontSize: 18, fontWeight: FontWeight.w400),
          // ),
        ],
      ),
    );
  }
}
