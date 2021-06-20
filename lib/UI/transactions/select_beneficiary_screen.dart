import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jci_remit_mobile/UI/transactions/vm/transaction_vm.dart';
import 'package:jci_remit_mobile/common/custom_button.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/country_res.dart';
import 'package:jci_remit_mobile/services/api/transaction/model/transaction_res.dart';
import 'package:jci_remit_mobile/values/values.dart';
import 'package:jci_remit_mobile/utils/extensions.dart';
import 'package:jci_remit_mobile/utils/navigator.dart';
import 'package:jci_remit_mobile/utils/theme.dart';

class SelectBeneficiaryScreen extends HookWidget {
  final TransactionData transactionData;
  const SelectBeneficiaryScreen({Key? key, required this.transactionData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var purposes = ['Family Support', 'School', 'Emergency'];
    final country = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Beneficiary',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     ListTile(
              //       contentPadding: EdgeInsets.zero,
              //       selected: true,
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(10)),
              //       leading: CircleAvatar(
              //           child: Icon(
              //             Feather.user_plus,
              //             color: Colors.white,
              //           ),
              //           backgroundColor: Colors.teal),
              //       title: Text(
              //         'Enter Beneficiary Details',
              //         style: TextStyle(
              //             fontWeight: FontWeight.w800,
              //             fontSize: 16,
              //             color: Colors.teal),
              //       ),
              //       trailing: Icon(Icons.chevron_right, color: Colors.teal),
              //     ),
              //     SizedBox(
              //       height: 20,
              //     ),
              //     Text(
              //       'My Beneficiaries',
              //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //     ),
              //     SizedBox(
              //       height: 20,
              //     ),
              //     ListTile(
              //         contentPadding: EdgeInsets.zero,
              //         leading: CircleAvatar(
              //             child: Text('AJ'), backgroundColor: Color(0xFFefecfd)),
              //         title: Text(
              //           'Temitope Ajiboye',
              //           style: TextStyle(
              //               fontWeight: FontWeight.w800,
              //               fontSize: 14,
              //               color: Colors.black87),
              //         ),
              //         subtitle: Text('Zenith Bank - 01234678')),
              //   ],
              // ),
              useProvider(getCountriesProvider).when(
                  data: (List<CountryData> value) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Enter Beneficiary Details',
                          textAlign: TextAlign.center,
                          style: context.textTheme.headline3!
                              .copyWith(color: Colors.grey, fontSize: 14),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: country,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: 'Country',
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            suffixIcon: PopupMenuButton<CountryData>(
                              icon: const Icon(Icons.arrow_drop_down),
                              onSelected: (CountryData value) {
                                country.text = value.country!;
                              },
                              itemBuilder: (BuildContext context) {
                                return value.map<PopupMenuItem<CountryData>>(
                                    (CountryData value) {
                                  return new PopupMenuItem(
                                      child: new Text(value.country!),
                                      value: value);
                                }).toList();
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          // controller: purpose,
                          decoration: InputDecoration(
                            labelText: 'Bank Name',
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
                            labelText: 'Bank Address',
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
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                // controller: purpose,
                                decoration: InputDecoration(
                                  labelText: 'Swift(Optional)',
                                  hintText: '',
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: TextFormField(
                                // controller: purpose,
                                decoration: InputDecoration(
                                  labelText: 'BSB(Optional)',
                                  hintText: '',
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          'Corresponding Bank (Optional)',
                          style: context.textTheme.headline3!
                              .copyWith(color: Colors.grey, fontSize: 14),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          // controller: purpose,
                          decoration: InputDecoration(
                            labelText: 'Bank Name',
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
                            labelText: 'Account Number',
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
                              //showModal(context, purposes, purpose);
                            },
                            title: Text(
                              'PROCEED',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.TEXT_SIZE_16),
                            )),
                      ],
                    );
                  },
                  error: (Object error, StackTrace? stackTrace) {
                    return Center(
                      child: Text('Cannot fetch countries '),
                    );
                  },
                  loading: () => Center(
                        child: CircularProgressIndicator(),
                      ))),
    );
  }
}
