import 'package:flutter/material.dart';

class CustomInputs {
  static InputDecoration loginInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
        // focusColor: Colors.yellow,
        // hoverColor: Colors.yellow,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.yellow.withOpacity(0.5),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.yellow.withOpacity(0.5),
          ),
        ),
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(
          icon,
          color: Colors.yellow.withOpacity(0.6),
        ),
        labelStyle: TextStyle(color: Colors.yellow.withOpacity(0.6)),
        hintStyle: TextStyle(color: Colors.yellow.withOpacity(0.6)));
  }

  static InputDecoration searchInputDecoration({
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        hintText: hint,
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
        labelStyle: TextStyle(color: Colors.grey),
        hintStyle: TextStyle(color: Colors.grey));
  }

  static InputDecoration formInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
        // focusColor: Colors.yellow,
        // hoverColor: Colors.yellow,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.brown.withOpacity(0.5),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.brown.withOpacity(0.5),
          ),
        ),
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(
          icon,
          color: Colors.brown.withOpacity(0.6),
        ),
        labelStyle: TextStyle(color: Colors.brown.withOpacity(0.6)),
        hintStyle: TextStyle(color: Colors.brown.withOpacity(0.6)));
  }
}
