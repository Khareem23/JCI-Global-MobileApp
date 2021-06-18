import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/currency_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/rate_model.dart'
    as r;
import 'package:jci_remit_mobile/services/api/transaction/transaction_service.dart';

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

  Future<r.RateData> getRates(
      sendCurrencyCode, receiveCurrencyCode, num amount) async {
    final result = await _transactionService.getRate(
        sendCurrencyCode, receiveCurrencyCode, amount);

    return result.data!;
  }
}
