// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextBox extends StatefulWidget {
  CustomTextBox({
    super.key,
    required this.label,
    this.initialValue,
    this.controller,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.labelStyle,
    this.prefixIcon,
    this.obscureText = false,
    this.isPassword = false,
  });

  bool isPassword;
  String? initialValue;
  Widget? prefixIcon;
  String label;
  bool obscureText = false;
  TextEditingController? controller;
  bool readOnly;
  int? minLines;
  int? maxLines;
  TextStyle? labelStyle;

  @override
  State<CustomTextBox> createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {
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
              widget.label,
              style: widget.labelStyle ??
                  const TextStyle(
                    color: Colors.white,
                  ),
            ),
          ),
          TextFormField(
            initialValue: widget.initialValue,
            readOnly: widget.readOnly,
            controller: widget.controller,
            obscureText: widget.obscureText,
            minLines: widget.minLines,
            maxLines: widget.maxLines,
            decoration: InputDecoration(
              prefixIcon: widget.prefixIcon,
              suffixIcon: !widget.isPassword
                  ? null
                  : IconButton(
                      tooltip: widget.obscureText
                          ? 'Show Password'
                          : 'Hide Password',
                      onPressed: () {
                        setState(() {
                          widget.obscureText = !widget.obscureText;
                        });
                      },
                      icon: !widget.obscureText
                          ? const Icon(Icons.remove_red_eye_outlined)
                          : const Icon(Icons.remove_red_eye)),
              hintText: widget.label,
              filled: true,
              fillColor: Colors.white,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ],
      ),
    );
  }
}
