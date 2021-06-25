import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:jci_remit_mobile/utils/navigator.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/values/values.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        title: Text(
          'Transaction Status',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
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
                'Your Payment is Completed',
                style: context.textTheme.headline4!
                    .copyWith(fontSize: 25, color: Colors.green),
              ),
              SizedBox(height: 30),
              Container(
                child: RaisedButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  onPressed: () => context.popToFirst(),
                  color: AppColors.accentColor,
                  child: Text('Go Home', style: btnAccentStyle),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
