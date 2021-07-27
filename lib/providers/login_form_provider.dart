import 'package:flutter/material.dart';
import 'package:ssalindemann/providers/auth_provider.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String usuario = '';
  String password = '';

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      print('Form valido  Login');
      print("$usuario --- $password");
      return true;
    } else {
      print('Form no valido');
      return false;
    }
  }
}
