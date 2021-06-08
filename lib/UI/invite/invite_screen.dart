import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:jci_remit_mobile/widgets/avatar_icon.dart';

class InviteScreen extends StatelessWidget {
  const InviteScreen({Key key}) : super(key: key);

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
                  Text(
                    'Invite Friends',
                    style: context.textTheme.headline4.copyWith(fontSize: 30),
                  ),
                  Text(
                    'Earn when you invite others ',
                    style: context.textTheme.headline5.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              color: Colors.white,
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColors.primaryColor,
                        child: Icon(
                          Feather.user_plus,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Invite Friends',
                        style: context.textTheme.headline4
                            .copyWith(fontSize: 30, color: Colors.blueGrey),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'You earn whenever you invite friends\nand they perform a transaction',
                        textAlign: TextAlign.center,
                        style: context.textTheme.headline5.copyWith(
                            fontWeight: FontWeight.w300, fontSize: 14),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        'Referral Code',
                        style:
                            context.textTheme.headline4.copyWith(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        color: Colors.grey[100],
                        child: Row(
                          children: [
                            Text(
                              'REF-5689873678',
                              style: context.textTheme.headline4.copyWith(
                                  color: Colors.blueGrey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                            Spacer(),
                            Icon(
                              Feather.copy,
                              color: AppColors.primaryColor,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
