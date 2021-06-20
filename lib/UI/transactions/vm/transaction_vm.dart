import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jci_remit_mobile/controllers/request_state_notifier.dart';
import 'package:jci_remit_mobile/repositories/transaction_repository.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/country_res.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/create_transaction_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/currency_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/rate_model.dart'
    as r;
import 'package:jci_remit_mobile/services/api/transaction/model/rate_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/transaction_res.dart';
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
final getCountriesProvider =
    FutureProvider.autoDispose<List<CountryData>>((ref) async {
  final trnxRepo = TransactionRepository(ref);
  return await trnxRepo.getCountries();
});

final getRatesParam = FutureProvider.autoDispose
    .family<RateData, RateParam>((ref, rateParam) async {
  final trnxRepo = TransactionRepository(ref);
  return await trnxRepo.getRates(rateParam.sendCurrency,
      rateParam.receiveCurrency, rateParam.amountToSend);
});
// final createTrnxProvider = FutureProvider.autoDispose
//     .family<TransactionData, CreateTransactionModel>((ref, transaction) async {
//   final trnxRepo = TransactionRepository(ref);
//   return await trnxRepo.createTransaction(transaction);
// });
final createTrnxProvider = StateNotifierProvider<CreateTnxRequestNotifier,
    RequestState<TransactionData>>(
  (ref) => CreateTnxRequestNotifier(ref.watch(trnxRepositoryProvider)),
);

class CreateTnxRequestNotifier extends RequestStateNotifier<TransactionData> {
  final TransactionRepository _api;

  CreateTnxRequestNotifier(this._api);

  Future<void> createTransaction(CreateTransactionModel transaction) =>
      makeRequest(() => _api.createTransaction(transaction));
}
