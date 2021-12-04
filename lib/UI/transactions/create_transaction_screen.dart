import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/common/snackbar.dart';
import 'package:jci_remit_mobile/controllers/request_state_notifier.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/create_transaction_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/currency_model.dart';
import 'package:jci_remit_mobile/utils/extensions.dart';
import 'package:jci_remit_mobile/utils/navigator.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:just_debounce_it/just_debounce_it.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/rate_model.dart';

import 'select_beneficiary_screen.dart';
import 'vm/transaction_vm.dart';

class CreateTransactionScreen extends HookWidget {
  final formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var purposes = [
      'Education Fees',
      'Family Support',
      'Goods & Services',
      'Medical Fees'
    ];
    final sendingCountry = useState('AUS');
    final receivingCountry = useState('AUS');
    final defaultSendingCountryFlag =
        useState('https://restcountries.eu/data/aus.svg');
    final defaultReceivingCountryFlag =
        useState('https://restcountries.eu/data/aus.svg');
    final purpose = useTextEditingController();
    final description = useTextEditingController();
    final bonus = useTextEditingController();
    final sendAmountController = useTextEditingController(text: '1');
    final amount = _useDebouncedSearch(sendAmountController);

    return ProviderListener(
      onChange: (BuildContext context, value) {
        if (value is Success) {
          print('Transaction has been created');
          print(value.value);
          context.navigate(SelectBeneficiaryScreen(
            transactionData: value.value,
          ));
        }
        if (value is Error) {
          AppSnackBar.showErrorSnackBar(context,
              message: value.error.toString());
        }
      },
      provider: createTrnxProvider,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: AppColors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text('Send Money',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.TEXT_SIZE_18,
                  fontWeight: FontWeight.bold)),
          backgroundColor: AppColors.red,
        ),
        bottomNavigationBar: Consumer(
          builder: (BuildContext context, watch, child) {
            final vm = watch(createTrnxProvider);

            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width,
                  onPressed: vm is Loading
                      ? null
                      : () {
                          Navigator.of(context).push(MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (BuildContext context) {
                                return Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Positioned(
                                      top: 40.0,
                                      left: 15.0,
                                      right: 15.0,
                                      bottom: 0.0,
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        alignment: Alignment.topCenter,
                                        padding: EdgeInsets.all(15.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white30,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 50.0,
                                      left: 0.0,
                                      right: 0.0,
                                      bottom: 0.0,
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        alignment: Alignment.topCenter,
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Material(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: SingleChildScrollView(
                                            physics:
                                                AlwaysScrollableScrollPhysics(),
                                            child: Container(
                                              // padding: EdgeInsets.all(20),
                                              height: context.screenHeight(1),
                                              child: Form(
                                                key: formKey,
                                                child: Column(
                                                  // controller: ,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .keyboard_arrow_down,
                                                          color: Colors.grey,
                                                          size: 40.0,
                                                        )),
                                                    Text(
                                                      'Purpose of Payment',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: context
                                                          .textTheme.headline3!
                                                          .copyWith(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 14),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: TextFormField(
                                                        controller: purpose,
                                                        validator: (val) {
                                                          if (val == null ||
                                                              val.isEmpty)
                                                            return 'Select Purpose';
                                                          return null;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Purpose of transaction',
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      20.0,
                                                                      15.0,
                                                                      20.0,
                                                                      15.0),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          suffixIcon:
                                                              PopupMenuButton<
                                                                  String>(
                                                            icon: const Icon(Icons
                                                                .arrow_drop_down),
                                                            onSelected:
                                                                (String value) {
                                                              purpose.text =
                                                                  value;
                                                            },
                                                            itemBuilder:
                                                                (BuildContext
                                                                    context) {
                                                              return purposes.map<
                                                                  PopupMenuItem<
                                                                      String>>((String
                                                                  value) {
                                                                return new PopupMenuItem(
                                                                    child: new Text(
                                                                        value),
                                                                    value:
                                                                        value);
                                                              }).toList();
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      'Description of Transaction',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: context
                                                          .textTheme.headline3!
                                                          .copyWith(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 14),
                                                    ),
                                                    SizedBox(
                                                      height: 2,
                                                    ),
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: TextFormField(
                                                        controller: description,
                                                        maxLines: 4,
                                                        validator: (val) {
                                                          if (val == null ||
                                                              val.isEmpty)
                                                            return 'Enter a description';
                                                          return null;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Description of Transaction',
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      20.0,
                                                                      15.0,
                                                                      20.0,
                                                                      15.0),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      'Referral Discount Code',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: context
                                                          .textTheme.headline3!
                                                          .copyWith(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 14),
                                                    ),
                                                    SizedBox(
                                                      height: 2,
                                                    ),
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: TextFormField(
                                                        controller: bonus,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Discount Code',
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      20.0,
                                                                      15.0,
                                                                      20.0,
                                                                      15.0),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    CustomButton(
                                                        color: Colors.black,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        onPressed: () {
                                                          final form = formKey
                                                              .currentState;

                                                          if (form!
                                                              .validate()) {
                                                            form.save();

                                                            watch(getRatesParam(RateParam(
                                                                    sendCurrency:
                                                                        sendingCountry
                                                                            .value,
                                                                    receiveCurrency:
                                                                        receivingCountry
                                                                            .value,
                                                                    amountToSend:
                                                                        num.tryParse(amount) ??
                                                                            0)))
                                                                .whenData(
                                                                    (value) {
                                                              final transaction = CreateTransactionModel(
                                                                  amountToSend:
                                                                      num.tryParse(amount) ??
                                                                          0,
                                                                  exchangeRate:
                                                                      value
                                                                          .rate,
                                                                  paymentPurpose:
                                                                      purpose
                                                                          .text,
                                                                  paymentDescription:
                                                                      description
                                                                          .text,
                                                                  sendingCountry:
                                                                      sendingCountry
                                                                          .value,
                                                                  receivingCountry:
                                                                      receivingCountry
                                                                          .value,
                                                                  amountToReceive:
                                                                      value
                                                                          .amountToReceive,
                                                                  bonusCode:
                                                                      bonus
                                                                          .text);
                                                              context
                                                                  .read(createTrnxProvider
                                                                      .notifier)
                                                                  .createTransaction(
                                                                      transaction);
                                                              context.popView();
                                                            });
                                                          } else {
                                                            print(
                                                                "form is invalid");
                                                          }
                                                          // showBeneficiaryModal(
                                                          //     context, purposes, purpose);
                                                        },
                                                        title: Text(
                                                          'PROCEED',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: Sizes
                                                                  .TEXT_SIZE_16),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }));
                          // showBarModalBottomSheet(
                          //   expand: false,
                          //   context: context,
                          //   backgroundColor: Colors.transparent,
                          //   builder: (context) =>

                          // );
                        },
                  title: Text(
                    vm is Loading ? 'PLEASE WAIT...' : 'PROCEED',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: Sizes.TEXT_SIZE_16),
                  )),
            );
          },
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  useProvider(sendingCurrency).when(
                      data: (data) {
                        final currencies = data.data;
                        return Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.network(
                                  defaultSendingCountryFlag.value,
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      sendingCountry.value == ''
                                          ? currencies![0].currency
                                          : sendingCountry.value,
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54),
                                    ),
                                    PopupMenuButton<Datum>(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 2, vertical: 8),
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        size: 40,
                                        color: AppColors.primaryColor,
                                      ),
                                      onSelected: (Datum value) {
                                        sendingCountry.value = value.alpha3Code;
                                        defaultSendingCountryFlag.value =
                                            value.flag;
                                      },
                                      itemBuilder: (BuildContext context) {
                                        return currencies!
                                            .map<PopupMenuItem<Datum>>(
                                                (Datum value) {
                                          return PopupMenuItem(
                                              height: 50,
                                              child: Row(
                                                children: [
                                                  SvgPicture.network(
                                                    value.flag,
                                                    width: 10,
                                                    height: 20,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(value.currency),
                                                ],
                                              ),
                                              value: value);
                                        }).toList();
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'Enter Amount',
                                      textAlign: TextAlign.center,
                                      style: context.textTheme.headline3!
                                          .copyWith(
                                              color: Colors.grey, fontSize: 14),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: sendAmountController,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign
                                        .end, //Setting this attribute to true does the trick
                                    style: new TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54),
                                    decoration: InputDecoration(
                                      hintText: '0.00',
                                      hintStyle: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black38),
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 10.0, 20.0, 10.0),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                    ),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    onChanged: (String value) {
                                      // Debounce.milliseconds(1000, () {
                                      //   context
                                      //       .read(getRatesProvider.notifier)
                                      //       .getRate(rateParam.value);
                                      // });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      loading: () => CircularProgressIndicator(),
                      error: (error, stackTrace) {
                        return Text('Error loading currencies');
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  // Consumer(
                  //   builder: (BuildContext context, watch, Widget? child) {
                  //     final rateVm = watch(getRatesProvider);
                  //     return rateVm.when(
                  //         idle: () => Center(
                  //             child: Text('Select currencies to see rates')),
                  //         loading: () => RateLoading(),
                  //         success: (success) => RateSuccess(),
                  //         error: (error, _) =>
                  //             Center(child: Text(error.toString())));
                  //   },
                  // ),
                  useProvider(getRatesParam(RateParam(
                          sendCurrency: sendingCountry.value,
                          receiveCurrency: receivingCountry.value,
                          amountToSend: num.parse(amount))))
                      .when(
                          data: (data) => RateSuccess(rate: data),
                          loading: () => RateLoading(),
                          error: (error, _) =>
                              Center(child: Text(error.toString())))
                ],
              ),
              SizedBox(height: 20),
              Divider(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: useProvider(receivingCurrency).when(
                    data: (data) {
                      final currencies = data.data;
                      return Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.network(
                                defaultReceivingCountryFlag.value,
                                width: 20,
                                height: 20,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    receivingCountry.value == ''
                                        ? currencies![0].currency
                                        : receivingCountry.value,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54),
                                  ),
                                  PopupMenuButton<Datum>(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2, vertical: 8),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      size: 40,
                                      color: AppColors.primaryColor,
                                    ),
                                    onSelected: (Datum value) {
                                      receivingCountry.value = value.alpha3Code;
                                      defaultReceivingCountryFlag.value =
                                          value.flag;
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return currencies!
                                          .map<PopupMenuItem<Datum>>(
                                              (Datum value) {
                                        return PopupMenuItem(
                                            height: 50,
                                            child: Row(
                                              children: [
                                                SvgPicture.network(
                                                  value.flag,
                                                  width: 10,
                                                  height: 20,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(value.currency),
                                              ],
                                            ),
                                            value: value);
                                      }).toList();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Amount To Receive',
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.headline3!.copyWith(
                                      color: Colors.grey, fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              useProvider(getRatesParam(RateParam(
                                      sendCurrency: sendingCountry.value,
                                      receiveCurrency: receivingCountry.value,
                                      amountToSend: num.tryParse(amount) ?? 0)))
                                  .when(
                                      data: (data) => Text(
                                          '${(data.rate * num.parse(amount)).round()}',
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54)),
                                      loading: () => Text('0',
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54)),
                                      error: (error, _) => Center(
                                          child:
                                              Text('0', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black54)))),
                            ],
                          )
                        ],
                      );
                    },
                    loading: () => CircularProgressIndicator(),
                    error: (error, stackTrace) {
                      return Text('Error loading currencies');
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

String _useDebouncedSearch(TextEditingController textEditingController) {
  final search = useState(textEditingController.text);
  useEffect(() {
    Timer? timer;
    void listener() {
      timer?.cancel();
      timer = Timer(
        const Duration(milliseconds: 200),
        () => search.value = textEditingController.text,
      );
    }

    textEditingController.addListener(listener);
    return () {
      timer?.cancel();
      textEditingController.removeListener(listener);
    };
  }, [textEditingController]);

  return search.value;
}

class RateSuccess extends StatelessWidget {
  final RateData rate;
  const RateSuccess({Key? key, required this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: context.screenWidth(0.5),
          height: context.screenHeight(0.03),
          decoration: BoxDecoration(
              color: Colors.red.shade50,
              border:
                  Border.all(color: AppColors.primaryColor.withOpacity(0.5)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400]!,
                  offset: Offset(1.0, 0.0), //(x,y)
                  blurRadius: 1.0,
                ),
              ],
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Feather.trending_up,
                color: AppColors.primaryColor.withOpacity(0.9),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                rate.rate.toString(),
                textAlign: TextAlign.center,
                style: context.textTheme.headline3!.copyWith(
                    color: AppColors.accentColor.withOpacity(0.9),
                    fontSize: 14),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class RateLoading extends StatelessWidget {
  const RateLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: context.screenWidth(0.5),
          height: context.screenHeight(0.03),
          decoration: BoxDecoration(
              color: Colors.red.shade50,
              border:
                  Border.all(color: AppColors.primaryColor.withOpacity(0.5)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400]!,
                  offset: Offset(1.0, 0.0), //(x,y)
                  blurRadius: 1.0,
                ),
              ],
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Feather.trending_up,
                color: AppColors.primaryColor.withOpacity(0.9),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'fetching rates...',
                textAlign: TextAlign.center,
                style: context.textTheme.headline3!.copyWith(
                    color: AppColors.accentColor.withOpacity(0.9),
                    fontSize: 14),
              )
            ],
          ),
        ),
      ],
    );
  }
}
