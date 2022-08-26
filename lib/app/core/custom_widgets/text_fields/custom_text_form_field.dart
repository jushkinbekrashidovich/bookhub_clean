import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      required this.controller,
      required this.maxLines,
      required this.hintText})
      : super(key: key);

  final TextEditingController controller;
  final int maxLines;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(12),
        // suffixIcon: Icon(Icons.clear_rounded),
        filled: true,
        fillColor: const Color(0xffF9F9FD),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            gapPadding: 0,
            borderSide: BorderSide.none),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintText: hintText,
      ),
    );
  }
}
