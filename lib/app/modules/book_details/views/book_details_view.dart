import 'package:bookhub/app/core/custom_widgets/custom_button/custom_button.dart';
import 'package:bookhub/app/core/theme/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/book_details_controller.dart';

class BookDetailsView extends StatelessWidget {
  final String title;
  final String description;
  final String ownerName;
  final String price;
  final String phoneNumber;
  final String photoUrl;
  final String location;
  final String category;
  final String postedTimestamp;

  const BookDetailsView({
    required this.title,
    required this.description,
    required this.ownerName,
    required this.price,
    required this.phoneNumber,
    required this.photoUrl,
    required this.location,
    required this.category,
    required this.postedTimestamp,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 140),
        children: [
          Container(
            padding: EdgeInsets.only(top: 15),
            //color: Colors.red,
            height: 345,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageBuilder: (context, imageProvider) => Container(
                    width: 155.0,
                    height: 220.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  imageUrl: photoUrl,
                  placeholder: (context, url) => CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                
                Chip(
                  backgroundColor: Color.fromARGB(255, 43, 137, 238),
                  labelPadding: EdgeInsets.only(left: 10, right: 10),
                  label: Text(
                    title,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white),
                  ),),
                // Container(
                //     width: MediaQuery.of(context).size.width * 0.9,
                //     child: Text(
                //       title,
                //       //style: TextStyle(color: AppColors.red),
                //       maxLines: 1,
                //       overflow: TextOverflow.ellipsis,
                //       textAlign: TextAlign.center,
                //     )),

                Chip(
                  backgroundColor: AppColors.mainColor,
                  labelPadding: EdgeInsets.only(left: 10, right: 10),
                  label: Text(
                    price,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white),
                  ),
                ),
                // Container(
                //    decoration: BoxDecoration(
                //     color: AppColors.white,

                //    ),
                //     width: MediaQuery.of(context).size.width * 0.9,
                //     child: Text(
                //       price,
                //       style:
                //           TextStyle(color: AppColors.mainColor, fontSize: 22),
                //       maxLines: 1,
                //       overflow: TextOverflow.ellipsis,
                //       textAlign: TextAlign.center,
                //     )),
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
                
                Text(
                  'About'.tr,
                  style: TextStyle(fontSize: 21),
                ),
                SizedBox(
                  height: 10,
                ),
                //IconButton(onPressed: () {}, icon: Icon(Icons.settings),splashColor: AppColors.red, splashRadius: 3,),
                Chip(
                  backgroundColor: Color.fromARGB(255, 235, 240, 248),
                  labelPadding: EdgeInsets.only(left: 10, right: 10),
                  label: Text(
                    category,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Card(
                  elevation: 0,
                  child: ExpandablePanel(
                    header: Text(
                      'Description'.tr,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                    collapsed: Text(
                      description,
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16,
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
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Seller'.tr,
                  style: TextStyle(fontSize: 21),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 235, 240, 248),
                                  borderRadius: BorderRadius.circular(5)),
                              height: 25,
                              width: 25,
                              child: Icon(
                                CupertinoIcons.person,
                                color: AppColors.mainColor,
                                size: 18,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            height: 22,
                            width: 220,
                            child: Text(ownerName,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 235, 240, 248),
                                  borderRadius: BorderRadius.circular(5)),
                              height: 25,
                              width: 25,
                              child: Icon(
                                Icons.location_on_outlined,
                                color: AppColors.mainColor,
                                size: 18,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            height: 22,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                              location,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 235, 240, 248),
                                  borderRadius: BorderRadius.circular(5)),
                              height: 25,
                              width: 25,
                              child: Icon(
                                Icons.date_range_outlined,
                                color: AppColors.mainColor,
                                size: 18,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            postedTimestamp,
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 55,
        width: 55,
        child: FloatingActionButton(
          onPressed: () async {
            launch('tel://$phoneNumber');
          },
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.phone,
            color: AppColors.white,
            size: 35,
          ),
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}
