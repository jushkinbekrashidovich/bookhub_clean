import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    this.height=44,
    this.hintText,
    
    
    }) : super(key: key);
  final TextEditingController controller;
  final height;
  final hintText;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: height,
      child: TextField(
        keyboardType: TextInputType.text,
        controller: controller,
        decoration:  InputDecoration(
          contentPadding: EdgeInsets.all(12),
          // suffixIcon: Icon(Icons.clear_rounded),
          filled: true,
          fillColor: const Color(0xffF9F9FD),
          border:const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              gapPadding: 0,
              borderSide: BorderSide.none),
          focusedBorder:const OutlineInputBorder(
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
