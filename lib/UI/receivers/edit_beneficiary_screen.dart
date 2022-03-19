import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/profile/vm/profile_vm.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/controllers/request_state_notifier.dart';
import 'package:jci_remit_mobile/helper/static_config.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/beneficiary_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/country_res.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/utils/extensions.dart';
import 'package:jci_remit_mobile/utils/utils.dart';
import 'package:jci_remit_mobile/values/values.dart';

import 'package:http/http.dart' as http;
import '../../services/storage/shared_prefs.dart';
import '../transactions/vm/transaction_vm.dart';

class EditBeneficiaryScreen extends StatefulWidget {
  final BeneficiaryData data;

  EditBeneficiaryScreen({required this.data});

  @override
  _EditBeneficiaryScreenState createState() => _EditBeneficiaryScreenState();
}

class _EditBeneficiaryScreenState extends State<EditBeneficiaryScreen> {
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();
  static final GlobalKey<ScaffoldState> _Scaffoldkey =
      GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final accName = TextEditingController();
  var bankName = TextEditingController();
  var country = TextEditingController();
  List countries =[];


  getCountries() async {
    final util = Util();
    final token = StorageUtil.getString(StaticConfig.token);
    final userMap = util.parseJwtPayLoad(token);
    //print(userMap);
    final userId = userMap['nameid'];

    final url = 'https://api.jciremit.com/Users/getCountries';
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token
        },
      ).timeout(const Duration(seconds: 20));
     // countries =  response.body;
      print(response.body);
      // final result = countryResFromJson(response);
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        print(body);
      } else {
        Navigator.of(context).pop();
        throw Exception('Failed to load album');
      }
    } on Error catch (e) {
      Navigator.of(context).pop();
      return e.stackTrace;
    }
  }

  @override
  void initState() {
    super.initState();
    getCountries();
  }

  @override
  Widget build(BuildContext context) {

    final accountNumber = TextEditingController();
    accountNumber.value = TextEditingValue(
      text: widget.data.accountNumber.toString(),
      selection: TextSelection.fromPosition(
        TextPosition(offset: widget.data.accountNumber.toString().length),
      ),
    );

    accName.value = TextEditingValue(
      text: widget.data.accountName.toString(),
      selection: TextSelection.fromPosition(
        TextPosition(offset: widget.data.accountName.toString().length),
      ),
    );
    bankName.value = TextEditingValue(
      text: widget.data.bankName.toString(),
      selection: TextSelection.fromPosition(
        TextPosition(offset: widget.data.bankName.toString().length),
      ),
    );
    final accCountry = TextEditingController();
    accCountry.value = TextEditingValue(
      text: widget.data.country.toString(),
      selection: TextSelection.fromPosition(
        TextPosition(offset: widget.data.country.toString().length),
      ),
    );

    final customerNumber = TextEditingController();
    customerNumber.value = TextEditingValue(
      text: widget.data.customerId.toString(),
      selection: TextSelection.fromPosition(
        TextPosition(offset: widget.data.customerId.toString().length),
      ),
    );

    final bankAddress = TextEditingController();
    bankAddress.value = TextEditingValue(
      text: widget.data.bankAddress.toString(),
      selection: TextSelection.fromPosition(
        TextPosition(offset: widget.data.bankAddress.toString().length),
      ),
    );

    final accSwiftCode = TextEditingController();
    accSwiftCode.value = TextEditingValue(
      text: widget.data.accountSWiftCode.toString(),
      selection: TextSelection.fromPosition(
        TextPosition(offset: widget.data.accountSWiftCode.toString().length),
      ),
    );

    return Scaffold(
        key: _key,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: AppColors.white,
            ),
            onPressed: () {
              Navigator.pop(context, 'BeneficiaryUpdateFailed');
            },
          ),
          title: Text('Beneficiary Details',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.TEXT_SIZE_18,
                  fontWeight: FontWeight.bold)),
          backgroundColor: AppColors.red,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _Scaffoldkey,
            child: Stack(alignment: AlignmentDirectional.center, children: [
              Image.asset('assets/images/watermark.png',
                  width: MediaQuery.of(context).size.width * 0.8),
              ListView(
                children: [
                  SizedBox(
                    height: context.screenHeight(1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enter Bank Details',
                          textAlign: TextAlign.center,
                          style: context.textTheme.headline3!
                              .copyWith(color: Colors.grey, fontSize: 14),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: customerNumber,
                          readOnly: true,
                          validator: (val) {
                            if (val == null || val.isEmpty)
                              return 'Field cannot be empty';
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                          ],
                          decoration: InputDecoration(
                            labelText: 'Customer Number',
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
                          controller: accountNumber,
                          readOnly: true,
                          validator: (val) {
                            if (val == null || val.isEmpty)
                              return 'Field cannot be empty';
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                          ],
                          decoration: InputDecoration(
                            labelText: 'Account Number / IBAN',
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
                          controller: accName,
                          validator: (val) {
                            if (val == null || val.isEmpty)
                              return 'Field cannot be empty';
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Account Name',
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
                          controller: bankAddress,
                          validator: (val) {
                            if (val == null || val.isEmpty)
                              return 'Field cannot be empty';
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Bank Address',
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
                          controller: bankName,
                          validator: (val) {
                            if (val == null || val.isEmpty)
                              return 'Field cannot be empty';
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Bank Name',
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
                        DropdownButtonFormField(
                            // value: country.value != null ? country.value : null,
                            hint: Text("Select Country of Residence"),
                            isDense: true,
                            decoration: InputDecoration(
                              hintText: 'Select Country of Residence',
                              // filled: true,
                              // fillColor: phoneBgColor.value,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              border: Borders.customOutlineInputBorder(),
                              enabledBorder: Borders.customOutlineInputBorder(),
                              focusedBorder: Borders.customOutlineInputBorder(
                                  color: AppColors.primaryColor),
                              // focusColor: AppColors.accentColor.withOpacity(0.8),
                            ),
                            onChanged: (String? newValue) {
                              // countryOfResidence.value = newValue!;
                              // context
                              //     .read(statesProvider(countryOfResidence.value));
                              // state.value = '';
                            },
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please select a country';
                              }
                              return null;
                            },

                            items: countries
                                .map<DropdownMenuItem<String>>(
                                    (value) => DropdownMenuItem(
                                          value: value.alpha3Code,
                                          child: Text(value.country!),
                                        ))
                                .toList()),
                        // TextFormField(
                        //   controller: accCountry,
                        //   readOnly: true,
                        //   validator: (val) {
                        //     if (val == null || val.isEmpty)
                        //       return 'Select Country';
                        //     return null;
                        //   },
                        //   decoration: InputDecoration(
                        //     hintText: 'Beneficiary Country*',
                        //     contentPadding:
                        //         EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(5.0),
                        //     ),
                        //     suffixIcon: PopupMenuButton<CountryData>(
                        //       icon: const Icon(Icons.arrow_drop_down),
                        //       onSelected: (CountryData value) {
                        //         country.text = value.country!;
                        //         countryCode.value = value.alpha3Code!;
                        //         accCurrency.value = value.currency!;
                        //         print(value.alpha3Code);
                        //       },
                        //       itemBuilder: (BuildContext context) {
                        //         return value.map<PopupMenuItem<CountryData>>(
                        //             (CountryData value) {
                        //           return new PopupMenuItem(
                        //               child: new Text(
                        //                   value.country!.toUpperCase()),
                        //               value: value);
                        //         }).toList();
                        //       },
                        //     ),
                        //   ),
                        // ),
                        // TextFormField(
                        //   controller: accCountry,
                        //   validator: (val) {
                        //     if (val == null || val.isEmpty)
                        //       return 'Field cannot be empty';
                        //     return null;
                        //   },
                        //   decoration: InputDecoration(
                        //     labelText: 'Country',
                        //     hintText: '',
                        //     contentPadding:
                        //     EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(5.0),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: accSwiftCode,
                          decoration: InputDecoration(
                            labelText: 'Swift Code',
                            hintText: '',
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                        // Spacer(),
                        SizedBox(height: 100),
                        Consumer(
                          builder: (BuildContext context,
                              T Function<T>(ProviderBase<Object?, T>) watch,
                              Widget? child) {
                            final vm = watch(addAccountProvider);
                            return CustomButton(
                                color: Colors.black,
                                width: MediaQuery.of(context).size.width,
                                onPressed: vm is Loading
                                    ? null
                                    : () {
                                        // if (!_formKey.currentState!
                                        //     .validate()) {
                                        //   return null;
                                        // }
                                        // _formKey.currentState!.save();
                                        // context
                                        //     .read(addAccountProvider.notifier)
                                        //     .addAccount(
                                        //     accCountry.text,
                                        //     bankName.text,
                                        //     accountNumber.text,
                                        //     accName.text,
                                        //     accSwiftCode.text);
                                        // context.popView();
                                      },
                                title: Text(
                                  vm is Loading ? 'UPDATING...' : 'UPDATE',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Sizes.TEXT_SIZE_16),
                                ));
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ]),
          ),
        ));
  }
}
