import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/dashboard/viewmodels/user_dash_vm.dart';
import 'package:jci_remit_mobile/UI/profile/personal_data.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/common/empty_state_widget.dart';
import 'package:jci_remit_mobile/controllers/auth_controller.dart';
import 'package:jci_remit_mobile/utils/extensions.dart';
import 'package:jci_remit_mobile/utils/navigator.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'bank_account_screen.dart';

class ProfileScreen extends HookWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userHasBankAccount = useState(false);
    return Scaffold(
      backgroundColor: AppColors.primaryColor.withOpacity(0.1),
      body: RefreshIndicator(
        onRefresh: () => context.refresh(userProvider),
        child: SafeArea(
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
                    Text(
                      'My Profile',
                      style: context.textTheme.headline4!
                          .copyWith(fontSize: 30, color: AppColors.white),
                    ),
                    Text(
                      'View and edit profile',
                      style: context.textTheme.headline5!
                          .copyWith(fontSize: 12, color: AppColors.white),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: useProvider(userProvider).when(
                  data: (user) {
                    return Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Image.asset('assets/images/watermark.png',
                              width: MediaQuery.of(context).size.width * 0.8),
                          Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                      radius: 40,
                                      child: SvgPicture.asset(
                                        'assets/images/svg/male_avatar.svg',
                                      )),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${user.firstName} ${user.lastName}',
                                        style: context.textTheme.headline4!
                                            .copyWith(fontSize: 16),
                                      ),
                                      Row(
                                        children: [
                                          user.isAmlCompliancePassed!
                                              ? Icon(Icons.check_circle,
                                                  color: Colors.green)
                                              : Icon(
                                                  Icons.error,
                                                  color: Colors.red,
                                                ),
                                          Text(
                                            user.isAmlCompliancePassed!
                                                ? 'Verified'
                                                : 'Not Verified',
                                            style: context.textTheme.headline5!
                                                .copyWith(
                                                    fontSize: 16,
                                                    color:
                                                        AppColors.primaryColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ListTile(
                                  onTap: () => context.navigate(
                                      PersonalDataScreen(userDto: user)),
                                  leading: Icon(AntDesign.user),
                                  title: Text(
                                    'Personal Data',
                                    style: context.textTheme.headline5!
                                        .copyWith(fontSize: 16),
                                  ),
                                  trailing: Icon(
                                    AntDesign.right,
                                  )),
                              Divider(),
                              ListTile(
                                  onTap: () => context.navigate(
                                      BankAccountScreen(
                                          user.customerBankAccount),
                                      isDialog: true),
                                  leading: Icon(AntDesign.bank),
                                  title: Text(
                                    'Bank Account',
                                    style: context.textTheme.headline5!
                                        .copyWith(fontSize: 16),
                                  ),
                                  trailing: Icon(
                                    AntDesign.right,
                                  )),
                              Spacer(),
                              ListTile(
                                  onTap: () => context
                                      .read(authControllerProvider.notifier)
                                      .auth(AuthenticationStatus.logout),
                                  leading: Icon(AntDesign.poweroff,
                                      color: AppColors.primaryColor),
                                  title: Text(
                                    'Logout',
                                    style: context.textTheme.headline5!
                                        .copyWith(fontSize: 16),
                                  ),
                                  trailing: Icon(
                                    AntDesign.right,
                                  )),
                            ],
                          )
                        ]);
                  },
                  error: (error, stackTrace) {
                    return Text(
                      'Error fetching your details. Pull to try again.',
                      textAlign: TextAlign.center,
                      style:
                          context.textTheme.headline4!.copyWith(fontSize: 15),
                    );
                  },
                  loading: () {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
