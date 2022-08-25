import 'package:bookhub/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomLoaderDialog extends StatelessWidget {
  const CustomLoaderDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular( 10))),
      content: Builder(
        builder: (context) {
          // Get available height and width of the build area of this widget. Make a choice depending on the size.
          // var height = MediaQuery.of(context).size.height;
          // var width = MediaQuery.of(context).size.width;

          return Container(
            //padding: EdgeInsets.all(50),
            color: AppColors.white,
            //width: 85.w,
            child: Container(
                padding: EdgeInsets.all(15),
                //width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(
                        color: AppColors.mainColor,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'loading',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
