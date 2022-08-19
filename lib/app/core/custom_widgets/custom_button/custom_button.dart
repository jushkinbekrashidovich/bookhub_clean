
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String txt;
  final double height;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color color;
  final BorderRadiusGeometry? borderRadius;
  final AlignmentGeometry alignment;
  final double? width;
  final Color txtcolor;
  const CustomButton({
    Key? key,
    required this.onTap,
    this.height = 48,
    required this.txt,
    this.margin = EdgeInsets.zero,
    this.borderRadius,
    this.color = AppColors.mainColor,
    this.alignment = Alignment.center,
    this.txtcolor= AppColors.white,
    this.padding = EdgeInsets.zero,
    this.width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    
      height: 48,
      width: MediaQuery.of(context).size.width*0.9,
      margin: margin,
      child: ElevatedButton(
          onPressed: ()=> onTap(),      
        style: ElevatedButton.styleFrom(
          onSurface: AppColors.mainColor,
          //primary: AppColors.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8),
          ),
        ).copyWith(
          elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) return 0;
              return 0;
            },
          ),
        ),
        child: Container(
          height: height,
          padding: padding,
          alignment: alignment,
          child: Text(txt, style: const TextStyle(color: AppColors.white, fontSize: 18),),
        ),
      ),
    );
  }
}
