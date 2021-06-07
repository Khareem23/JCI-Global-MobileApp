import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/transactions/all_transactions_screen.dart';
import 'package:jci_remit_mobile/UI/transactions/create_transaction_screen.dart';
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
    var theme = context.themeData.textTheme;

    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () => context.refresh(userTransactionsProvider),
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: AppColors.black),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        useProvider(userProvider).when(
                          data: (user) {
                            return Text(
                              'Welcome, ${user.firstName} 👍🏽',
                              textAlign: TextAlign.center,
                              style: theme.headline3
                                  .copyWith(color: Colors.white, fontSize: 20),
                            );
                          },
                          error: (error, stackTrace) {
                            return Text(
                              'Welcome',
                              textAlign: TextAlign.center,
                              style: context.textTheme.headline3
                                  .copyWith(color: Colors.white, fontSize: 20),
                            );
                          },
                          loading: () {
                            return Text(
                              '',
                              textAlign: TextAlign.center,
                              style: context.textTheme.headline3
                                  .copyWith(color: Colors.white, fontSize: 20),
                            );
                          },
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'Send money across the world ',
                                style: context.textTheme.headline3.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () =>
                                  context.navigate(CreateTransactionScreen()),
                              child: Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    'Send Now',
                                    textAlign: TextAlign.center,
                                    style: context.textTheme.headline3
                                        .copyWith(color: Colors.white),
                                  ),
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
                child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xFFF9F9FB),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        onTap: () => navigator.pushTo(AllTransactionsScreen()),
                        child: Text(
                          'show more',
                          textAlign: TextAlign.start,
                          style: context.textTheme.headline3
                              .copyWith(color: AppColors.primaryColor),
                        ),
                      ),
                    ],
                  ),
                  useProvider(userTransactionsProvider).when(
                    data: (transactions) {
                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: transactions.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (transactions.length > 0) {
                            final trnx = transactions[index];
                            return TransactionCard(
                              amountToReceive: trnx.amountToReceive,
                              amountToSend: trnx.amountToSend,
                              name: trnx.fullName,
                              receivingCounty: trnx.receivingCountry,
                              sendingCountry: trnx.sendingCountry,
                              transactionDate: trnx.dateProcessed,
                              transactionType: trnx.transactionType,
                            );
                          }
                          return EmptyStateWidget(
                            // TODO: Navigate to a create transaction screen
                            refreshCallBack: () => {},
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            indent: 40,
                          );
                        },
                      );
                    },
                    error: (Object error, StackTrace stackTrace) {
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

                  // Divider(
                  //   indent: 40,
                  // ),
                  // TransactionCard(),
                  // Divider(),
                  // TransactionCard(),
                  // Divider()
                ],
              ),
            ))
          ],
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
