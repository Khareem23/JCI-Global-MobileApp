import 'package:flutter/material.dart';
import 'package:jci_remit_mobile/utils/http_utils/http_util_strings.dart';
import 'package:jci_remit_mobile/values/values.dart';

class NetworkErrorWidget extends StatelessWidget {
  final Function refreshCallBack;
  final String error;

  const NetworkErrorWidget(
      {Key key, this.refreshCallBack, this.error = HttpErrorStrings.DEFAULT})
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
          SizedBox(height: 50),
          Text('Something is wrong', style: headline3),
          Container(
            margin: EdgeInsets.symmetric(vertical: 14.0),
            child: Text(error ?? HttpErrorStrings.DEFAULT,
                textAlign: TextAlign.center, style: descTextStyle),
          ),
          SizedBox(height: 30),
          Container(
            child: RaisedButton(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              onPressed: refreshCallBack,
              color: AppColors.accentColor,
              child: Text('Retry', style: btnAccentStyle),
            ),
          )
        ],
      ),
    );
  }
}
