import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/currency_model.dart';
import 'package:jci_remit_mobile/utils/extensions.dart';
import 'package:jci_remit_mobile/utils/navigator.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:just_debounce_it/just_debounce_it.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/rate_model.dart';

import 'vm/transaction_vm.dart';

class CreateTransactionScreen extends HookWidget {
  void showModal(BuildContext context, List<String> purposes,
      TextEditingController purpose) {
    showBarModalBottomSheet(
      expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.all(20),
        height: context.screenHeight(0.6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Purpose of Payment',
              textAlign: TextAlign.center,
              style: context.textTheme.headline3!
                  .copyWith(color: Colors.grey, fontSize: 14),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: purpose,
                decoration: InputDecoration(
                  hintText: 'Purpose of transaction',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  suffixIcon: PopupMenuButton<String>(
                    icon: const Icon(Icons.arrow_drop_down),
                    onSelected: (String value) {
                      purpose.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return purposes
                          .map<PopupMenuItem<String>>((String value) {
                        return new PopupMenuItem(
                            child: new Text(value), value: value);
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
              textAlign: TextAlign.center,
              style: context.textTheme.headline3!
                  .copyWith(color: Colors.grey, fontSize: 14),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                //  controller: purpose,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Description of Transaction',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Discount',
              textAlign: TextAlign.center,
              style: context.textTheme.headline3!
                  .copyWith(color: Colors.grey, fontSize: 14),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                //  controller: purpose,
                decoration: InputDecoration(
                  hintText: 'Discount',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Spacer(),
            CustomButton(
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                onPressed: () {
                  context.popView();
                  showBeneficiaryModal(context, purposes, purpose);
                },
                title: Text(
                  'PROCEED',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: Sizes.TEXT_SIZE_16),
                )),
          ],
        ),
      ),
    );
  }

  void showBeneficiaryModal(BuildContext context, List<String> purposes,
      TextEditingController purpose) {
    showBarModalBottomSheet(
      expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.all(20),
        // height: context.screenHeight(0.6),
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
              // controller: purpose,
              decoration: InputDecoration(
                labelText: 'Bank Name',
                hintText: '',
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              // controller: purpose,
              decoration: InputDecoration(
                labelText: 'Account Number / IBAN',
                hintText: '',
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              // controller: purpose,
              decoration: InputDecoration(
                labelText: 'Account Name',
                hintText: '',
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              // controller: purpose,
              decoration: InputDecoration(
                labelText: 'Bank Address',
                hintText: '',
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
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
                    // controller: purpose,
                    decoration: InputDecoration(
                      labelText: 'Swift(Optional)',
                      hintText: '',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextFormField(
                    // controller: purpose,
                    decoration: InputDecoration(
                      labelText: 'BSB(Optional)',
                      hintText: '',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 40,
            ),
            Text(
              'Corresponding Bank (Optional)',
              style: context.textTheme.headline3!
                  .copyWith(color: Colors.grey, fontSize: 14),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: purpose,
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Country',
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                suffixIcon: PopupMenuButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  onSelected: (String value) {
                    purpose.text = value;
                  },
                  itemBuilder: (BuildContext context) {
                    return purposes.map<PopupMenuItem<String>>((String value) {
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
              // controller: purpose,
              decoration: InputDecoration(
                labelText: 'Bank Name',
                hintText: '',
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              // controller: purpose,
              decoration: InputDecoration(
                labelText: 'Account Number',
                hintText: '',
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              // controller: purpose,
              decoration: InputDecoration(
                labelText: 'Account Name',
                hintText: '',
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            Spacer(),
            CustomButton(
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                onPressed: () {
                  showModal(context, purposes, purpose);
                },
                title: Text(
                  'PROCEED',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: Sizes.TEXT_SIZE_16),
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var purposes = ['Expert', 'Noob', 'Intermediate'];
    final sendingCountry = useState('USD');
    final receivingCountry = useState('AUD');
    final defaultSendingCountryFlag =
        useState('https://restcountries.eu/data/aus.svg');
    final defaultReceivingCountryFlag =
        useState('https://restcountries.eu/data/aus.svg');
    final purpose = useTextEditingController();
    final rateParam = useState<RateParam>(RateParam(
        sendCurrency: 'AUS', receiveCurrency: 'NGA', amountToSend: 1));
    final sendAmountController = useTextEditingController(text: '1');
    final amount = _useDecouncedSearch(sendAmountController);

    return Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        title: Text(
          'Send Money',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            width: context.screenWidth(1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Enter Amount',
                  textAlign: TextAlign.center,
                  style: context.textTheme.headline3!
                      .copyWith(color: Colors.grey, fontSize: 14),
                ),
                useProvider(sendingCurrency).when(
                    data: (data) {
                      final currencies = data.data;
                      return Row(
                        children: [
                          SvgPicture.network(
                            defaultSendingCountryFlag.value,
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
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
                              color: AppColors.primaryColor,
                            ),
                            onSelected: (Datum value) {
                              sendingCountry.value = value.alpha3Code;
                              defaultSendingCountryFlag.value = value.flag;
                            },
                            itemBuilder: (BuildContext context) {
                              return currencies!
                                  .map<PopupMenuItem<Datum>>((Datum value) {
                                return PopupMenuItem(
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
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: sendAmountController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign
                                  .end, //Setting this attribute to true does the trick
                              style: new TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                              decoration: InputDecoration(
                                hintText: '0.00',
                                hintStyle: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black38),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
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
          ),
          Expanded(
              child: Container(
            height: context.screenHeight(1),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Amount To Receive',
                  textAlign: TextAlign.center,
                  style: context.textTheme.headline3!
                      .copyWith(color: Colors.grey, fontSize: 14),
                ),
                useProvider(sendingCurrency).when(
                    data: (data) {
                      final currencies = data.data;
                      return Row(
                        children: [
                          SvgPicture.network(
                            defaultReceivingCountryFlag.value,
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
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
                              color: AppColors.primaryColor,
                            ),
                            onSelected: (Datum value) {
                              receivingCountry.value = value.alpha3Code;
                              defaultReceivingCountryFlag.value = value.flag;
                            },
                            itemBuilder: (BuildContext context) {
                              return currencies!
                                  .map<PopupMenuItem<Datum>>((Datum value) {
                                return PopupMenuItem(
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
                          Spacer(),
                          useProvider(getRatesParam(RateParam(
                        sendCurrency: sendingCountry.value,
                        receiveCurrency: receivingCountry.value,
                        amountToSend: num.tryParse(amount) ?? 0)))
                    .when(
                        data: (data) => Text('${(data.rate * num.parse(amount)).round()}', style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54)),
                        loading: () => Text('0', style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54)),
                        error: (error, _) =>
                            Center(child: Text('0', style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54))))
                          
                            
                            
                        ],
                      );
                    },
                    loading: () => CircularProgressIndicator(),
                    error: (error, stackTrace) {
                      return Text('Error loading currencies');
                    }),
                Spacer(),
                CustomButton(
                    color: Colors.black,
                    width: MediaQuery.of(context).size.width,
                    onPressed: null,
                    //  () {
                    //   // showModal(context, purposes, purpose);
                    //   showBeneficiaryModal(context, purposes, purpose);
                    // },
                    title: Text(
                      'PROCEED',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: Sizes.TEXT_SIZE_16),
                    )),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

String _useDecouncedSearch(TextEditingController textEditingController) {
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
  const RateSuccess({
    Key? key, required this.rate
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
                rate.rate.toString(),
                textAlign: TextAlign.center,
                style: context.textTheme.headline3!.copyWith(
                    color:
                        AppColors.accentColor.withOpacity(0.9),
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
