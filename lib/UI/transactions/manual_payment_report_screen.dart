import 'dart:io';

import 'package:date_format/date_format.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:jci_remit_mobile/UI/transactions/payment_success.dart';
import 'package:jci_remit_mobile/UI/transactions/vm/transaction_vm.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/common/snackbar.dart';
import 'package:jci_remit_mobile/controllers/request_state_notifier.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/bank_account_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/transaction_res.dart';
import 'package:jci_remit_mobile/services/api/transaction/transaction_service.dart';
import 'package:jci_remit_mobile/utils/extensions.dart';
import 'package:jci_remit_mobile/utils/navigator.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:jci_remit_mobile/utils/theme.dart';

class ManualPaymentReportScreen extends HookWidget {
  final BankAccountData accountData;
  final TransactionData transactionData;

  const ManualPaymentReportScreen(
      {Key? key, required this.accountData, required this.transactionData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedFile = useState('');
    print(accountData);
    print(transactionData);
    // useEffect(() {
    //   Future.microtask(() => FlutterAndroidDownloader.listen((data) {
    //         print("success $data");
    //         // to do something
    //       }));
    // }, []);
    return ProviderListener(
      onChange: (BuildContext context, value) {
        if (value is Error) {
          AppSnackBar.showErrorSnackBar(context,
              message:
                  "Sorry, we couldn't complete your transaction at the moment. Please try again.");
        }
        if (value is Success) {
          AppSnackBar.showSuccessSnackBar(context,
              message: "Your payment is complete!");
          context.navigate(PaymentSuccess());
        }
      },
      provider: addPaymentProvider,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
          title: Text('Complete Manual Payment',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.TEXT_SIZE_18,
                  fontWeight: FontWeight.bold)),
          backgroundColor: AppColors.red,
        ),
        body: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(alignment: AlignmentDirectional.center, children: [
                  Image.asset('assets/images/watermark.png',
                      width: MediaQuery.of(context).size.width * 0.8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Transaction Details:',
                        textAlign: TextAlign.center,
                        style: context.textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.accentColor,
                            fontSize: 16),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Divider(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Transaction ID",
                                  textAlign: TextAlign.start,
                                  style: context.textTheme.headline3!.copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.primaryColor,
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  transactionData.id.toString(),
                                  textAlign: TextAlign.start,
                                  style: context.textTheme.headline3!.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "FullName",
                                textAlign: TextAlign.center,
                                style: context.textTheme.headline3!.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.primaryColor,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                transactionData.fullName.toString(),
                                textAlign: TextAlign.center,
                                style: context.textTheme.headline3!.copyWith(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Email ",
                                  textAlign: TextAlign.start,
                                  style: context.textTheme.headline3!.copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.primaryColor,
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  transactionData.senderEmail.toString(),
                                  textAlign: TextAlign.start,
                                  style: context.textTheme.headline3!.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Reference Number",
                                textAlign: TextAlign.center,
                                style: context.textTheme.headline3!.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.primaryColor,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                transactionData.transactionRefNumber.toString(),
                                textAlign: TextAlign.center,
                                style: context.textTheme.headline3!.copyWith(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sending Country ",
                                  textAlign: TextAlign.start,
                                  style: context.textTheme.headline3!.copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.primaryColor,
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  transactionData.sendingCountry.toString(),
                                  textAlign: TextAlign.start,
                                  style: context.textTheme.headline3!.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Receiving Country",
                                textAlign: TextAlign.center,
                                style: context.textTheme.headline3!.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.primaryColor,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                transactionData.receivingCountry.toString(),
                                textAlign: TextAlign.center,
                                style: context.textTheme.headline3!.copyWith(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Amount To Send ",
                                  textAlign: TextAlign.start,
                                  style: context.textTheme.headline3!.copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.primaryColor,
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  transactionData.amountToSend.toString(),
                                  textAlign: TextAlign.start,
                                  style: context.textTheme.headline3!.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Amount To Receive",
                                textAlign: TextAlign.center,
                                style: context.textTheme.headline3!.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.primaryColor,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                transactionData.amountToReceive.toString(),
                                textAlign: TextAlign.center,
                                style: context.textTheme.headline3!.copyWith(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Text(
                        "Payment Purpose ",
                        textAlign: TextAlign.start,
                        style: context.textTheme.headline3!.copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppColors.primaryColor,
                            fontSize: 14),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        transactionData.paymentPurpose.toString(),
                        textAlign: TextAlign.start,
                        style: context.textTheme.headline3!.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Date ",
                                  textAlign: TextAlign.start,
                                  style: context.textTheme.headline3!.copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.primaryColor,
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  transactionData.dateSent.toString(),
                                  textAlign: TextAlign.start,
                                  style: context.textTheme.headline3!.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Transaction Status",
                                textAlign: TextAlign.center,
                                style: context.textTheme.headline3!.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.primaryColor,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                transactionData.transactionStatus.toString(),
                                textAlign: TextAlign.center,
                                style: context.textTheme.headline3!.copyWith(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),

                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Text(
                      //   'Payment Method',
                      //   textAlign: TextAlign.center,
                      //   style: context.textTheme.headline3!.copyWith(
                      //       fontWeight: FontWeight.w800,
                      //       color: AppColors.accentColor,
                      //       fontSize: 16),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Text(
                      //   'Domestic Wire Transfer',
                      //   textAlign: TextAlign.center,
                      //   style: context.textTheme.headline3!.copyWith(
                      //       color: AppColors.blackShade1,
                      //       fontWeight: FontWeight.w600,
                      //       fontSize: 18),
                      // ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Beneficiary Details:',
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Account Holder's Name",
                                  textAlign: TextAlign.start,
                                  style: context.textTheme.headline3!.copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.primaryColor,
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  accountData.accountName.toString(),
                                  textAlign: TextAlign.start,
                                  style: context.textTheme.headline3!.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Country",
                                textAlign: TextAlign.center,
                                style: context.textTheme.headline3!.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.primaryColor,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                accountData.country.toString(),
                                textAlign: TextAlign.center,
                                style: context.textTheme.headline3!.copyWith(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
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
                                    color: AppColors.primaryColor,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                accountData.bankAccountNumber.toString(),
                                textAlign: TextAlign.center,
                                style: context.textTheme.headline3!.copyWith(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Payment Date",
                                textAlign: TextAlign.center,
                                style: context.textTheme.headline3!.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.primaryColor,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                formatDate(
                                    DateTime.now(), [dd, ' ', M, ' ', yyyy]),
                                textAlign: TextAlign.center,
                                style: context.textTheme.headline3!.copyWith(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              TransactionService()
                                  .downloadFile(transactionData.id!, context);
                            },
                            // context.read(downloadProvider(transactionData.id!)),
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
                          // Consumer(
                          //   builder: (BuildContext context,
                          //       T Function<T>(ProviderBase<Object?, T>) watch,
                          //       Widget? child) {
                          //     AsyncValue<String> message =
                          //         watch(downloadProvider(transactionData.id!));
                          //     return message.when(
                          //       loading: () => SizedBox(
                          //           width: 10,
                          //           height: 10,
                          //           child: const CircularProgressIndicator(
                          //             strokeWidth: 2,
                          //           )),
                          //       error: (err, stack) => Text('Error: $err'),
                          //       data: (message) {
                          //         return Text(message);
                          //       },
                          //     );
                          //   },
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Consumer(
                        builder: (BuildContext context,
                            T Function<T>(ProviderBase<Object?, T>) watch,
                            Widget? child) {
                          final vm = watch(uploadProvider);
                          return InkWell(
                            onTap: () => pickFile(
                                context, selectedFile, transactionData.id!),
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
                                  status(vm)
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      Text(
                        selectedFile.value,
                        overflow: TextOverflow.fade,
                      ),
                      Spacer(),
                      Consumer(
                        builder: (BuildContext context,
                            T Function<T>(ProviderBase<Object?, T>) watch,
                            Widget? child) {
                          final vm = watch(addPaymentProvider);
                          return CustomButton(
                              color: AppColors.primaryColor,
                              onPressed: vm is Loading
                                  ? null
                                  : () {
                                      if (selectedFile.value != "") {
                                        context
                                            .read(addPaymentProvider.notifier)
                                            .addPayment(transactionData.id!, 3);
                                      } else {
                                        AppSnackBar.showErrorSnackBar(context,
                                            message:
                                                "Please upload proof of payment!");
                                      }
                                    },
                              width: context.screenWidth(1),
                              title: Text(
                                vm is Loading ? 'LOADING' : 'COMPLETE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Sizes.TEXT_SIZE_16),
                              ));
                        },
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ])),
          ),
        ),
      ),
    );
  }

  Widget status(RequestState<dynamic> vm) {
    if (vm is Idle) {
      return Icon(Feather.upload);
    }
    if (vm is Loading) {
      return CircularProgressIndicator();
    }
    if (vm is Success) {
      return Icon(
        Feather.check,
        color: Colors.green,
      );
    }
    return Icon(Feather.upload);
  }

  Future<void> pickFile(BuildContext context,
      ValueNotifier<String> selectedFile, num transactionId) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      selectedFile.value = (file.path.split('/').last);
      context.read(uploadProvider.notifier).upload(transactionId, file.path);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Please select a file to upload.'),
        ),
      );
      // User canceled the picker
    }
  }

// void download() async {
//   int id = await FlutterAndroidDownloader.download(
//       "https://qd.myapp.com/myapp/qqteam/AndroidQQ/mobileqq_android.apk",
//       "/storage/emulated/0/Download",
//       "qq.apk",
//       "QQ", {});
//   print("ID => $id");
// }
}
