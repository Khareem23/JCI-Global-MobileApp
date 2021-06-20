import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/transactions/transaction_success.dart';
import 'package:jci_remit_mobile/UI/transactions/vm/transaction_vm.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/common/snackbar.dart';
import 'package:jci_remit_mobile/controllers/request_state_notifier.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/country_res.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/create_beneficiary_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/transaction_res.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:jci_remit_mobile/utils/extensions.dart';
import 'package:jci_remit_mobile/utils/navigator.dart';
import 'package:jci_remit_mobile/utils/theme.dart';

class SelectBeneficiaryScreen extends HookWidget {
  final TransactionData transactionData;
  const SelectBeneficiaryScreen({Key? key, required this.transactionData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = useState(GlobalKey<FormState>());
    var purposes = ['Family Support', 'School', 'Emergency'];
    final country = useTextEditingController();
    final bankName = useTextEditingController();
    final accNumber = useTextEditingController();
    final accName = useTextEditingController();
    final bankAddress = useTextEditingController();
    final bankState = useTextEditingController();
    final postalCode = useTextEditingController();
    final swiftCode = useTextEditingController();
    final bsb = useTextEditingController();
    final cBankName = useTextEditingController();
    final cAccNumber = useTextEditingController();
    final cAccName = useTextEditingController();
    final bankCity = useTextEditingController();
    final countryCode = useState('');
    final accCurrency = useState('');
    return ProviderListener(
      onChange: (BuildContext context, value) {
        if (value is Success) {
          context.navigate(TransactionSuccessScreen(
            transaction: transactionData,
          ));
        }
        if (value is Error) {
          AppSnackBar.showErrorSnackBar(context,
              message: value.error.toString());
        }
      },
      provider: createBeneficiaryProvider,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Select Beneficiary',
            style: TextStyle(color: Colors.black87),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     ListTile(
                //       contentPadding: EdgeInsets.zero,
                //       selected: true,
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10)),
                //       leading: CircleAvatar(
                //           child: Icon(
                //             Feather.user_plus,
                //             color: Colors.white,
                //           ),
                //           backgroundColor: Colors.teal),
                //       title: Text(
                //         'Enter Beneficiary Details',
                //         style: TextStyle(
                //             fontWeight: FontWeight.w800,
                //             fontSize: 16,
                //             color: Colors.teal),
                //       ),
                //       trailing: Icon(Icons.chevron_right, color: Colors.teal),
                //     ),
                //     SizedBox(
                //       height: 20,
                //     ),
                //     Text(
                //       'My Beneficiaries',
                //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                //     ),
                //     SizedBox(
                //       height: 20,
                //     ),
                //     ListTile(
                //         contentPadding: EdgeInsets.zero,
                //         leading: CircleAvatar(
                //             child: Text('AJ'), backgroundColor: Color(0xFFefecfd)),
                //         title: Text(
                //           'Temitope Ajiboye',
                //           style: TextStyle(
                //               fontWeight: FontWeight.w800,
                //               fontSize: 14,
                //               color: Colors.black87),
                //         ),
                //         subtitle: Text('Zenith Bank - 01234678')),
                //   ],
                // ),
                useProvider(getCountriesProvider).when(
                    data: (List<CountryData> value) {
                      return SingleChildScrollView(
                        child: Container(
                          // height: context.screenHeight(1),
                          child: Form(
                            key: _formKey.value,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Enter Beneficiary Details',
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.headline3!.copyWith(
                                      color: Colors.grey, fontSize: 14),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: country,
                                  readOnly: true,
                                  validator: (val) {
                                    if (val == null || val.isEmpty)
                                      return 'Select Country';
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Country',
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    suffixIcon: PopupMenuButton<CountryData>(
                                      icon: const Icon(Icons.arrow_drop_down),
                                      onSelected: (CountryData value) {
                                        country.text = value.country!;
                                        countryCode.value = value.alpha3Code!;
                                        accCurrency.value = value.currency!;
                                        print(value.alpha3Code);
                                      },
                                      itemBuilder: (BuildContext context) {
                                        return value
                                            .map<PopupMenuItem<CountryData>>(
                                                (CountryData value) {
                                          return new PopupMenuItem(
                                              child: new Text(value.country!),
                                              value: value);
                                        }).toList();
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: bankName,
                                  validator: (val) {
                                    if (val == null || val.isEmpty)
                                      return 'Select Bank Name';
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Bank Name',
                                    hintText: '',
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: accNumber,
                                  validator: (val) {
                                    if (val == null || val.isEmpty)
                                      return 'Enter Account Number';
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    labelText: 'Account Number / IBAN',
                                    hintText: '',
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: accName,
                                  validator: (val) {
                                    if (val == null || val.isEmpty)
                                      return 'Enter Account Name';
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Account Name',
                                    hintText: '',
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: bankState,
                                  validator: (val) {
                                    if (val == null || val.isEmpty)
                                      return 'Enter Bank State';
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Bank State',
                                    hintText: '',
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: bankCity,
                                  validator: (val) {
                                    if (val == null || val.isEmpty)
                                      return 'Enter Bank City';
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Bank City',
                                    hintText: '',
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: postalCode,
                                  validator: (val) {
                                    if (val == null || val.isEmpty)
                                      return 'Enter Postal Code';
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Postal Code',
                                    hintText: '',
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: bankAddress,
                                  // validator: (val) {
                                  //   if (val == null || val.isEmpty)
                                  //     return 'Enter Bank Address';
                                  //   return null;
                                  // },
                                  decoration: InputDecoration(
                                    labelText: 'Bank Address',
                                    hintText: '',
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: swiftCode,
                                        validator: (val) {
                                          if (val == null || val.isEmpty)
                                            return 'Enter Swift Code';
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'Swift',
                                          hintText: '',
                                          contentPadding: EdgeInsets.fromLTRB(
                                              20.0, 15.0, 20.0, 15.0),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller: bsb,
                                        decoration: InputDecoration(
                                          labelText: 'BSB(Optional)',
                                          hintText: '',
                                          contentPadding: EdgeInsets.fromLTRB(
                                              20.0, 15.0, 20.0, 15.0),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                countryCode.value != 'NGA'
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 40,
                                          ),
                                          Text(
                                            'Corresponding Bank (Optional)',
                                            style: context.textTheme.headline3!
                                                .copyWith(
                                                    color: Colors.grey,
                                                    fontSize: 14),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          TextFormField(
                                            controller: cBankName,
                                            decoration: InputDecoration(
                                              labelText: 'Bank Name',
                                              hintText: '',
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      20.0, 15.0, 20.0, 15.0),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          TextFormField(
                                            controller: cAccNumber,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            decoration: InputDecoration(
                                              labelText: 'Account Number',
                                              hintText: '',
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      20.0, 15.0, 20.0, 15.0),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          TextFormField(
                                            controller: cAccName,
                                            decoration: InputDecoration(
                                              labelText: 'Account Name',
                                              hintText: '',
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      20.0, 15.0, 20.0, 15.0),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : SizedBox.shrink(),
                                SizedBox(
                                  height: 20,
                                ),
                                Consumer(
                                  builder: (BuildContext context,
                                      T Function<T>(ProviderBase<Object?, T>)
                                          watch,
                                      Widget? child) {
                                    final vm = watch(createBeneficiaryProvider);
                                    return CustomButton(
                                        color: Colors.black,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        onPressed: vm is Loading
                                            ? null
                                            : () {
                                                if (!_formKey
                                                    .value.currentState!
                                                    .validate()) {
                                                  return null;
                                                }
                                                _formKey.value.currentState!
                                                    .save();
                                                final beneficiary =
                                                    CreateBeneficiaryModel(
                                                        country: country.text,
                                                        bankName: bankName.text,
                                                        bankState: bankState
                                                            .text,
                                                        bankPostalCode:
                                                            postalCode.text,
                                                        bankCity: bankCity.text,
                                                        bankAddress:
                                                            bankAddress.text,
                                                        accountCurrency:
                                                            accCurrency.value,
                                                        accountNumber:
                                                            accNumber.text,
                                                        accountSWiftCode:
                                                            swiftCode.text,
                                                        accountBsbCode:
                                                            bsb.text,
                                                        corresBankCountry:
                                                            country.text,
                                                        corresBankIban:
                                                            cAccNumber.text,
                                                        corresBankName:
                                                            cBankName.text,
                                                        accountName:
                                                            accName.text);
                                                context
                                                    .read(
                                                        createBeneficiaryProvider
                                                            .notifier)
                                                    .createBeneficiary(
                                                        beneficiary,
                                                        transactionData.id!);
                                                //showModal(context, purposes, purpose);
                                              },
                                        title: Text(
                                          vm is Loading
                                              ? 'LOADING...'
                                              : 'PROCEED',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: Sizes.TEXT_SIZE_16),
                                        ));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    error: (Object error, StackTrace? stackTrace) {
                      return Center(
                        child: Text('Cannot fetch countries '),
                      );
                    },
                    loading: () => Center(
                          child: CircularProgressIndicator(),
                        ))),
      ),
    );
  }
}
