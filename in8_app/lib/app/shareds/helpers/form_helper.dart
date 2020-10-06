import 'package:flutter/material.dart';

class FormHelper {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  bool get validate {
    final FormState form = key.currentState;
    FocusScope.of(form.context).requestFocus(new FocusNode());

    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

}