import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/auth/register/viewmodels/register_vm.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/common/custom_text_field.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:flow_builder/flow_builder.dart';

import '../register.model.dart';

class AddressInfo extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = useState(GlobalKey<FormState>());
    final countryModel = useProvider(countryProvider);
    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: false);

    final country = useState();
    final state = useState();
    final city = useState();
    final address = useState();
    final postcode = useState();

    final fnameFocusNode = useFocusNode();
    final lnameFocusNode = useFocusNode();
    final emailFocusNode = useFocusNode();
    final cityFocusNode = useFocusNode();
    final userNameFocusNode = useFocusNode();
    final fnameBgColor = useState(Colors.white);
    final lnameBgColor = useState(Colors.white);
    final emailBgColor = useState(Colors.white);
    final cityBgColor = useState(Colors.white);
    final userNameBgColor = useState(Colors.white);
    txtFieldListener(fnameFocusNode, fnameBgColor);
    txtFieldListener(lnameFocusNode, lnameBgColor);
    txtFieldListener(emailFocusNode, emailBgColor);
    txtFieldListener(cityFocusNode, cityBgColor);
    var theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: countryModel.when(
              data: (data) {
                return Form(
                  key: _formKey.value,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Enter your address information',
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.clip,
                        style: theme.headline3.copyWith(
                            fontSize: 13, color: Colors.grey.shade500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField(
                          value: country.value != null ? country.value : null,
                          hint: Text("Select Country"),
                          isDense: true,
                          decoration: InputDecoration(
                            hintText: 'Select Country',
                            // filled: true,
                            // fillColor: phoneBgColor.value,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            border: Borders.customOutlineInputBorder(),
                            enabledBorder: Borders.customOutlineInputBorder(),
                            focusedBorder: Borders.customOutlineInputBorder(
                                color: AppColors.primaryColor),
                            // focusColor: AppColors.accentColor.withOpacity(0.8),
                          ),
                          onChanged: (newValue) {
                            country.value = newValue;
                            context.read(statesProvider(country.value));
                            state.value = null;

                            print(country.value);
                          },
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please select a country';
                            }
                            return null;
                          },
                          items: data.data
                              .map<DropdownMenuItem<String>>(
                                  (value) => DropdownMenuItem(
                                        value: value.alpha3Code,
                                        child: Text(value.country),
                                      ))
                              .toList()),
                      SizedBox(
                        height: 20,
                      ),
                      country.value != null
                          ? Consumer(
                              builder: (context, watch, child) {
                                final states =
                                    watch(statesProvider(country.value));

                                return states.when(
                                    data: (data) {
                                      // _states.value = List.from(_states.value)
                                      //   ..addAll(data.data);
                                      return DropdownButtonFormField(
                                          value: state.value,
                                          hint: Text("Select State"),
                                          decoration: InputDecoration(
                                            hintText: 'Select State',
                                            // filled: true,
                                            // fillColor: phoneBgColor.value,
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    left: 14.0,
                                                    bottom: 8.0,
                                                    top: 8.0),
                                            border: Borders
                                                .customOutlineInputBorder(),
                                            enabledBorder: Borders
                                                .customOutlineInputBorder(),
                                            focusedBorder: Borders
                                                .customOutlineInputBorder(
                                                    color:
                                                        AppColors.primaryColor),
                                            // focusColor: AppColors.accentColor.withOpacity(0.8),
                                          ),
                                          onChanged: (newValue) {
                                            state.value = newValue;

                                            print(state.value);
                                          },
                                          validator: (value) {
                                            if (value?.isEmpty ?? true) {
                                              return 'Please select a state';
                                            }
                                            return null;
                                          },
                                          items: data.data
                                              .map<DropdownMenuItem<String>>(
                                                  (value) => DropdownMenuItem(
                                                        value: value,
                                                        child: Text(value),
                                                      ))
                                              .toList());
                                    },
                                    loading: () => Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                    error: (error, stack) =>
                                        Text('Cannot load state'));
                              },
                            )
                          : SizedBox(),
                      // SizedBox(
                      //   height: ScreenUtil().setHeight(20),
                      // ),
                      // CustomTextFormField(
                      //   focusNode: lnameFocusNode,
                      //   fillColor: lnameBgColor.value,
                      //   onChanged: (v) => state.value = v,
                      //   textInputType: TextInputType.text,
                      //   hintText: 'State/Region',
                      //   validator: (String value) {
                      //     if (value.isEmpty) {
                      //       return 'State/Region';
                      //     }

                      //     // validator has to return something :)
                      //     return null;
                      //   },
                      // ),
                      SizedBox(
                        height: ScreenUtil().setHeight(20),
                      ),
                      CustomTextFormField(
                        focusNode: cityFocusNode,
                        fillColor: cityBgColor.value,
                        onChanged: (v) => city.value = v,
                        textInputType: TextInputType.text,
                        hintText: 'City',
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'City is required';
                          }

                          // validator has to return something :)
                          return null;
                        },
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(20),
                      ),
                      CustomTextFormField(
                        focusNode: emailFocusNode,
                        fillColor: emailBgColor.value,
                        onChanged: (v) => address.value = v,
                        textInputType: TextInputType.text,
                        hintText: 'Address',
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Address is required';
                          }

                          // validator has to return something :)
                          return null;
                        },
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(20),
                      ),
                      CustomTextFormField(
                        focusNode: userNameFocusNode,
                        fillColor: userNameBgColor.value,
                        onChanged: (v) => postcode.value = v,
                        textInputType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        hintText: 'Postal Code',
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Postal Code is required';
                          }

                          // validator has to return something :)
                          return null;
                        },
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(20),
                      ),
                      CustomButton(
                          width: MediaQuery.of(context).size.width,
                          onPressed: () {
                            if (!_formKey.value.currentState.validate()) {
                              return null;
                            }
                            _formKey.value.currentState.save();
                            context.flow<Register>().update((register) =>
                                register.copyWith(
                                    country: country.value,
                                    state: state.value,
                                    city: city.value,
                                    address: address.value,
                                    postalCode: postcode.value));
                            // context.read(registerNotifierProvider).register(
                            //       context,
                            //       email.value.trim(),
                            //       firstName.value.trim(),
                            //       lastName.value.trim(),
                            //       userName.value.trim(),
                            //     );
                          },
                          title: Text(
                            'Continue',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.TEXT_SIZE_16),
                          )),
                      SizedBox(
                        height: ScreenUtil().setHeight(60),
                      ),
                    ],
                  ),
                );
              },
              loading: () => Center(
                    child: CircularProgressIndicator(),
                  ),
              error: (error, stack) => Text('An error occured'))),
    );
  }
}

void txtFieldListener(FocusNode focusNode, dynamic colorState) {
  focusNode.addListener(() {
    if (focusNode.hasFocus) {
      colorState.value = AppColors.primaryColor.withOpacity(0.2);
    } else {
      colorState.value = Colors.white;
    }
  });
}
