import 'package:flutter/material.dart';
import 'package:quotes_app/res/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String labelText;
  final String text;
  final int maxLines;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.labelText,
    required this.text,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;

    final OutlineInputBorder textFieldBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.greyColor),
      borderRadius: BorderRadius.circular(12),
    );
    OutlineInputBorder textFieldErrorBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(12),
    );
    return Padding(
      padding: EdgeInsets.only(top: height * 0.01),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: labelText,
          labelStyle: const TextStyle(
              fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w300),
          enabledBorder: textFieldBorder,
          focusedBorder: textFieldBorder,
          errorBorder: textFieldErrorBorder,
          focusedErrorBorder: textFieldErrorBorder,
        ),
        maxLines: maxLines,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter your $text";
          }
          return null;
        },
      ),
    );
  }
}
