
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProfileItems extends StatelessWidget {
  const ProfileItems({
    Key? key, required this.text, required this.icon, required this.link,
  }) : super(key: key);
  final String text;
  final Icon icon;
  final Function link;
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        link();
      },
      child: SizedBox( 
        height: 56,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: icon,),
            Expanded(
              flex: 7,
              child: Text(text)),
           const Expanded(
              flex: 2,
              child: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 19,)),
          ],
        ),
      ),
    );
  }
}