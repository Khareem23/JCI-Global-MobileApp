import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jci_remit_mobile/helper/static_config.dart';
import 'package:jci_remit_mobile/services/storage/shared_prefs.dart';
import 'package:jci_remit_mobile/utils/utils.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class Network {
  final String _url = 'https://api.jciremit.com/api';

  var token;

  _getToken() async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // final util = Util();
    final token = StorageUtil.getString(StaticConfig.token);
   // print(token);
    return token;
  }


  putData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    await _getToken();
    return await http.put(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  authData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    await _getToken();
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
   // print(fullUrl);
    await _getToken();
   // print(_getToken());
   var rrr= await http.get(Uri.parse(fullUrl), headers: _setHeaders());
   print(rrr);
    return rrr;
  }

  uploadAvatar(File _image, context, apiUrl) async {
    var fullUrl = _url + apiUrl;

    var stream = new http.ByteStream(DelegatingStream.typed(_image.openRead()));

    var length = await _image.length();

    await _getToken();

    Map<String, String> headers = _setHeaders();

    var uri = Uri.parse(fullUrl);

    var request = new http.MultipartRequest("POST", uri);

    var multipartFile = new http.MultipartFile('avatar', stream, length,
        filename: basename(_image.path));

    request.fields['type'] = "leaderboard";

    request.headers.addAll(headers);

    request.files.add(multipartFile);

    //popup(context, "Uploading! Please Wait...");

    try {
      var response = await request.send().timeout(const Duration(seconds: 60));
      print(response.statusCode);

      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });

      if (response.statusCode == 200) {
        Navigator.of(context).pop();
        // popupButton(
        //     context, "Leaderboard Avatar uploaded successfully", "Close", () {
        //   Navigator.of(context).pop();
        //});
      } else {
        Navigator.of(context).pop();
        // popupButton(context, "Error Uploading Avatar", "Close",
        //     () => Navigator.of(context).pop());
      }
    } on TimeoutException catch (e) {
      print('Timeout: $e');
      // Toast.show("Connection Timeout, Looks like something went wrong", context,
      //     duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    } on Error catch (e) {
      print('Error: $e');
      // Toast.show("Error: $e", context,
      //     duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
  }

  void logout(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    await prefs.remove('token');
    await Future.delayed(Duration(seconds: 1));
    // Navigator.of(context).pushAndRemoveUntil(
    //   // the new route
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => SignInEmail(),
    //   ),

    //   (Route route) => false,
    // );
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
}
