import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:jci_remit_mobile/UI/dashboard/components/activity_card.dart';
import 'package:jci_remit_mobile/common/network_error_widget.dart';
import 'package:jci_remit_mobile/values/values.dart';

import 'components/transaction_card.dart';
import 'viewmodels/user_dash_vm.dart';

class UserDashboard extends HookWidget {
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;

    return useProvider(userProvider).when(
        data: (user) {
          return RefreshIndicator(
            onRefresh: () => context.refresh(userProvider),
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: AppColors.accentColor,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: AppColors.accentColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Welcome, ${user.firstName} 😉',
                                  textAlign: TextAlign.center,
                                  style: theme.headline3.copyWith(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Icon(
                                  Feather.bell,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Balance',
                                  textAlign: TextAlign.center,
                                  style: theme.headline3
                                      .copyWith(color: Colors.white),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        text: 'NGN ',
                                        style: theme.headline3.copyWith(
                                          color: Colors.white,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: user.balance.toString(),
                                            style: theme.headline2.copyWith(
                                                color: Colors.white,
                                                fontSize: 35,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: AppColors.colorShade1,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: AppColors.colorShade2)),
                                      child: Center(
                                        child: Text(
                                          'Top up',
                                          textAlign: TextAlign.center,
                                          style: theme.headline3
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        color: Color(0xFFF9F9FB),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Activity',
                              textAlign: TextAlign.start,
                              style: theme.headline4,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () =>{},
                                    child: ActivityCard(
                                        title: 'Give Cash',
                                        icon: FontAwesome.location_arrow),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () => {},
                                    child: ActivityCard(
                                        title: 'Receive Cash',
                                        icon: FontAwesome.handshake_o),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: ActivityCard(
                                      title: 'Transfer',
                                      icon: FontAwesome.share),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Recent Transactions',
                                  textAlign: TextAlign.start,
                                  style: theme.headline4,
                                ),
                                Text(
                                  'show more',
                                  textAlign: TextAlign.start,
                                  style: theme.headline3
                                      .copyWith(color: AppColors.colorShade1),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TransactionCard(),
                            Divider(
                              indent: 40,
                            ),
                            TransactionCard(),
                            Divider(),
                            TransactionCard(),
                            Divider()
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            ),
          );
        },
        loading: () => Center(child: const CircularProgressIndicator()),
        error: (err, stack) => NetworkErrorWidget(
              refreshCallBack: () => context.refresh(userProvider),
            ));
  }
}
