import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jci_remit_mobile/controllers/request_state_notifier.dart';
import 'package:jci_remit_mobile/repositories/transaction_repository.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/currency_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/rate_model.dart'
    as r;
import 'package:jci_remit_mobile/services/api/transaction/model/rate_model.dart';
part 'transaction_vm.freezed.dart';

@freezed
class RateParam with _$RateParam {
  factory RateParam(
      {required String sendCurrency,
      required String receiveCurrency,
      required num amountToSend}) = _RateParam;
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

final getRatesParam = FutureProvider.autoDispose
    .family<RateData, RateParam>((ref, rateParam) async {
  final trnxRepo = TransactionRepository(ref);
  return await trnxRepo.getRates(rateParam.sendCurrency,
      rateParam.receiveCurrency, rateParam.amountToSend);
});
// final getRatesProvider =
//     StateNotifierProvider<GetRatesRequestNotifier, RequestState>(
//   (ref) => GetRatesRequestNotifier(ref.watch(trnxRepositoryProvider)),0
// );

// class GetRatesRequestNotifier extends RequestStateNotifier<void> {
//   final TransactionRepository _api;

//   GetRatesRequestNotifier(this._api);

//   Future<void> getRate(RateParam rateParam) => makeRequest(() => _api.getRates(
//       rateParam.sendCurrency,
//       rateParam.receiveCurrency,
//       rateParam.amountToSend));
// }
