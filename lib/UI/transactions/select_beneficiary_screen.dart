import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/transactions/add_beneficiary_screen.dart';
import 'package:jci_remit_mobile/UI/transactions/transaction_success.dart';
import 'package:jci_remit_mobile/UI/transactions/vm/transaction_vm.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/common/empty_state_widget.dart';
import 'package:jci_remit_mobile/common/network_error_widget.dart';
import 'package:jci_remit_mobile/common/snackbar.dart';
import 'package:jci_remit_mobile/controllers/request_state_notifier.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/beneficiary_model.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/transaction_res.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:jci_remit_mobile/utils/extensions.dart';
import 'package:jci_remit_mobile/utils/navigator.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SelectBeneficiaryScreen extends HookWidget {
  final TransactionData transactionData;
  const SelectBeneficiaryScreen({Key? key, required this.transactionData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedBeneficiary = useState(0);
    final _selectedIndex = useState(-1);
    return ProviderListener(
        onChange: (BuildContext context, value) {
          if (value is Success) {
            context.navigate(TransactionSuccessScreen(
              transaction: transactionData,
            ));
          }
          if (value is Error) {
            AppSnackBar.showErrorSnackBar(context,
                message: value.error.toString());
          }
        },
        provider: addExistingBeneficiaryProvider,
        child: Scaffold(
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
              title: Text('Select Beneficiary',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.TEXT_SIZE_18,
                      fontWeight: FontWeight.bold)),
              backgroundColor: AppColors.red,
            ),
            bottomSheet: Consumer(
              builder: (BuildContext context,
                  T Function<T>(ProviderBase<Object?, T>) watch,
                  Widget? child) {
                final vm = watch(addExistingBeneficiaryProvider);
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomButton(
                      color: Colors.black,
                      width: MediaQuery.of(context).size.width,
                      onPressed: _selectedIndex.value != -1
                          ? vm is Loading
                              ? null
                              : () {
                                  context
                                      .read(addExistingBeneficiaryProvider
                                          .notifier)
                                      .addExistingBeneficiary(
                                          selectedBeneficiary.value,
                                          transactionData.id!);
                                  // showModal(
                                  //     context,
                                  //     purposes,
                                  //     purpose);
                                }
                          : null,
                      title: Text(
                        vm is Loading ? 'LOADING...' : 'PROCEED',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.TEXT_SIZE_16),
                      )),
                );
              },
            ),
            body: Stack(alignment: AlignmentDirectional.center, children: [
              Image.asset('assets/images/watermark.png',
                  width: MediaQuery.of(context).size.width * 0.8),
              RefreshIndicator(
                onRefresh: () => context.refresh(getBeneficiariesProvider),
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          onTap: () async {
                            final text = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddBeneficiaryScreen(
                                      transactionData: transactionData)),
                            );
                            print(text);
                            if (text == 'BeneficiaryCreated') {
                              ScaffoldMessenger.of(context)
                                ..removeCurrentSnackBar()
                                ..showSnackBar(SnackBar(
                                    content: Text('Beneficiary Created')));
                              context.navigate(TransactionSuccessScreen(
                                transaction: transactionData,
                              ));
                            } else {
                              AppSnackBar.showErrorSnackBar(context,
                                  message:
                                      'Beneficiary Creation Failed. Please try again.');
                            }
                          },
                          contentPadding: EdgeInsets.zero,
                          selected: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          leading: CircleAvatar(
                              child: Icon(
                                Feather.user_plus,
                                color: Colors.white,
                              ),
                              backgroundColor: Colors.teal),
                          title: Text(
                            'Add New Beneficiary',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: Colors.teal),
                          ),
                          trailing:
                              Icon(Icons.chevron_right, color: Colors.teal),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Select a Beneficiary',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        useProvider(getBeneficiariesProvider).when(
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color:
                                                  _selectedIndex.value == index
                                                      ? AppColors.primaryColor
                                                      : Colors.grey)),
                                      child: ListTile(
                                          onTap: () {
                                            selectedBeneficiary.value =
                                                beneficiary[index].customerId;
                                            _selectedIndex.value = index;
                                            print(_selectedIndex.value);
                                          },
                                          contentPadding: EdgeInsets.zero,
                                          leading: CircleAvatar(
                                              child: Text(
                                                  '${beneficiary[index].accountName![0]}'),
                                              backgroundColor:
                                                  Color(0xFFefecfd)),
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
                                ))
                      ],
                    )),
              ),
            ])));
  }
}
