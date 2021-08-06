import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ssalindemann/models/user_model.dart';

const _USER_KEY = 'USER_KEY';

class LocalStorage {
  static late SharedPreferences prefs;

  static Future<void> configurePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveUserModel(UserModel user) async {
    prefs = await SharedPreferences.getInstance();
    final rawUser = jsonEncode(user.toJson());
    await prefs.setString(_USER_KEY, rawUser);
  }

  static Future<UserModel?> getUserModel() async {
    prefs = await SharedPreferences.getInstance();
    final rawUser = prefs.getString(_USER_KEY);
    if (rawUser != null) {
      final json = jsonDecode(rawUser);
      return UserModel.fromJson(json['id'], json);
    } else {
      return null;
    }
  }
}
