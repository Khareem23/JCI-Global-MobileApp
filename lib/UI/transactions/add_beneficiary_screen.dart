import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/transactions/vm/transaction_vm.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/common/snackbar.dart';
import 'package:jci_remit_mobile/controllers/request_state_notifier.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/country_res.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/create_beneficiary_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/transaction_res.dart';
import 'package:jci_remit_mobile/utils/extensions.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/values/values.dart';

class AddBeneficiaryScreen extends HookWidget {
  final TransactionData? transactionData;

  const AddBeneficiaryScreen({this.transactionData, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bankIdentifier = [
      'ABA/Fed Wire/Routing No',
      'BSB',
      'Chips Number',
      'IFSC code',
      'Sort code'
    ];
    print(transactionData);
    final _formKey = useState(GlobalKey<FormState>());
    var purposes = ['Family Support', 'School', 'Emergency'];
    final country = useTextEditingController();
    final bankName = useTextEditingController();
    final accNumber = useTextEditingController();
    final accName = useTextEditingController();
    final address = useTextEditingController();
    final bankAddress = useTextEditingController();
    final bankState = useTextEditingController();
    final postalCode = useTextEditingController();
    final swiftCode = useTextEditingController();
    final bsb = useTextEditingController();
    final cBankName = useTextEditingController();
    final cBankAddress = useTextEditingController();
    final cAccNumber = useTextEditingController();
    final cAccName = useTextEditingController();
    final bankCity = useTextEditingController();
    final bankIdentifierNumber = useTextEditingController();
    final countryCode = useState('');
    final accCurrency = useState('');
    final bankCountry = useTextEditingController();
    final bankidentifier_text = useTextEditingController();



    return ProviderListener(
      onChange: (BuildContext context, value) {
        if (value is Success) {
          Navigator.pop(context, 'BeneficiaryCreated');
          // context.navigate(TransactionSuccessScreen(
          //   transaction: transactionData,
          // ));
        }
        if (value is Error) {
          AppSnackBar.showErrorSnackBar(context,
              message: value.error.toString());
        }
      },
      provider: createBeneficiaryProvider,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: AppColors.white,
            ),
            onPressed: () {
              Navigator.pop(context, 'BeneficiaryCreatedFailed');
            },
          ),
          title: Text('Add Beneficiary',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.TEXT_SIZE_18,
                  fontWeight: FontWeight.bold)),
          backgroundColor: AppColors.red,
        ),
        body: Stack(alignment: AlignmentDirectional.center, children: [
          Image.asset('assets/images/watermark.png',
              width: MediaQuery.of(context).size.width * 0.8),
          useProvider(getCountriesProvider).when(
              data: (List<CountryData> value) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                //  height: context.screenHeight(1),
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
                        style: context.textTheme.headline3!
                            .copyWith(color: Colors.grey, fontSize: 14),
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
                          labelText: 'Beneficiary Name*',
                          hintText: '',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: address,
                        validator: (val) {
                          if (val == null || val.isEmpty)
                            return 'Enter Address';
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Beneficiary Address*',
                          hintText: '',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
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
                          hintText: 'Beneficiary Country*',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
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
                              return value.map<PopupMenuItem<CountryData>>(
                                  (CountryData value) {
                                return new PopupMenuItem(
                                    child:
                                        new Text(value.country!.toUpperCase()),
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
                          labelText: 'Account Number / IBAN*',
                          hintText: '',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Enter Beneficiary Bank Detail',
                        style: context.textTheme.headline3!
                            .copyWith(color: Colors.grey, fontSize: 14),
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
                          labelText: 'Bank Name*',
                          hintText: '',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // TextFormField(
                      //   controller: bankState,
                      //   validator: (val) {
                      //     if (val == null || val.isEmpty)
                      //       return 'Enter Bank State';
                      //     return null;
                      //   },
                      //   decoration: InputDecoration(
                      //     labelText: 'Bank State',
                      //     hintText: '',
                      //     contentPadding:
                      //         EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(5.0),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // TextFormField(
                      //   controller: bankCity,
                      //   validator: (val) {
                      //     if (val == null || val.isEmpty)
                      //       return 'Enter Bank City';
                      //     return null;
                      //   },
                      //   decoration: InputDecoration(
                      //     labelText: 'Bank City',
                      //     hintText: '',
                      //     contentPadding:
                      //         EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(5.0),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // TextFormField(
                      //   controller: postalCode,
                      //   validator: (val) {
                      //     if (val == null || val.isEmpty)
                      //       return 'Enter Postal Code';
                      //     return null;
                      //   },
                      //   decoration: InputDecoration(
                      //     labelText: 'Postal Code',
                      //     hintText: '',
                      //     contentPadding:
                      //         EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(5.0),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: bankAddress,
                        validator: (val) {
                          if (val == null || val.isEmpty)
                            return 'Enter Bank Address';
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Bank Address*',
                          hintText: '',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: swiftCode,
                        validator: (val) {
                          if (val == null || val.isEmpty)
                            return 'Enter Swift Code';
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Swift*',
                          hintText: '',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: bankCountry,
                        readOnly: true,
                        validator: (val) {
                          if (val == null || val.isEmpty)
                            return 'Select Country';
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Bank Country*',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          suffixIcon: PopupMenuButton<CountryData>(
                            icon: const Icon(Icons.arrow_drop_down),
                            onSelected: (CountryData value) {
                              bankCountry.text = value.country!;
                              //countryCode.value = value.alpha3Code!;
                              // accCurrency.value = value.currency!;
                              //print(value.alpha3Code);
                            },
                            itemBuilder: (BuildContext context) {
                              return value.map<PopupMenuItem<CountryData>>(
                                  (CountryData value) {
                                return new PopupMenuItem(
                                    child:
                                        new Text(value.country!.toUpperCase()),
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
                        controller: bankidentifier_text,
                        readOnly: true,
                        validator: (val) {
                          if (val == null || val.isEmpty)
                            return 'Select Bank Identifier';
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Bank Identifier (ABA,BSB)',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          suffixIcon: PopupMenuButton<String>(
                            icon: const Icon(Icons.arrow_drop_down),
                            onSelected: (String value) {
                              bankidentifier_text.text = value;
                            },
                            itemBuilder: (BuildContext context) {
                              return bankIdentifier
                                  .map<PopupMenuItem<String>>((String value) {
                                return new PopupMenuItem(
                                    child: new Text(value), value: value);
                              }).toList();
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: bankIdentifierNumber,
                        validator: (val) {
                          if (val == null || val.isEmpty)
                            return 'Enter Bank Identifier Number';
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Bank Identifier Number',
                          hintText: '',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),
                      countryCode.value != 'NGA'
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  'Corresponding Bank Detail (Optional)',
                                  style: context.textTheme.headline3!.copyWith(
                                      color: Colors.grey, fontSize: 14),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: cBankName,
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
                                  controller: cBankAddress,
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
                                TextFormField(
                                  controller: cAccName,
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
                                  controller: cAccNumber,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    labelText: 'Account Number',
                                    hintText: '',
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                )
                              ],
                            )
                          : SizedBox.shrink(),
                      SizedBox(
                        height: 40,
                      ),
                      Consumer(
                        builder: (BuildContext context,
                            T Function<T>(ProviderBase<Object?, T>) watch,
                            Widget? child) {
                          final vm = watch(createBeneficiaryProvider);
                          return CustomButton(
                              color: AppColors.primaryColor,
                              width: MediaQuery.of(context).size.width,
                              onPressed: vm is Loading
                                  ? null
                                  : () {
                                      if (!_formKey.value.currentState!
                                          .validate()) {
                                        return null;
                                      }
                                      _formKey.value.currentState!.save();
                                     // submit();
                                      final beneficiary =
                                          CreateBeneficiaryModel(
                                              country: bankCountry.text,
                                              bankName: bankName.text,
                                              bankState: bankState.text,
                                              bankPostalCode: postalCode.text,
                                              bankCity: bankCity.text,
                                              bankAddress: bankAddress.text,
                                              accountCurrency:accCurrency.value,
                                              accountNumber: accNumber.text,
                                              beneficiaryAddress: address.text,
                                              accountSWiftCode: swiftCode.text,
                                              beneficiaryCountry: country.text,
                                              bankIdentifierCode: bankIdentifierNumber.text,
                                              bankIdentifier:bankidentifier_text.text,
                                              accountBsbCode: bsb.text,
                                              corresBankCountry: country.text,
                                              corresBankIban: cAccNumber.text,
                                              corresBankName: cBankName.text,
                                              corresBankAddress:cBankAddress.text,
                                              accountName: accName.text);
                                      context
                                          .read(createBeneficiaryProvider
                                              .notifier)
                                          .createBeneficiary(
                                              beneficiary, transactionData?.id);
                                    },
                              title: Text(
                                vm is Loading ? 'LOADING...' : 'PROCEED',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Sizes.TEXT_SIZE_16),
                              ));
                        },
                      ),
                      SizedBox(height: 100)
                    ],
                  ),
                ),
              ),
            );
          }, error: (Object error, StackTrace? stackTrace) {
            return Center(child: Text('Error fetching banks'));
          }, loading: () {
            return Center(child: CircularProgressIndicator());
          })
        ]),
      ),
    );
  }
}
