import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/values/values.dart';

class ReceiversScreen extends StatelessWidget {
  const ReceiversScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor.withOpacity(0.1),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'All Beneficiaries',
                        style:
                            context.textTheme.headline4.copyWith(fontSize: 30),
                      ),
                      Spacer(),
                      Icon(
                        AntDesign.adduser,
                        color: AppColors.primaryColor,
                      )
                    ],
                  ),
                  Text(
                    'See all your beneficiaries in one place',
                    style: context.textTheme.headline5.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(40),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Column()))
          ],
        ),
      ),
    );
  }
}
