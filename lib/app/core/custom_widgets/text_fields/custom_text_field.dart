import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    this.height = 44,
    this.hintText,
    this.keyboardType,
  }) : super(key: key);
  final TextEditingController controller;
  final double height;
  final  hintText;
  final  keyboardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        decoration:  InputDecoration(
          contentPadding: EdgeInsets.all(12),
          // suffixIcon: Icon(Icons.clear_rounded),
          filled: true,
          fillColor: Color(0xffF9F9FD),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              gapPadding: 0,
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.mainColor),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
