// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextFormFieldTemplate extends StatelessWidget {
  final String initialValue;
  final String labelText;
  final String hintText;
  final IconData? prefixIcon;

  final TextEditingController controller;
  final Function(String)? onChanged;
  final VoidCallback? onSubmitted;

  const TextFormFieldTemplate({
    Key? key,
    required this.initialValue,
    required this.labelText,
    required this.hintText,
    this.prefixIcon,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onTap: onSubmitted,
      controller: controller,
      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        contentPadding: EdgeInsets.all(10),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
              )
            : null,
        enabledBorder: OutlineInputBorder(
          //<-- SEE HERE
          borderSide: BorderSide(
            color: Color.fromARGB(255, 212, 210, 210),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          //<-- SEE HERE
          borderSide: BorderSide(
            color: Color.fromARGB(255, 212, 210, 210),
          ),
        ),
        fillColor: Colors.greenAccent,
      ),
    );
  }
}
