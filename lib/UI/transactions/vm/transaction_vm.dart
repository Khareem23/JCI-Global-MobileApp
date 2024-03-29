import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jci_remit_mobile/controllers/request_state_notifier.dart';
import 'package:jci_remit_mobile/repositories/transaction_repository.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/bank_account_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/beneficiary_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/country_res.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/create_beneficiary_model.dart';
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

// final downloadProvider =
//     StreamProvider.autoDispose.family<String, num>((ref, transactionId) async* {
//   final trnxRepo = TransactionRepository(ref);
//   // Close the connection when the stream is destroyed
//   // ref.onDispose(() => trnxRepo.downloadFile(transactionId));

//   // Parse the value received and emit a Message instance
//   await for (final value in trnxRepo.downloadFile(transactionId)) {
//     yield value.toString();
//   }
// });

final sendingCurrency = FutureProvider.autoDispose<CurrencyModel>((ref) async {
  final trnxRepo = TransactionRepository(ref);
  return await trnxRepo.getAllSendingCurrency();
});
final getCountriesProvider =
    FutureProvider.autoDispose<List<CountryData>>((ref) async {
  final trnxRepo = TransactionRepository(ref);
  return await trnxRepo.getCountries();
});
final getbankAccountsProvider =
    FutureProvider.autoDispose<List<BankAccountData>>((ref) async {
  final trnxRepo = TransactionRepository(ref);
  return await trnxRepo.getBankAccounts();
});

// final statesProvider = FutureProvider.family<c.State, String>(
//         (_, countryCode) => UserService().getStates(countryCode));


final getbankAccountsBySendingCountryCodeProvider =
FutureProvider.family<List<BankAccountData>, String>((ref, countryCode) async {
  final trnxRepo = TransactionRepository(ref);
  return await trnxRepo.getBankAccountsBySendingCountry(countryCode);
});


final getBeneficiariesProvider =
    FutureProvider.autoDispose<List<BeneficiaryData>>((ref) async {
  final trnxRepo = TransactionRepository(ref);
  return await trnxRepo.getBeneficiaries();
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

final createBeneficiaryProvider =
    StateNotifierProvider<BeneficiaryRequestNotifier, RequestState>(
  (ref) => BeneficiaryRequestNotifier(ref.watch(trnxRepositoryProvider)),
);

class BeneficiaryRequestNotifier extends RequestStateNotifier<void> {
  final TransactionRepository _api;

  BeneficiaryRequestNotifier(this._api);

  Future<void> createBeneficiary(
          CreateBeneficiaryModel beneficiary, num? transactionId) =>
      makeRequest(() => _api.createBeneficiary(beneficiary, transactionId));
}

final addExistingBeneficiaryProvider =
    StateNotifierProvider<AddExistingBeneficiaryRequestNotifier, RequestState>(
  (ref) =>
      AddExistingBeneficiaryRequestNotifier(ref.watch(trnxRepositoryProvider)),
);

class AddExistingBeneficiaryRequestNotifier extends RequestStateNotifier<void> {
  final TransactionRepository _api;

  AddExistingBeneficiaryRequestNotifier(this._api);

  Future<void> addExistingBeneficiary(String beneficiary, num transactionId) =>
      makeRequest(
          () => _api.addBeneficiaryToTransaction(beneficiary, transactionId));
}

final uploadProvider =
    StateNotifierProvider<UploadRequestNotifier, RequestState>(
  (ref) => UploadRequestNotifier(ref.watch(trnxRepositoryProvider)),
);

class UploadRequestNotifier extends RequestStateNotifier<void> {
  final TransactionRepository _api;

  UploadRequestNotifier(this._api);

  Future<void> upload(num transactionId, String file) =>
      makeRequest(() => _api.uploadPaymentConfirmation(transactionId, file));
}

final addPaymentProvider =
    StateNotifierProvider<AddPaymentNotifier, RequestState<String>>(
  (ref) => AddPaymentNotifier(ref.watch(trnxRepositoryProvider)),
);

class AddPaymentNotifier extends RequestStateNotifier<String> {
  final TransactionRepository _api;

  AddPaymentNotifier(this._api);

  Future<void> addPayment(num transactionId, num paymentTypeId) => makeRequest(
      () => _api.addPaymentToTransaction(transactionId, paymentTypeId));

  Future<void> addPayment3(num transactionId, num paymentTypeId) => makeRequest(
          () => _api.addPaymentToTransaction2(transactionId, paymentTypeId));
}


