import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:jci_remit_mobile/controllers/request_state_notifier.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/transaction_res.dart';
import 'package:jci_remit_mobile/utils/navigator.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'vm/transaction_vm.dart';

class PoliLanderScreen extends StatefulWidget {
  final MyInAppBrowser browser = new MyInAppBrowser();
  final TransactionData transactionData;
  PoliLanderScreen({Key? key, required this.transactionData}) : super(key: key);

  @override
  State<PoliLanderScreen> createState() => _PoliLanderScreenState();
}

class _PoliLanderScreenState extends State<PoliLanderScreen> {
  var options = InAppBrowserClassOptions(
      crossPlatform: InAppBrowserOptions(hideUrlBar: false),
      inAppWebViewGroupOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(javaScriptEnabled: true)));
  @override
  Widget build(BuildContext context) {
    return ProviderListener(
      onChange: (BuildContext context, value) {
        if (value is Success) {
          print(value.value);
          widget.browser.openUrlRequest(
              urlRequest: URLRequest(url: Uri.parse(value.value)),
              options: options);
        }
      },
      provider: addPaymentProvider,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'POLI Direct Deposit',
            style: TextStyle(color: Colors.black87),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Click below to make a direct deposit payment by login to your POLI account to make payment and complete the transaction",
                  textAlign: TextAlign.center,
                  style: context.textTheme.headline4!
                      .copyWith(fontSize: 20, color: Colors.blueGrey),
                ),
                SizedBox(height: 30),
                Consumer(
                  builder: (BuildContext context,
                      T Function<T>(ProviderBase<Object?, T>) watch,
                      Widget? child) {
                    final vm = watch(addPaymentProvider);
                    return Container(
                      child: RaisedButton(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        onPressed: vm is Loading
                            ? null
                            : () => context
                                .read(addPaymentProvider.notifier)
                                .addPayment(widget.transactionData.id!, 0),
                        color: AppColors.accentColor,
                        child: Text(
                            vm is Loading ? 'Please wait...' : 'Pay Now',
                            style: btnAccentStyle),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyInAppBrowser extends InAppBrowser {
  @override
  Future onBrowserCreated() async {
    print("Browser Created!");
  }

  @override
  Future onLoadStart(url) async {
    print("Started $url");
  }

  @override
  Future onLoadStop(url) async {
    print("Stopped $url");
  }

  @override
  void onLoadError(url, code, message) {
    print("Can't load $url.. Error: $message");
  }

  @override
  void onProgressChanged(progress) {
    print("Progress: $progress");
  }

  @override
  void onExit() {
    print("Browser closed!");
  }
}
