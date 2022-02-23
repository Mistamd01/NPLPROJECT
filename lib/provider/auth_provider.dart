import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:npl/model/user_model.dart';

class AuthProvider with ChangeNotifier {
  String? token;
  late UserModel profile;

  setUser(responseBody)async{
    var response = jsonDecode(responseBody);
    profile = UserModel.fromJson(response['user']);
    token = response['access_token'];
    notifyListeners();
  }
}