import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/dashboard/viewmodels/user_dash_vm.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/common/snackbar.dart';
import 'package:jci_remit_mobile/controllers/request_state_notifier.dart';
import 'package:jci_remit_mobile/services/api/user/models/customer_update_dto.dart';
import 'package:jci_remit_mobile/services/api/user/models/user_dto.dart';
import 'package:jci_remit_mobile/utils/navigator.dart';
import 'package:jci_remit_mobile/utils/theme.dart';
import 'package:jci_remit_mobile/utils/extensions.dart';
import 'package:jci_remit_mobile/values/values.dart';

import 'vm/profile_vm.dart';

class PersonalDataScreen extends HookWidget {
  final UserDto userDto;
  const PersonalDataScreen({required this.userDto, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _genders = ['Select One','Male', 'Female'];
    var _accountTypes = ['Select One','Individual-Account', 'Business-Account'];
    final _formKey = useState(GlobalKey<FormState>());
    final dob = useState<DateTime>(DateTime.now());
    final _email = useTextEditingController(text: userDto.email);
    final _password = useTextEditingController();
    final _address = useTextEditingController(text: userDto.address);
    final _accountType = useTextEditingController(text: userDto.accountType);
    final _gender = useTextEditingController(text: userDto.gender);
    final _dob =
        useTextEditingController(text: userDto.dateOfBirth?.toIso8601String());
    final _phone = useTextEditingController(text: userDto.phoneNumber);
    return ProviderListener(
      onChange: (BuildContext context, value) {
        if (value is Success) {
          context.refresh(userProvider);
          AppSnackBar.showSuccessSnackBar(context, message: 'Profile Updated');
        }
        if (value is Error) {
          AppSnackBar.showErrorSnackBar(context,
              message: value.error.toString());
        }
      },
      provider: updateUserProvider,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: AppColors.white,
            ),
            onPressed: () {
              Navigator.pop(context, 'BeneficiaryCreatedFailed');
            },
          ),
          title: Text('My Account',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.TEXT_SIZE_18,
                  fontWeight: FontWeight.bold)),
          backgroundColor: AppColors.red,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey.value,
            child: Stack(alignment: AlignmentDirectional.center, children: [
              Image.asset('assets/images/watermark.png',
                  width: MediaQuery.of(context).size.width * 0.8),
              ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: context.screenHeight(1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Personal Information',
                          textAlign: TextAlign.center,
                          style: context.textTheme.headline3!
                              .copyWith(color: Colors.grey, fontSize: 14),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          readOnly: true,
                          controller: _email,
                          validator: (val) {
                            if (val == null || val.isEmpty)
                              return 'Field cannot be empty';
                            return null;
                          },
                          // keyboardType: TextInputType.number,
                          // inputFormatters: [
                          //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                          // ],
                          decoration: InputDecoration(
                            labelText: 'Email Address',
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
                          controller: _phone,
                          readOnly: true,
                          validator: (val) {
                            if (val == null || val.isEmpty)
                              return 'Field cannot be empty';
                            return null;
                          },
                          // keyboardType: TextInputType.number,
                          // inputFormatters: [
                          //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                          // ],
                          decoration: InputDecoration(
                            labelText: 'Phone',
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

                        // DropdownButtonFormField<String>(
                        //   value: _gender.text,
                        //   hint: Text("Select Gender"),
                        //   decoration: InputDecoration(
                        //     labelText: 'Gender',
                        //     contentPadding: const EdgeInsets.only(
                        //         left: 14.0, bottom: 8.0, top: 8.0),
                        //     border: Borders.customOutlineInputBorder(),
                        //     enabledBorder: Borders.customOutlineInputBorder(),
                        //     focusedBorder: Borders.customOutlineInputBorder(
                        //         color: AppColors.primaryColor),
                        //     // focusColor: AppColors.accentColor.withOpacity(0.8),
                        //   ),
                        //   onChanged: (String? newValue) {
                        //     _gender.text = newValue!;
                        //   },
                        //   validator: (String? value) {
                        //     if (value?.isEmpty ?? true) {
                        //       return 'Please select a gender';
                        //     }
                        //     return null;
                        //   },
                        //   items: _genders
                        //       .map<DropdownMenuItem<String>>((String value) {
                        //     return DropdownMenuItem<String>(
                        //       value: value,
                        //       child: Text(value),
                        //     );
                        //   }).toList(),
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        DateTimeFormField(
                          initialValue: userDto.dateOfBirth,
                          decoration: InputDecoration(
                            labelText: 'Date of Birth',
                            hintText: '',
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          mode: DateTimeFieldPickerMode.date,
                          autovalidateMode: AutovalidateMode.always,
                          validator: (e) => (e?.day ?? 0) == 1
                              ? 'Please not the first day'
                              : null,
                          onDateSelected: (DateTime value) {
                            print(value);
                            dob.value = value;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        DropdownButtonFormField<String>(
                          value: _accountType.text,
                          hint: Text("Account Type"),
                          decoration: InputDecoration(
                            labelText: 'Account Type',
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            border: Borders.customOutlineInputBorder(),
                            enabledBorder: Borders.customOutlineInputBorder(),
                            focusedBorder: Borders.customOutlineInputBorder(
                                color: AppColors.primaryColor),
                            // focusColor: AppColors.accentColor.withOpacity(0.8),
                          ),
                          onChanged: (String? newValue) {
                            _accountType.text = newValue!;
                          },
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please select an account type';
                            }
                            return null;
                          },
                          items: _accountTypes
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _address,
                          validator: (val) {
                            if (val == null || val.isEmpty)
                              return 'Field cannot be empty';
                            return null;
                          },
                          maxLines: 3,
                          // keyboardType: TextInputType.number,
                          // inputFormatters: [
                          //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                          // ],
                          decoration: InputDecoration(
                            labelText: 'Address',
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
                        // TextFormField(
                        //   controller: accName,
                        //   validator: (val) {
                        //     if (val == null || val.isEmpty)
                        //       return 'Field cannot be empty';
                        //     return null;
                        //   },
                        //   decoration: InputDecoration(
                        //     labelText: 'Account Name',
                        //     hintText: '',
                        //     contentPadding:
                        //         EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(5.0),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // TextFormField(
                        //   controller: bankName,
                        //   validator: (val) {
                        //     if (val == null || val.isEmpty)
                        //       return 'Field cannot be empty';
                        //     return null;
                        //   },
                        //   decoration: InputDecoration(
                        //     labelText: 'Bank Name',
                        //     hintText: '',
                        //     contentPadding:
                        //         EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(5.0),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // TextFormField(
                        //   controller: accCountry,
                        //   validator: (val) {
                        //     if (val == null || val.isEmpty)
                        //       return 'Field cannot be empty';
                        //     return null;
                        //   },
                        //   decoration: InputDecoration(
                        //     labelText: 'Country',
                        //     hintText: '',
                        //     contentPadding:
                        //         EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(5.0),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // TextFormField(
                        //   controller: accSwiftCode,
                        //   decoration: InputDecoration(
                        //     labelText: 'Swift Code',
                        //     hintText: '',
                        //     contentPadding:
                        //         EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(5.0),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 50),
                        Consumer(
                          builder: (BuildContext context,
                              T Function<T>(ProviderBase<Object?, T>) watch,
                              Widget? child) {
                            final vm = watch(updateUserProvider);
                            return CustomButton(
                                color: Colors.black,
                                width: MediaQuery.of(context).size.width,
                                onPressed: vm is Loading
                                    ? null
                                    : () {
                                        if (!_formKey.value.currentState!
                                            .validate()) {
                                          return null;
                                        }
                                        _formKey.value.currentState!.save();
                                        final customer = CustomerUpdateDto()
                                          ..address = _address.text
                                          ..phoneNumber = _phone.text
                                          ..email = userDto.email
                                          ..firstName = userDto.firstName
                                          ..lastName = userDto.lastName
                                          ..country = userDto.country
                                          ..state = userDto.state
                                          ..country = userDto.country
                                          ..postalCode = userDto.postalCode;

                                        context
                                            .read(updateUserProvider.notifier)
                                            .updateUser(customer);
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
                  // : EmptyStateWidget(
                  //     error:
                  //         "Seems like you've not added a bank account yet",
                  //     textOnButton: '+ Add Bank Account',
                  //     errorTitle: 'One minute!',

                  //     // TODO: Navigate to a create transaction screen
                  //     refreshCallBack: () {
                  //       setState(() {
                  //         isCreateAccount = false;
                  //       });
                  //     },
                  //   )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
