import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/dashboard/components/transaction_card.dart';
import 'package:jci_remit_mobile/UI/dashboard/viewmodels/user_dash_vm.dart';
import 'package:jci_remit_mobile/UI/transactions/transaction_detail.dart';
import 'package:jci_remit_mobile/common/empty_state_widget.dart';
import 'package:jci_remit_mobile/common/network_error_widget.dart';
import 'package:jci_remit_mobile/utils/navigator.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class AllTransactionsScreen extends HookWidget {
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Transactions',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () => context.refresh(userTransactionsProvider),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recent Transactions',
                textAlign: TextAlign.start,
                style: context.textTheme.headline4,
              ),
              Expanded(
                child: useProvider(userTransactionsProvider).when(
                  data: (transactions) {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: transactions.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (transactions.length > 0) {
                          final trnx = transactions[index];
                          return InkWell(
                            onTap: () {
                              context.navigate(TransactionDetail(
                                data: trnx,
                              ));
                            },
                            child: TransactionCard(
                                amountToReceive: trnx.amountToReceive!,
                                amountToSend: trnx.amountToSend!,
                                name: trnx.fullName!,
                                receivingCounty: trnx.receivingCountry!,
                                sendingCountry: trnx.sendingCountry!,
                                transactionDate: trnx.dateProcessed!,
                                transactionType: trnx.transactionType!),
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
            ],
          ),
        ),
      ),
    );
  }
}
