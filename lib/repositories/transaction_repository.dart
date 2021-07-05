import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/helper/static_config.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/bank_account_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/beneficiary_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/country_res.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/create_beneficiary_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/create_transaction_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/currency_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/rate_model.dart'
    as r;
import 'package:jci_remit_mobile/services/api/transaction/model/transaction_res.dart';
import 'package:jci_remit_mobile/services/api/transaction/transaction_service.dart';
import 'package:jci_remit_mobile/services/storage/shared_prefs.dart';
import 'package:jci_remit_mobile/utils/utils.dart';

final trnxRepositoryProvider = Provider<TransactionRepository>((ref) {
  return TransactionRepository(ref);
});

class TransactionRepository {
  final ProviderReference ref;
  late TransactionService _transactionService;

  TransactionRepository(this.ref) {
    _transactionService = ref.watch(trnxServiceProvider);
  }
  Future<CurrencyModel> getAllReceivingCurrency() async {
    return await _transactionService.getAllReceivingCurrency();
  }

  Future<CurrencyModel> getAllSendingCurrency() async {
    return await _transactionService.getAllSendingCurrency();
  }

  Future<List<CountryData>> getCountries() async {
    final res = await _transactionService.getCountries();
    return res.data!;
  }

  Future<List<BankAccountData>> getBankAccounts() async {
    final res = await _transactionService.getBankAccounts();
    return res.data!;
  }

  Future<List<BeneficiaryData>> getBeneficiaries() async {
    final res = await _transactionService.getBeneficiaries();
    return res.data!;
  }

  Future<TransactionData> createTransaction(
      CreateTransactionModel transaction) async {
    final customerId = getCustomerId();
    final transactionX =
        transaction.copyWith(customerId: num.parse(customerId));
    final res = await _transactionService.createTransaction(transactionX);
    return res.data!;
  }

  Future<bool> createBeneficiary(
      CreateBeneficiaryModel beneficiary, num? transactionId) async {
    final customerId = getCustomerId();
    final beneficiaryX =
        beneficiary.copyWith(customerId: int.parse(customerId));
    final res = await _transactionService.createBeneficiary(
        beneficiaryX, transactionId);
    return res;
  }

  Future<bool> addBeneficiaryToTransaction(
      num beneficiary, num transactionId) async {
    final res = await _transactionService.addExistingBeneficiary(
        beneficiary, transactionId);
    return res;
  }

  Future<r.RateData> getRates(
      sendCurrencyCode, receiveCurrencyCode, num amount) async {
    final result = await _transactionService.getRate(
        sendCurrencyCode, receiveCurrencyCode, amount);

    return result.data!;
  }

  Future<bool> uploadPaymentConfirmation(num transactionId, String file) async {
    final result = await _transactionService.uploadPaymentConfirmation(
        transactionId, file);
    return result;
  }

  Future<String> addPaymentToTransaction(
      num transactionId, num paymentTypeId) async {
    final result = await _transactionService.addPaymentToTransaction(
        transactionId, paymentTypeId);

    return result;
  }

  String getCustomerId() {
    final util = Util();
    final token = StorageUtil.getString(StaticConfig.token);
    final userMap = util.parseJwtPayLoad(token);
    print(userMap);
    final userId = userMap['nameid'];
    return userId;
  }
}
