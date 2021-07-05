import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/transactions/add_beneficiary_screen.dart';
import 'package:jci_remit_mobile/UI/transactions/transaction_success.dart';
import 'package:jci_remit_mobile/UI/transactions/vm/transaction_vm.dart';
import 'package:jci_remit_mobile/common/empty_state_widget.dart';
import 'package:jci_remit_mobile/common/network_error_widget.dart';
import 'package:jci_remit_mobile/common/snackbar.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/beneficiary_model.dart';
import 'package:jci_remit_mobile/utils/navigator.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/values/values.dart';

class ReceiversScreen extends HookWidget {
  const ReceiversScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor.withOpacity(0.1),
      body: RefreshIndicator(
        onRefresh: () => context.refresh(getBeneficiariesProvider),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'All Beneficiaries',
                          style: context.textTheme.headline4!
                              .copyWith(fontSize: 30),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () async {
                            final text = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddBeneficiaryScreen(
                                      transactionData: null)),
                            );
                            print(text);
                            if (text == 'BeneficiaryCreated') {
                              context.refresh(getBeneficiariesProvider);
                            } else {
                              AppSnackBar.showErrorSnackBar(context,
                                  message:
                                      'Beneficiary Creation Failed. Please try again.');
                            }
                          },
                          child: Icon(
                            AntDesign.adduser,
                            color: AppColors.primaryColor,
                          ),
                        )
                      ],
                    ),
                    Text(
                      'See all your beneficiaries in one place',
                      style:
                          context.textTheme.headline5!.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: useProvider(getBeneficiariesProvider).when(
                          data: (List<BeneficiaryData> beneficiary) {
                            return ListView.separated(
                              shrinkWrap: true,
                              itemCount: beneficiary.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (beneficiary.length > 0)
                                  return Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.grey)),
                                    child: ListTile(
                                        onTap: () {
                                          // selectedBeneficiary.value =
                                          //     beneficiary[index].customerId;
                                          // _selectedIndex.value = index;
                                          // print(_selectedIndex.value);
                                        },
                                        contentPadding: EdgeInsets.zero,
                                        leading: CircleAvatar(
                                            child: Text(
                                                '${beneficiary[index].accountName![0]}'),
                                            backgroundColor: Color(0xFFefecfd)),
                                        title: Text(
                                          beneficiary[index].accountName!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 14,
                                              color: Colors.black87),
                                        ),
                                        subtitle: Text(
                                            '${beneficiary[index].bankName} - ${beneficiary[index].accountNumber}')),
                                  );
                                else
                                  return EmptyStateWidget(
                                    refreshCallBack: () => {},
                                    textOnButton: 'Create',
                                    errorTitle: 'Oops!',
                                    error:
                                        'You do not have a saved beneficiary. Do you want to create one?',
                                  );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 10,
                                );
                              },
                            );
                          },
                          error: (Object error, StackTrace? stackTrace) {
                            return NetworkErrorWidget(
                              refreshCallBack: () =>
                                  context.read(getBeneficiariesProvider),
                              error:
                                  'Error fetching beneficiaries. Please try again',
                            );
                          },
                          loading: () => Center(
                                child: CircularProgressIndicator(),
                              ))))
            ],
          ),
        ),
      ),
    );
  }
}
