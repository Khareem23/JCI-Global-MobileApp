import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/transactions/vm/transaction_vm.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/common/snackbar.dart';
import 'package:jci_remit_mobile/controllers/request_state_notifier.dart';
import 'package:jci_remit_mobile/helper/static_config.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/beneficiary_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/country_res.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/create_beneficiary_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/transaction_res.dart';
import 'package:jci_remit_mobile/services/storage/shared_prefs.dart';
import 'package:jci_remit_mobile/utils/extensions.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/utils/utils.dart';
import 'package:jci_remit_mobile/values/values.dart';

import 'package:http/http.dart' as http;

class EditReceiverScreen extends StatefulWidget {
  final data;

  //SecondScreen({Key key, @required this.text}) : super(key: key);
  EditReceiverScreen({Key? key, required this.data}) : super(key: key);

  @override
  _EditReceiverScreenState createState() => _EditReceiverScreenState();
}

class _EditReceiverScreenState extends State<EditReceiverScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<ScaffoldState>();
  var beneficary;

  static final TextEditingController accountNumber = TextEditingController();
  static final TextEditingController accName = TextEditingController();
  static final TextEditingController bankName = TextEditingController();
  static final TextEditingController accCountry = TextEditingController();
  static final TextEditingController customerNumber = TextEditingController();
  static final TextEditingController bankAddress = TextEditingController();
  static final TextEditingController accSwiftCode = TextEditingController();
  static final TextEditingController id = TextEditingController();
  static final TextEditingController beneficiaryAddress =
      TextEditingController();
  static final TextEditingController bankIdentifierCode =
      TextEditingController();

  static final TextEditingController beneficiaryCountry =
      TextEditingController();
  static final TextEditingController bankIdentifier = TextEditingController();

  updateBeneficiary() async {
    showDialog(
        context: context,
        builder: (_) {
          return Center(child: CircularProgressIndicator());
        });
    // var data = {
    //   "accSwiftCode": accSwiftCode.text,
    //   "customerId": customerNumber.text,
    //   "accountNumber": accountNumber.text,
    //   "bankName": bankName.text,
    //   "accName": accName.text,
    //   "id": beneficary["id"],
    //   "bankAddress": bankAddress.text,
    //   "beneficiaryAddress": beneficiaryAddress.text,
    //   "bankIdentifier": bankIdentifier.text,
    // };
    var data = {
      "id": beneficary["id"],
      "customerId": customerNumber.text,
      "country": beneficary["country"],
      "bankName": bankName.text,
      "bankState": "NA",
      "bankPostalCode": "NA",
      "bankCity": "NA",
      "bankAddress": bankAddress.text,
      "accountCurrency": beneficary["accountCurrency"],
      "accountNumber": accountNumber.text,
      "accountName": accName.text,
      "accountSWiftCode": accSwiftCode.text,
      "accountBSBCode": beneficary["accountBSBCode"],
      "beneficiaryAddress": beneficiaryAddress.text,
      "beneficiaryCountry": beneficary["beneficiaryCountry"],
      "bankIdentifierCode": bankIdentifierCode.text,
      "bankIdentifier": bankIdentifier.text,
      "corresBankCountry": beneficary["corresBankCountry"],
      "corresBankName": beneficary["corresBankName"],
      "corresBankIBAN": beneficary["corresBankIBAN"],
      "corresBankAddress": beneficary["corresBankAddress"],
      "corresAccountName": beneficary["corresAccountName"]
    };

    final util = Util();
    final token = StorageUtil.getString(StaticConfig.token);
    final userMap = util.parseJwtPayLoad(token);
    //print(userMap);
    final userId = userMap['nameid'];

    var url = 'https://api.jciremit.com/api/transactions/UpdateReceiver/' +
        beneficary["id"].toString();
    print(url);
    print(data);

    try {
      var response = await http.put(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token
        },
      ).timeout(const Duration(seconds: 20));
      print(response.body);
      if (response.statusCode == 200) {
        Navigator.of(context).pop();
        // If the server did return a 200 OK response,
        // then parse the JSON.
        // print("Okay");
        // var body = json.decode(response.body);

        // setState(() {
        //   beneficary = body["data"];
        // });
        // print(beneficary);
      } else {
        Navigator.of(context).pop();
        throw Exception('Failed to load album');
      }
    } on Error catch (e) {
      Navigator.of(context).pop();
      return e.stackTrace;
    }

    print(data);
  }

  @override
  void initState() {
    super.initState();
    //print(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data == null) {
    } else {
      accSwiftCode.text = widget.data["accountSWiftCode"].toString();
      bankAddress.text = widget.data["bankAddress"].toString();
      customerNumber.text = widget.data["customerId"].toString();
      id.text = widget.data["id"].toString();
      accountNumber.text = widget.data["accountNumber"].toString();
      accName.text = widget.data["accountName"].toString();
      bankName.text = widget.data["bankName"].toString();
      beneficiaryAddress.text = widget.data["beneficiaryAddress"].toString();
      bankIdentifierCode.text = widget.data["bankIdentifierCode"].toString();
      beneficiaryCountry.text = widget.data["beneficiaryCountry"].toString();
      bankIdentifier.text = widget.data["bankIdentifier"].toString();
    }

    return Scaffold(
      key: _scaffoldKey,
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
          key: _formKey,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset('assets/images/watermark.png',
                  width: MediaQuery.of(context).size.width * 0.8),
              ListView(children: [
                SizedBox(
                  height: context.screenHeight(1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Beneficiary Details',
                        textAlign: TextAlign.center,
                        style: context.textTheme.headline3!
                            .copyWith(color: Colors.grey, fontSize: 14),
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
                      TextFormField(
                        controller: accCountry,
                        validator: (val) {
                          if (val == null || val.isEmpty)
                            return 'Field cannot be empty';
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Country',
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
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: bankIdentifier,
                        decoration: InputDecoration(
                          labelText: 'Bank Identifier',
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
                        controller: bankIdentifierCode,
                        decoration: InputDecoration(
                          labelText: 'Bank Identifier Code',
                          hintText: '',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Consumer(
                        builder: (BuildContext context,
                            T Function<T>(ProviderBase<Object?, T>) watch,
                            Widget? child) {
                          //final vm = watch(addAccountProvider);
                          return CustomButton(
                              color: Colors.black,
                              width: MediaQuery.of(context).size.width,
                              title: Text(
                                'UPDATE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Sizes.TEXT_SIZE_16),
                              ),
                              onPressed: () {
                                updateBeneficiary();
                              }
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
                              // },
                              // title: Text(
                              //   vm is Loading ? 'UPDATING...' : 'UPDATE',
                              //   style: TextStyle(
                              //       color: Colors.white,
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: Sizes.TEXT_SIZE_16),
                              );
                        },
                      ),
                    ],
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
