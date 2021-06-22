import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_downloader/flutter_android_downloader.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/transaction_res.dart';
import 'package:jci_remit_mobile/utils/extensions.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:jci_remit_mobile/utils/theme.dart';

class ManualPaymentReportScreen extends HookWidget {
  final TransactionData transactionData;
  const ManualPaymentReportScreen({Key? key, required this.transactionData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Future.microtask(() => FlutterAndroidDownloader.listen((data) {
            print("success $data");
            // to do something
          }));
    }, []);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Complete Manual Payment',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transaction Reference Number',
              textAlign: TextAlign.center,
              style: context.textTheme.headline3!.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.accentColor,
                  fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              transactionData.id.toString(),
              textAlign: TextAlign.center,
              style: context.textTheme.headline3!.copyWith(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Payment Method',
              textAlign: TextAlign.center,
              style: context.textTheme.headline3!.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.accentColor,
                  fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Domestic Wire Transfer',
              textAlign: TextAlign.center,
              style: context.textTheme.headline3!.copyWith(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'IJC Global Account: Beneficiary Details',
              textAlign: TextAlign.center,
              style: context.textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.accentColor,
                  fontSize: 16),
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Account Holder's Name",
                      textAlign: TextAlign.center,
                      style: context.textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColors.colorShade1,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Account holder's name",
                      textAlign: TextAlign.center,
                      style: context.textTheme.headline3!
                          .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  width: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location",
                      textAlign: TextAlign.center,
                      style: context.textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColors.colorShade1,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Germany",
                      textAlign: TextAlign.center,
                      style: context.textTheme.headline3!
                          .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Account Number",
                      textAlign: TextAlign.center,
                      style: context.textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColors.colorShade1,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "0125434328",
                      textAlign: TextAlign.center,
                      style: context.textTheme.headline3!
                          .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Payment Date",
                      textAlign: TextAlign.center,
                      style: context.textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColors.colorShade1,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      formatDate(DateTime.now(), [dd, ' ', M, ' ', yyyy]),
                      textAlign: TextAlign.center,
                      style: context.textTheme.headline3!
                          .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Download Payment Info'),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Feather.download)
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: context.screenHeight(0.07),
                width: context.screenWidth(1),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all()),
                child: Row(
                  children: [
                    Icon(Feather.file),
                    Spacer(),
                    Text('Upload Payment Confirmation'),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Feather.upload)
                  ],
                ),
              ),
            ),
            Spacer(),
            CustomButton(
                color: Colors.black,
                onPressed: () {
                  // if (!_formKey.value.currentState!.validate()) {
                  //   return null;
                  // }
                  // _formKey.value.currentState!.save();
                  // context.navigate(ManualPaymentReportScreen(
                  //     transactionData: transactionData));
                },
                width: context.screenWidth(1),
                title: Text(
                  'COMPLETE',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: Sizes.TEXT_SIZE_16),
                )),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  void download() async {
    int id = await FlutterAndroidDownloader.download(
        "https://qd.myapp.com/myapp/qqteam/AndroidQQ/mobileqq_android.apk",
        "/storage/emulated/0/Download",
        "qq.apk",
        "QQ", {});
    print("ID => $id");
  }
}
