import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputField extends StatelessWidget {
  final String? hintText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final int? maxLength;
  final String Function(String?)? validator;
  final TextCapitalization textCapitalization;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;

  const TextInputField({
    Key? key,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.maxLength,
    this.validator,
    this.textCapitalization = TextCapitalization.words,
    this.onChanged,
    this.onEditingComplete,
    this.inputFormatters,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLength: maxLength,
        textCapitalization: textCapitalization,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        inputFormatters: inputFormatters,
        readOnly: readOnly,
        style: TextStyle(
            fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
            color: Theme.of(context).textTheme.bodyLarge!.color,
            letterSpacing: 1.2),
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          counterText: "",
        ),
      ),
    );
  }
}