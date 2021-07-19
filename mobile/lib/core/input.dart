import 'package:flutter/material.dart';
import 'package:mobile/core/color.dart';

class Input extends StatelessWidget {
  final Function method;
  final int lines;
  final double size, paddingHorizontal, paddingVertical;
  final String placeholder;
  final TextInputType input;
  final bool hidden;
  final bool enabled;
  final Widget prefixIcon;
  final TextEditingController controller;
  Input({
    this.paddingHorizontal = 17.5,
    this.paddingVertical = 17.5,
    this.prefixIcon,
    this.size = 16,
    this.enabled = true,
    this.controller,
    this.method,
    this.lines,
    this.placeholder,
    this.input,
    this.hidden = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: method,
      textInputAction: TextInputAction.none,
      keyboardType: input,
      maxLines: lines,
      enabled: enabled,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal, vertical: paddingVertical),
        hintText: placeholder,
        hintStyle: TextStyle(
          fontFamily: "popin",
          fontSize: size,
        ),
        suffixIcon: prefixIcon,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1, color: Colors.blue)),
      ),
      obscureText: hidden,
    );
  }
}
