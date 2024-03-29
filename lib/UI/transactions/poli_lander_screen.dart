import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:jci_remit_mobile/UI/transactions/poli_webview.dart';
import 'package:jci_remit_mobile/UI/transactions/transaction_success.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/common/snackbar.dart';
import 'package:jci_remit_mobile/controllers/request_state_notifier.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/transaction_res.dart';
import 'package:jci_remit_mobile/utils/navigator.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'payment_success.dart';
import 'vm/transaction_vm.dart';

class PoliLanderScreen extends StatefulWidget {
  final TransactionData transactionData;
  PoliLanderScreen({Key? key, required this.transactionData}) : super(key: key);

  @override
  State<PoliLanderScreen> createState() => _PoliLanderScreenState();
}

class _PoliLanderScreenState extends State<PoliLanderScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderListener(
      onChange: (BuildContext context, value) async {
        if (value is Success) {
          final text = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PoliWebView(url: value.value)),
          );

          // Perform action based on returned data from WebView
          if (text == 'failed')
            return AppSnackBar.showErrorSnackBar(context,
                message: 'POLI transaction has failed. Please try again');
          if (text == 'success') return context.navigate(PaymentSuccess());
        }
      },
      provider: addPaymentProvider,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: AppColors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text('POLI Direct Deposit',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.TEXT_SIZE_18,
                  fontWeight: FontWeight.bold)),
          backgroundColor: AppColors.red,
        ),
        bottomSheet: Consumer(
          builder: (BuildContext context,
              T Function<T>(ProviderBase<Object?, T>) watch,
              Widget? child) {
            final vm = watch(addExistingBeneficiaryProvider);
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(
                  color: AppColors.primaryColor,
                  width: MediaQuery.of(context).size.width,
                  onPressed: vm is Loading
                      ? null
                      : () => context
                      .read(addPaymentProvider.notifier)
                      .addPayment3(widget.transactionData.id!, 1),
                  title: Text(
                    vm is Loading ? 'PLEASE WAIT...' : 'PROCEED',
                    style: btnAccentStyle,
                  )),
            );
          },
        ),

        body: Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Center(
            child: Stack(alignment: AlignmentDirectional.center, children: [
              Image.asset('assets/images/watermark.png',
                  width: MediaQuery.of(context).size.width * 0.8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Click below to make a direct deposit payment by login to your POLI account to make payment and complete the transaction",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                  ),
                  SizedBox(height: 100),
                  // Consumer(
                  //   builder: (BuildContext context,
                  //       T Function<T>(ProviderBase<Object?, T>) watch,
                  //       Widget? child) {
                  //     final vm = watch(addPaymentProvider);
                  //     return Container(
                  //       child: RaisedButton(
                  //         padding: const EdgeInsets.symmetric(
                  //             horizontal: 40, vertical: 15),
                  //         onPressed: vm is Loading
                  //             ? null
                  //             : () => context
                  //                 .read(addPaymentProvider.notifier)
                  //                 .addPayment3(widget.transactionData.id!, 1),
                  //         // onPressed: () {
                  //         //   print(widget.transactionData.id);
                  //         // },
                  //         color: AppColors.primaryColor,
                  //         child: Text(
                  //             vm is Loading ? 'Please wait...' : 'Pay Now',
                  //             style: btnAccentStyle),
                  //       ),
                  //     );
                  //   },
                  // )
                ],
              )
            ]),
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
    if (url.toString().contains("POLiFailure")) {
      print('Transaction Failed');
    }
    if (url.toString().contains("Success")) {
      print('Transaction Successful');
    }
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
