import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/dashboard/viewmodels/user_dash_vm.dart';
import 'package:jci_remit_mobile/common/snackbar.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:jci_remit_mobile/widgets/avatar_icon.dart';

class InviteScreen extends HookWidget {
  const InviteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor.withOpacity(0.1),
      body: RefreshIndicator(
        onRefresh: () => context.refresh(userProvider),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                color: AppColors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Text(
                      'Invite Friends',
                      style: context.textTheme.headline4!
                          .copyWith(fontSize: 30, color: AppColors.white),
                    ),
                    Text(
                      'Earn when you invite others',
                      style: context.textTheme.headline5!
                          .copyWith(fontSize: 12, color: AppColors.white),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                color: Colors.white,
                child: Center(
                  child:
                      Stack(alignment: AlignmentDirectional.center, children: [
                    Image.asset('assets/images/watermark.png',
                        width: MediaQuery.of(context).size.width * 0.8),
                    Container(
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
                            style: context.textTheme.headline4!
                                .copyWith(fontSize: 30, color: Colors.blueGrey),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'You earn whenever you invite friends\nand they perform a transaction',
                            textAlign: TextAlign.center,
                            style: context.textTheme.headline5!.copyWith(
                                fontWeight: FontWeight.w300, fontSize: 14),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Text(
                            'Referral Code',
                            style: context.textTheme.headline4!
                                .copyWith(fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          useProvider(userProvider).when(
                            data: (user) {
                              return Container(
                                padding: EdgeInsets.all(20),
                                color: Colors.grey[100],
                                child: Row(
                                  children: [
                                    Text(
                                      user.referralDiscountCode!,
                                      style: context.textTheme.headline4!
                                          .copyWith(
                                              color: Colors.blueGrey,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                    ),
                                    Spacer(),
                                    InkWell(
                                      onTap: () {
                                        Clipboard.setData(ClipboardData(
                                            text: user.referralDiscountCode!));
                                        AppSnackBar.showInfoSnackBar(context,
                                            message:
                                                'Referral code has been copied');
                                      },
                                      child: Icon(
                                        Feather.copy,
                                        color: AppColors.primaryColor,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            error: (error, stackTrace) {
                              return Text(
                                'Error fetching referral code. Pull to try again.',
                                textAlign: TextAlign.center,
                                style: context.textTheme.headline4!
                                    .copyWith(fontSize: 15),
                              );
                            },
                            loading: () {
                              return Text(
                                'Getting your referral code',
                                textAlign: TextAlign.center,
                                style: context.textTheme.headline3!.copyWith(
                                    color: Colors.black, fontSize: 15),
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
