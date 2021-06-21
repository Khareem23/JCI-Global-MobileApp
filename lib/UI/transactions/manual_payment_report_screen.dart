import 'package:flutter/material.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/transaction_res.dart';

class ManualPaymentReportScreen extends StatelessWidget {
  final TransactionData transactionData;
  const ManualPaymentReportScreen({Key? key, required this.transactionData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Complete Manual Payment',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
