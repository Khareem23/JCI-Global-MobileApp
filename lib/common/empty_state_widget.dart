import 'package:flutter/material.dart';
import 'package:jci_remit_mobile/values/values.dart';

class EmptyStateWidget extends StatelessWidget {
  final Function()? refreshCallBack;
  final String error, textOnButton, errorTitle;

  const EmptyStateWidget(
      {Key? key,
      required this.refreshCallBack,
      this.error =
          'You do not have a transaction at the moment. Click on create to get started.',
      this.textOnButton = 'Retry',
      this.errorTitle = 'Something is wrong'})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            'assets/icons/network_error.png',
            scale: 1.6,
          ),
          SizedBox(height: 20),
          Text(errorTitle, style: headline3),
          Container(
            margin: EdgeInsets.symmetric(vertical: 14.0),
            child:
                Text(error, textAlign: TextAlign.center, style: descTextStyle),
          ),
          SizedBox(height: 10),
          Container(
            child: RaisedButton(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              onPressed: refreshCallBack,
              color: AppColors.accentColor,
              child: Text(textOnButton, style: btnAccentStyle),
            ),
          )
        ],
      ),
    );
  }
}
