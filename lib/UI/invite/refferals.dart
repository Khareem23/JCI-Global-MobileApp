import 'dart:async';
import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:jci_remit_mobile/UI/dashboard/viewmodels/user_dash_vm.dart';
import 'package:jci_remit_mobile/helper/static_config.dart';
import 'package:jci_remit_mobile/services/storage/shared_prefs.dart';
import 'package:jci_remit_mobile/utils/globals.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/utils/utils.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:http/http.dart' as http;
import 'package:jci_remit_mobile/widgets/item_icon.dart';
import 'package:intl/intl.dart';

class Refferals extends StatefulWidget {
  const Refferals({Key? key}) : super(key: key);

  @override
  _RefferalsState createState() => _RefferalsState();
}

class _RefferalsState extends State<Refferals> {
  var refferalData;

  @override
  void initState() {
    super.initState();
    getReferrals();
    getReferralList();
  }

  getReferrals() async {
    final util = Util();
    final baseUrl = Globals.apiBaseUrl;
    final bearerToken = StorageUtil.getString(StaticConfig.token);
    final userMap = util.parseJwtPayLoad(bearerToken);
    final userId = userMap['nameid'];
    print(userId);
    final url =
        baseUrl + "ReferralPayment/getSumCustomerReferralTransaction/$userId";
    try {
      var res = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer $bearerToken",
        "content-type": "application/json",
      });

      print(res.statusCode);
      var body = json.decode(res.body);
      if (res.statusCode == 200) {
        print(body);
        setState(() {
          refferalData = body['data'];
        });
      } else {
        print(body['message']);
      }
    } on TimeoutException catch (e) {
      print('Timeout: $e');
    } on Error catch (e) {
      print('Error: $e');
    }
  }

  var refferalList = [];

  getReferralList() async {
    final util = Util();
    final baseUrl = Globals.apiBaseUrl;
    final bearerToken = StorageUtil.getString(StaticConfig.token);
    final userMap = util.parseJwtPayLoad(bearerToken);
    final userId = userMap['nameid'];
    print(userId);
    final url =
        baseUrl + "ReferralPayment/getAllCustomerReferralTransaction/$userId";
    try {
      var res = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer $bearerToken",
        "content-type": "application/json",
      });

      print(res.statusCode);
      var body = json.decode(res.body);
      if (res.statusCode == 200) {
        print(body);
        setState(() {
          refferalList = body['data'];
        });
      } else {
        print(body['message']);
      }
    } on TimeoutException catch (e) {
      print('Timeout: $e');
    } on Error catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                color: AppColors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child:
                              Icon(Icons.arrow_back_ios, color: Colors.white),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Refferals',
                              style: context.textTheme.headline4!.copyWith(
                                  fontSize: 30, color: AppColors.white),
                            ),
                            Text(
                              'Your Earnings',
                              style: context.textTheme.headline5!.copyWith(
                                  fontSize: 12, color: AppColors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  color: AppColors.primary1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Earnings:',
                        style: context.textTheme.headline4!
                            .copyWith(fontSize: 20, color: AppColors.white),
                      ),
                      refferalData != null
                          ? Text(
                              "AUD" + refferalData.toString(),
                              style: context.textTheme.headline4!
                                  .copyWith(fontSize: 20, color: Colors.white),
                            )
                          : CircularProgressIndicator()
                    ],
                  )),
              Expanded(
                  child: Container(
                color: Colors.white,
                child: Stack(alignment: AlignmentDirectional.center, children: [
                  Image.asset('assets/images/watermark.png',
                      width: MediaQuery.of(context).size.width * 0.8),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.72,
                    margin: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // for (var i = 1; i <= 15; i++)
                          for (var i in refferalList) transactionCard(i)
                        ],
                      ),
                    ),
                  )
                ]),
              ))
            ],
          ),
        ));
  }

  transactionCard(data) {
    var formatter = NumberFormat('#,###,###.#');
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ItemIcon(
            text: "",
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${data['firstName']} ${data['lastName']}",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: context.textTheme.headline4!
                      .copyWith(fontSize: 16, color: AppColors.blackShade1),
                ),
                Row(
                  children: [
                    if (data['date'] != null)
                      Text(
                        data['date'],
                        textAlign: TextAlign.start,
                        style: context.textTheme.headline3!.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Feather.loader,
                      color: Colors.green,
                      size: 12,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      data['status'],
                      textAlign: TextAlign.start,
                      style: context.textTheme.headline3!
                          .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '',
                  style: context.textTheme.headline3!.copyWith(fontSize: 12),
                  children: [
                    TextSpan(
                      text: "AUD",
                      style:
                          context.textTheme.headline3!.copyWith(fontSize: 12),
                    ),
                    TextSpan(
                      text: formatter.format(data['amount']).toString(),
                      style: context.textTheme.headline4!
                          .copyWith(fontSize: 18, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
