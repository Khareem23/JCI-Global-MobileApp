import 'package:flutter/material.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:jci_remit_mobile/widgets/avatar_icon.dart';

class TransactionCard extends StatelessWidget {
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
                  'Ajiboye Temitope',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: theme.headline4
                      .copyWith(fontSize: 16, color: AppColors.blackShade1),
                ),
                Text(
                  '5 minutes ago',
                  textAlign: TextAlign.start,
                  style: theme.headline3
                      .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: '+',
              style: theme.headline3.copyWith(fontSize: 12),
              children: [
                TextSpan(
                  text: "NGN ",
                  style: theme.headline3.copyWith(fontSize: 12),
                ),
                TextSpan(
                  text: "7,000",
                  style: theme.headline4
                      .copyWith(fontSize: 18, fontWeight: FontWeight.w400),
                )
              ],
            ),
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
