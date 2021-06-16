import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jci_remit_mobile/repositories/transaction_repository.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/currency_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/rate_model.dart'
    as r;
part 'transaction_vm.freezed.dart';

@freezed
class RateParam with _$RateParam {
  factory RateParam({
    required String sendCurrency,
    required String receiveCurrency,
  }) = _RateParam;
}

final receivingCurrency =
    FutureProvider.autoDispose<CurrencyModel>((ref) async {
  final trnxRepo = TransactionRepository(ref);
  return await trnxRepo.getAllReceivingCurrency();
});

final sendingCurrency = FutureProvider.autoDispose<CurrencyModel>((ref) async {
  final trnxRepo = TransactionRepository(ref);
  return await trnxRepo.getAllSendingCurrency();
});

final getRatesProvider =
    FutureProvider.family<r.Datum, RateParam>((ref, rateParam) async {
  final trnxRepo = TransactionRepository(ref);
  return await trnxRepo.getRates(
      rateParam.sendCurrency, rateParam.receiveCurrency);
});
