import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/app_colors.dart';

class CustomGridViewItem extends StatelessWidget {
  const CustomGridViewItem(
      {Key? key, required this.txt, required this.icon, required this.onpress})
      : super(key: key);

  final String txt;
  final String icon;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onpress();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 199, 224, 244).withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(
                0.01,
                0.01,
              ), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 35,
                child: SvgPicture.asset('assets/svg/$icon.svg')),
            ),
            SizedBox(
                height: 32,
                width: 65,
                child: Text(
                  txt,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                )),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
