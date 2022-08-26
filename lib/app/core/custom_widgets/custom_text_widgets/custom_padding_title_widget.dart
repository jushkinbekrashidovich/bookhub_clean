import 'package:flutter/material.dart';

class CustomPaddingTitle extends StatelessWidget {
  const CustomPaddingTitle({Key? key, required this.title}) : super(key: key);

 final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15),
      ),
    );
  }
}
