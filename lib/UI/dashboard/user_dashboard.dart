import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/transactions/all_transactions_screen.dart';
import 'package:jci_remit_mobile/UI/transactions/create_transaction_screen.dart';
import 'package:jci_remit_mobile/UI/transactions/transaction_detail.dart';
import 'package:jci_remit_mobile/common/empty_state_widget.dart';
import 'package:jci_remit_mobile/utils/extensions.dart';
import 'package:jci_remit_mobile/utils/navigator.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:jci_remit_mobile/common/network_error_widget.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:jci_remit_mobile/utils/theme.dart';

import 'components/transaction_card.dart';
import 'viewmodels/user_dash_vm.dart';

class UserDashboard extends HookWidget {
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () => context.refresh(userTransactionsProvider),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor.withOpacity(0.1),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: 40, right: 40, top: 0, bottom: 20),
                height: MediaQuery.of(context).size.height * 0.23,
                width: MediaQuery.of(context).size.width,
                // decoration: BoxDecoration(color: AppColors.black),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Expanded(
                    //   flex: 2,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       useProvider(userProvider).when(
                    //         data: (user) {
                    //           return Text('Welcome, ${user.firstName} 👍🏽',
                    //               textAlign: TextAlign.center,
                    //               style: context.textTheme.headline4!
                    //                   .copyWith(fontSize: 20));
                    //         },
                    //         error: (error, stackTrace) {
                    //           return Text(
                    //             'Welcome',
                    //             textAlign: TextAlign.center,
                    //             style: context.textTheme.headline4!
                    //                 .copyWith(fontSize: 20),
                    //           );
                    //         },
                    //         loading: () {
                    //           return Text(
                    //             '',
                    //             textAlign: TextAlign.center,
                    //             style: context.textTheme.headline3!
                    //                 .copyWith(color: Colors.black, fontSize: 20),
                    //           );
                    //         },
                    //       ),
                    //       Icon(
                    //         Feather.bell,
                    //         color: Colors.black,
                    //       )
                    //     ],
                    //   ),
                    // ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // CircleAvatar(
                          //   backgroundColor: AppColors.primaryColor,
                          //   child: Icon(Feather.dollar_sign),
                          // ),
                          // Text(
                          //   'JCI Global LTD',
                          //   textAlign: TextAlign.center,
                          //   style: context.textTheme.headline3!.copyWith(
                          //       color: AppColors.primaryColor,
                          //       fontSize: 20,
                          //       fontWeight: FontWeight.bold),
                          // ),
                          // RichText(
                          //   textAlign: TextAlign.center,
                          //   text: TextSpan(
                          //     text: 'Send money across the world ',
                          //     style: context.textTheme.headline3!.copyWith(
                          //       color: Colors.black,
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          Image.asset("assets/images/logo.png",
                              width: MediaQuery.of(context).size.width * 0.4),
                          InkWell(
                            onTap: () =>
                                context.navigate(CreateTransactionScreen()),
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Send Now',
                                    textAlign: TextAlign.center,
                                    style: context.textTheme.headline3!
                                        .copyWith(color: Colors.white),
                                  ),
                                  // Spacer(),
                                  Icon(
                                    Icons.chevron_right,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                    color: Color(0xFFF9F9FB),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Stack(alignment: AlignmentDirectional.center, children: [
                  Image.asset('assets/images/watermark.png',
                      width: MediaQuery.of(context).size.width * 0.8),
                  ListView(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recent Transactions',
                            textAlign: TextAlign.start,
                            style: context.textTheme.headline4,
                          ),
                          InkWell(
                            onTap: () =>
                                navigator.pushTo(AllTransactionsScreen()),
                            child: Text(
                              'show more',
                              textAlign: TextAlign.start,
                              style: context.textTheme.headline3!
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: useProvider(userTransactionsProvider).when(
                          data: (transactions) {
                            if (transactions.isEmpty) {
                              return EmptyStateWidget(
                                errorTitle: '',
                                // TODO: Navigate to a create transaction screen
                                refreshCallBack: () =>
                                    context.navigate(CreateTransactionScreen()),
                                textOnButton: 'Send Money',
                              );
                            }
                            return ListView.separated(
                              shrinkWrap: true,
                              itemCount: transactions.length,
                              itemBuilder: (BuildContext context, int index) {
                                final trnx = transactions[index];
                                return InkWell(
                                  onTap: () =>
                                      context.navigate(TransactionDetail(
                                    data: trnx,
                                  )),
                                  child: TransactionCard(
                                    amountToReceive_Local: trnx.amountToReceive_Local!,
                                    amountToSend: trnx.amountToSend!,
                                    name: trnx.fullName!,
                                    receivingCounty: trnx.receivingCountry!,
                                    sendingCountry: trnx.sendingCountry!,
                                    transactionDate: trnx.dateSent!,
                                    transactionType: trnx.transactionType!,
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Divider(
                                  indent: 40,
                                );
                              },
                            );
                          },
                          error: (Object? error, StackTrace? stackTrace) {
                            return Center(
                                child: NetworkErrorWidget(
                              error:
                                  'Looks like we are unable to fetch your transactions at this time. Please try again',
                              refreshCallBack: () =>
                                  context.refresh(userTransactionsProvider),
                            ));
                          },
                          loading: () {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      ),

                      SizedBox(
                        height: 100,
                      ),
                      // TransactionCard(),
                      // Divider(),
                      // TransactionCard(),
                      // Divider()
                    ],
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
    // },
    // loading: () => Center(child: const CircularProgressIndicator()),
    // error: (err, stack) => NetworkErrorWidget(
    //       refreshCallBack: () => context.refresh(userProvider),
    //     ));
  }
}
