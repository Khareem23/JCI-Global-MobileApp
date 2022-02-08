import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/profile/vm/profile_vm.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/controllers/request_state_notifier.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/beneficiary_model.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/utils/extensions.dart';
import 'package:jci_remit_mobile/values/values.dart';


class EditBeneficiaryScreen extends StatefulWidget {
  final BeneficiaryData data;

  EditBeneficiaryScreen({required this.data});

  @override
  _EditBeneficiaryScreenState createState() => _EditBeneficiaryScreenState();
}

class _EditBeneficiaryScreenState extends State<EditBeneficiaryScreen> {
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();
  static final GlobalKey<ScaffoldState> _Scaffoldkey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final accName = TextEditingController();
  var  bankName = TextEditingController();

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
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
