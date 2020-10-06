import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class InputHoverWidget extends StatelessWidget {
  final String value;
  final String hint;
  final TextInputType keyboardType;
  final bool enabled;
  final bool obscureText;
  final EdgeInsets margin;
  final Color color;
  final Color hintColor;
  final Color borderColor;
  final TextEditingController controller;
  final Function onChange;

  InputHoverWidget({
    this.value,
    this.hint = '',
    this.keyboardType,
    this.enabled = true,
    this.obscureText = false,
    this.margin,
    this.color,
    this.hintColor,
    this.borderColor,
    this.controller,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerResponsive(
      margin: EdgeInsetsResponsive.only(bottom: 5, top: 5),
      child: TextFormField(
        enabled: enabled,
        controller: controller,
        keyboardType: keyboardType,
        initialValue: value,
        obscureText: obscureText,
        cursorColor: (color != null) ? color : Theme.of(context).primaryColor,
        onChanged: onChange,
        style: TextStyle(
          color: (color != null) ? color : Theme.of(context).primaryColor,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          labelText: hint,
          labelStyle: TextStyle(
            color: (hintColor != null)
                ? hintColor
                : Theme.of(context).primaryColor,
            fontSize: 12,
          ),
          // NOTE Focus
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: (borderColor != null)
                  ? borderColor
                  : Theme.of(context).primaryColor,
            ),
          ),
          // NOTE enabled
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: (borderColor != null)
                  ? borderColor
                  : Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
