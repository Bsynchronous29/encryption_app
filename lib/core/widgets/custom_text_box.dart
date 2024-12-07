// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextBox extends StatelessWidget {
  CustomTextBox({
    super.key,
    required this.label,
    this.obscureText = false,
    this.controller,
    this.prefixIcon,
    this.maxLines = 1,
    this.minLines = 1,
    this.readOnly = false,
    this.labelStyle,
  });

  Widget? prefixIcon;
  String label;
  bool obscureText = false;
  TextEditingController? controller;
  bool readOnly;
  int? minLines;
  int? maxLines;
  TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              label,
              style: labelStyle ??
                  const TextStyle(
                    color: Colors.white,
                  ),
            ),
          ),
          TextFormField(
            readOnly: readOnly,
            controller: controller,
            obscureText: obscureText,
            minLines: minLines,
            maxLines: maxLines,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              hintText: label,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
