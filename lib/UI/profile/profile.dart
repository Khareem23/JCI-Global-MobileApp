import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/common/empty_state_widget.dart';
import 'package:jci_remit_mobile/utils/extensions.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ProfileScreen extends HookWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userHasBankAccount = useState(false);
    return Scaffold(
      backgroundColor: AppColors.primaryColor.withOpacity(0.1),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Profile',
                    style: context.textTheme.headline4.copyWith(fontSize: 30),
                  ),
                  Text(
                    'See all your details in one place',
                    style: context.textTheme.headline5.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ajiboye Temitope',
                                  style: context.textTheme.headline4
                                      .copyWith(fontSize: 16),
                                ),
                                Text(
                                  'Verified',
                                  style: context.textTheme.headline5.copyWith(
                                      fontSize: 16,
                                      color: AppColors.primaryColor),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ListTile(
                            leading: Icon(AntDesign.user),
                            title: Text(
                              'Personal Data',
                              style: context.textTheme.headline5
                                  .copyWith(fontSize: 16),
                            ),
                            trailing: Icon(
                              AntDesign.right,
                            )),
                        Divider(),
                        ListTile(
                            onTap: () => showModal(context, userHasBankAccount),
                            leading: Icon(AntDesign.bank),
                            title: Text(
                              'Bank Account',
                              style: context.textTheme.headline5
                                  .copyWith(fontSize: 16),
                            ),
                            trailing: Icon(
                              AntDesign.right,
                            )),
                        Spacer(),
                        ListTile(
                            leading: Icon(AntDesign.poweroff,
                                color: AppColors.primaryColor),
                            title: Text(
                              'Logout',
                              style: context.textTheme.headline5
                                  .copyWith(fontSize: 16),
                            ),
                            trailing: Icon(
                              AntDesign.right,
                            )),
                      ],
                    )))
          ],
        ),
      ),
    );
  }

  void showModal(BuildContext context, ValueNotifier userHasBankAccount) {
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
            userHasBankAccount.value
                ? Expanded(
                    child: SizedBox(
                      height: context.screenHeight(1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter Bank Details',
                            textAlign: TextAlign.center,
                            style: context.textTheme.headline3
                                .copyWith(color: Colors.grey, fontSize: 14),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            // controller: purpose,
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
                            // controller: purpose,
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
                            // controller: purpose,
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
                            // controller: purpose,
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
                            // controller: purpose,
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
                          Spacer(),
                          CustomButton(
                              color: Colors.black,
                              width: MediaQuery.of(context).size.width,
                              onPressed: () {
                                // context.popView();
                                // showBeneficiaryModal(context, purposes, purpose);
                              },
                              title: Text(
                                'UPDATE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Sizes.TEXT_SIZE_16),
                              )),
                        ],
                      ),
                    ),
                  )
                : EmptyStateWidget(
                    error: "Seems like you've not added a bank account yet",
                    textOnButton: '+ Add Bank Account',
                    errorTitle: 'One minute!',

                    // TODO: Navigate to a create transaction screen
                    refreshCallBack: () => {userHasBankAccount.value = true},
                  )
          ],
        ),
      ),
    );
  }
}
