import 'package:flutter/material.dart';

class ValidatorHelper {
  static bool validateForm(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      return true;
    }
    return false;
  }

  static String? field({
    required String title,
    required String value,
    String? message,
  }) {
    if (value.isEmpty) {
      return '$title ${'txt_cannot_be_empty'}';
    }
    return null;
  }

  static sameValue({
    required String errMessage,
    required String value,
    required String sameAs,
  }) {
    if (value != sameAs) {
      return errMessage;
    }
    return null;
  }
}