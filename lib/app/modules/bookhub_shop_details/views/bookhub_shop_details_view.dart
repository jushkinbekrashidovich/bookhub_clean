import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/custom_widgets/custom_button/custom_button.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/bookhub_shop_details_controller.dart';

class BookhubShopDetailsView extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String price;
  final String phoneNumber;
  final String photoUrl;
  final String authorName;
  final String type;
  final String quality;

  const BookhubShopDetailsView(
      {required this.title,
      required this.description,
      required this.price,
      required this.phoneNumber,
      required this.photoUrl,
      required this.quality,
      //this.isExchange,
      required this.authorName,
      required this.type,
      required this.id})
      : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: 140),
              children: [
                Container(
                  padding: EdgeInsets.only(top: 2),
                  //color: Colors.red,
                  height: 350,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CachedNetworkImage(
                        imageBuilder: (context, imageProvider) => Container(
                          width: 145.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: imageProvider,
                            ),
                          ),
                        ),
                        imageUrl: photoUrl,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text(
                            title,
                            //style: TextStyle(color: AppColors.red),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text(
                            price,
                            //style: TextStyle(color: AppColors.red),
                            style: TextStyle(color: AppColors.mainColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          )),
                      Container(
                        padding: EdgeInsets.only(left: 2, right: 2),
                        height: 70,
                        width: MediaQuery.of(context).size.width * 0.90,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Author',
                                  style: TextStyle(
                                      fontSize: 12, color: AppColors.grey),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                SizedBox(
                                  height: 18,
                                  child: Text(authorName,
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                            SizedBox(
                                height: 30,
                                child: VerticalDivider(
                                  thickness: 2,
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Quality',
                                  style: TextStyle(
                                      fontSize: 12, color: AppColors.grey),
                                ),
                                SizedBox(
                                  height: 18,
                                  child: Text(quality,
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                            SizedBox(
                                height: 30,
                                child: VerticalDivider(
                                  thickness: 2,
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Type',
                                  style: TextStyle(
                                      fontSize: 12, color: AppColors.grey),
                                ),
                                SizedBox(
                                  height: 18,
                                  child: Text(type,
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  //height: MediaQuery.of(context).size.height,
                  // color: Colors.red,
                  padding: EdgeInsets.only(left: 10, top: 20, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'About',
                        style: TextStyle(fontSize: 20),
                      ),
                      Card(
                        elevation: 0,
                        child: ExpandablePanel(
                          header: Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          collapsed: Text(
                            description,
                            softWrap: true,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 126, 126, 126),
                                fontWeight: FontWeight.w400),
                          ),
                          expanded: Text(
                            description,
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 126, 126, 126),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CustomButton(
              onTap: () async {
                await launch("https://t.me/bookhubshop");
              },
              txt: 'Sotib olish'),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
