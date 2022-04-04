import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/auth/register/viewmodels/register_vm.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/common/custom_text_field.dart';
import 'package:jci_remit_mobile/common/network_error_widget.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:jci_remit_mobile/utils/theme.dart';

import '../register.model.dart';

class AddressInfo extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = useState(GlobalKey<FormState>());
    final countryModel = useProvider(countryProvider);


    var _countriesWorld = [
      "Afghanistan",
      "Albania",
      "Algeria",
      "American Samoa",
      "Andorra",
      "Angola",
      "Anguilla",
      "Antarctica",
      "Antigua and/or Barbuda",
      "Argentina",
      "Armenia",
      "Aruba",
      "Australia",
      "Austria",
      "Azerbaijan",
      "Bahamas",
      "Bahrain",
      "Bangladesh",
      "Barbados",
      "Belarus",
      "Belgium",
      "Belize",
      "Benin",
      "Bermuda",
      "Bhutan",
      "Bolivia",
      "Bosnia and Herzegovina",
      "Botswana",
      "Bouvet Island",
      "Brazil",
      "British Indian Ocean Territory",
      "Brunei Darussalam",
      "Bulgaria",
      "Burkina Faso",
      "Burundi",
      "Canada",
      "Cambodia",
      "Cameroon",
      "Cape Verde",
      "Cayman Islands",
      "Central African Republic",
      "Chad",
      "Chile",
      "China",
      "Christmas Island",
      "Cocos (Keeling) Islands",
      "Colombia",
      "Comoros",
      "Congo",
      "Cook Islands",
      "Costa Rica",
      "Croatia (Hrvatska)",
      "Cuba",
      "Cyprus",
      "Czech Republic",
      "Denmark",
      "Djibouti",
      "Dominica",
      "Dominican Republic",
      "East Timor",
      "Ecudaor",
      "Egypt",
      "El Salvador",
      "Equatorial Guinea",
      "Eritrea",
      "Estonia",
      "Ethiopia",
      "Falkland Islands (Malvinas)",
      "Faroe Islands",
      "Fiji",
      "Finland",
      "France",
      "France, Metropolitan",
      "French Guiana",
      "French Polynesia",
      "French Southern Territories",
      "Gabon",
      "Gambia",
      "Georgia",
      "Germany",
      "Ghana",
      "Gibraltar",
      "Greece",
      "Greenland",
      "Grenada",
      "Guadeloupe",
      "Guam",
      "Guatemala",
      "Guinea",
      "Guinea-Bissau",
      "Guyana",
      "Haiti",
      "Heard and Mc Donald Islands",
      "Honduras",
      "Hong Kong",
      "Hungary",
      "Iceland",
      "India",
      "Indonesia",
      "Iran (Islamic Republic of)",
      "Iraq",
      "Ireland",
      "Israel",
      "Italy",
      "Ivory Coast",
      "Jamaica",
      "Japan",
      "Jordan",
      "Kazakhstan",
      "Kenya",
      "Kiribati",
      "Korea, Democratic People's Republic of",
      "Korea, Republic of",
      "Kosovo",
      "Kuwait",
      "Kyrgyzstan",
      "Lao People's Democratic Republic",
      "Latvia",
      "Lebanon",
      "Lesotho",
      "Liberia",
      "Libyan Arab Jamahiriya",
      "Liechtenstein",
      "Lithuania",
      "Luxembourg",
      "Macau",
      "Macedonia",
      "Madagascar",
      "Malawi",
      "Malaysia",
      "Maldives",
      "Mali",
      "Malta",
      "Marshall Islands",
      "Martinique",
      "Mauritania",
      "Mauritius",
      "Mayotte",
      "Mexico",
      "Micronesia, Federated States of",
      "Moldova, Republic of",
      "Monaco",
      "Mongolia",
      "Montserrat",
      "Morocco",
      "Mozambique",
      "Myanmar",
      "Namibia",
      "Nauru",
      "Nepal",
      "Netherlands",
      "Netherlands Antilles",
      "New Caledonia",
      "New Zealand",
      "Nicaragua",
      "Niger",
      "Nigeria",
      "Niue",
      "Norfork Island",
      "Northern Mariana Islands",
      "Norway",
      "Oman",
      "Pakistan",
      "Palau",
      "Panama",
      "Papua New Guinea",
      "Paraguay",
      "Peru",
      "Philippines",
      "Pitcairn",
      "Poland",
      "Portugal",
      "Puerto Rico",
      "Qatar",
      "Reunion",
      "Romania",
      "Russian Federation",
      "Rwanda",
      "Saint Kitts and Nevis",
      "Saint Lucia",
      "Saint Vincent and the Grenadines",
      "Samoa",
      "San Marino",
      "Sao Tome and Principe",
      "Saudi Arabia",
      "Senegal",
      "Seychelles",
      "Sierra Leone",
      "Singapore",
      "Slovakia",
      "Slovenia",
      "Solomon Islands",
      "Somalia",
      "South Africa",
      "South Georgia South Sandwich Islands",
      "South Sudan",
      "Spain",
      "Sri Lanka",
      "St. Helena",
      "St. Pierre and Miquelon",
      "Sudan",
      "Suriname",
      "Svalbarn and Jan Mayen Islands",
      "Swaziland",
      "Sweden",
      "Switzerland",
      "Syrian Arab Republic",
      "Taiwan",
      "Tajikistan",
      "Tanzania, United Republic of",
      "Thailand",
      "Togo",
      "Tokelau",
      "Tonga",
      "Trinidad and Tobago",
      "Tunisia",
      "Turkey",
      "Turkmenistan",
      "Turks and Caicos Islands",
      "Tuvalu",
      "Uganda",
      "Ukraine",
      "United Arab Emirates",
      "United Kingdom",
      "United States",
      "United States minor outlying islands",
      "Uruguay",
      "Uzbekistan",
      "Vanuatu",
      "Vatican City State",
      "Venezuela",
      "Vietnam",
      "Virigan Islands (British)",
      "Virgin Islands (U.S.)",
      "Wallis and Futuna Islands",
      "Western Sahara",
      "Yemen",
      "Yugoslavia",
      "Zaire",
      "Zambia",
      "Zimbabwe"
    ];

    var _sourceOfFunds = [
      'Bank Loan',
      'Business',
      'End of Service Benefit',
      'Family Associates',
      'Financial Market',
      'Gift',
      'Real Estate',
      'Salary',
      'Salary Savings'
    ];

    final countryOfResidence = useState('');
    final countryOfNationality = useState('');
    final sourceOfFunds = useState('');
    final state = useState('');
    final city = useState('');
    final address = useState('');
    final postcode = useState('');

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
    var theme = context.themeData.textTheme;
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
                        style: theme.headline3!.copyWith(
                            fontSize: 13, color: Colors.grey.shade500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField(
                          // value: country.value != null ? country.value : null,
                          hint: Text("Select Country of Residence"),
                          isDense: true,
                          decoration: InputDecoration(
                            hintText: 'Select Country of Residence',
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
                          onChanged: (String? newValue) {
                            countryOfResidence.value = newValue!;
                            context
                                .read(statesProvider(countryOfResidence.value));
                            state.value = '';
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please select a country';
                            }
                            return null;
                          },
                          items: data.data
                              .map<DropdownMenuItem<String>>(
                                  (value) => DropdownMenuItem(
                                        value: value.alpha3Code,
                                        child: Text(value.country!),
                                      ))
                              .toList()),
                      SizedBox(
                        height: 20,
                      ),
                      Consumer(
                        builder: (context, watch, child) {
                          final states =
                              watch(statesProvider(countryOfResidence.value));

                          return states.when(
                              data: (data) {
                                // _states.value = List.from(_states.value)
                                //   ..addAll(data.data);
                                return DropdownButtonFormField(
                                    //  value: state.value,
                                    hint: Text("Select State"),
                                    decoration: InputDecoration(
                                      hintText: 'Select State',
                                      // filled: true,
                                      // fillColor: phoneBgColor.value,
                                      contentPadding: const EdgeInsets.only(
                                          left: 14.0, bottom: 8.0, top: 8.0),
                                      border:
                                          Borders.customOutlineInputBorder(),
                                      enabledBorder:
                                          Borders.customOutlineInputBorder(),
                                      focusedBorder:
                                          Borders.customOutlineInputBorder(
                                              color: AppColors.primaryColor),
                                      // focusColor: AppColors.accentColor.withOpacity(0.8),
                                    ),
                                    onChanged: (String? newValue) {
                                      state.value = newValue!;

                                      print(state.value);
                                    },
                                    // validator: (String? value) {
                                    //   if (value != null || value != '') {
                                    //     return 'Please select a state';
                                    //   }
                                    //   return null;
                                    // },
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
                                  Text('Select a country'));
                        },
                      ),
                      //  : SizedBox(),
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
                        height: 20,
                      ),

                      CustomTextFormField(
                        focusNode: cityFocusNode,
                        fillColor: cityBgColor.value,
                        onChanged: (v) => city.value = v,
                        textInputType: TextInputType.text,
                        hintText: 'City',
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'City is required';
                          }

                          // validator has to return something :)
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        focusNode: emailFocusNode,
                        fillColor: emailBgColor.value,
                        onChanged: (v) => address.value = v,
                        textInputType: TextInputType.text,
                        hintText: 'Address',
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Address is required';
                          }

                          // validator has to return something :)
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
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
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Postal Code is required';
                          }

                          // validator has to return something :)
                          return null;
                        },
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField(
                        // value: country.value != null ? country.value : null,
                        hint: Text("Select Country of Nationality"),
                        isDense: true,
                        decoration: InputDecoration(
                          hintText: 'Select Country of Nationality',
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
                        onChanged: (String? newValue) {
                          countryOfNationality.value = newValue!;
                        },
                        validator: (String? value) {
                          if (value == null) {
                            return 'Please select a country';
                          }
                          return null;
                        },

                          items: _countriesWorld
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList()),

                      SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField(
                          hint: Text("Source of Funds"),
                          isDense: true,
                          decoration: InputDecoration(
                            hintText: 'Source of Funds',
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            border: Borders.customOutlineInputBorder(),
                            enabledBorder: Borders.customOutlineInputBorder(),
                            focusedBorder: Borders.customOutlineInputBorder(
                                color: AppColors.primaryColor),
                          ),
                          onChanged: (String? newValue) {
                            sourceOfFunds.value = newValue!;
                          },
                          validator: (String? value) {
                            if (value == null) {
                              return 'Please select source of funds';
                            }
                            return null;
                          },
                          items: _sourceOfFunds
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList()),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          width: MediaQuery.of(context).size.width,
                          onPressed: () {
                            if (!_formKey.value.currentState!.validate()) {
                              return null;
                            }
                            _formKey.value.currentState!.save();
                            context.flow<Register>().update((register) =>
                                register.copyWith(
                                    countryOfResidence:
                                        countryOfResidence.value,
                                    countryOfNationality:
                                        countryOfNationality.value,
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
                        height: 20,
                      ),
                    ],
                  ),
                );
              },
              loading: () => Center(
                    child: CircularProgressIndicator(),
                  ),
              error: (error, stack) => Center(
                  child: NetworkErrorWidget(
                      refreshCallBack: () =>
                          context.refresh(countryProvider))))),
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
