import 'package:flutter/material.dart';

class SimpleTextField extends StatelessWidget {
  String label;
  IconData icon;
  bool password;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputType inputType = TextInputType.text;
  TextInputAction inputAction;
  FocusNode focusNode;
  FocusNode nextNode;
  Function onChange;
  String initialValue;
  TextCapitalization textCapitalization;

  SimpleTextField(
      {@required this.label,
      this.icon,
      this.password = false,
      this.controller,
      this.validator,
      this.inputType,
      this.inputAction,
      this.focusNode,
      this.nextNode,
      this.onChange,
      this.initialValue,
      this.textCapitalization = TextCapitalization.none});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: textCapitalization,
      initialValue: initialValue,
      controller: controller,
      obscureText: password,
      validator: validator,
      keyboardType: inputType,
      textInputAction: inputAction,
      focusNode: focusNode,
      onChanged: (value) => onChange(value),
      decoration: InputDecoration(
        labelText: label,
        icon: icon == null ? null : Icon(icon),
      ),
      onFieldSubmitted: (text) {
        if (nextNode != null) {
          FocusScope.of(context).requestFocus(nextNode);
        }
      },
    );
  }
}
