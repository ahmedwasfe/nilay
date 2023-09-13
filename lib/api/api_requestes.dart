import 'dart:convert';
import 'dart:developer';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nilay/api/api_helper.dart';
import 'package:nilay/model/facebook_user.dart';

class ApiRequestes {
  static final _client = http.Client();

  static Future<FacebookUser?> facebbokLogin({required String facebookToken}) async {
    http.Response response = await _client.get(Uri.parse('${ApiHelper.FACEBOOK_LOGIN}$facebookToken'));
    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      FacebookUser user = FacebookUser.fromJson(body);
      print('SUCCESS: ${jsonEncode(user)}');
      return user;
    }else {
      print('ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

}
