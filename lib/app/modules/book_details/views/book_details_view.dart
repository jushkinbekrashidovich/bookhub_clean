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
        title: Text('About book'),
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
            height: 320,
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
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  imageUrl: photoUrl,
                  placeholder: (context, url) => CircularProgressIndicator(
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
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 40,
                  child: CustomButton(
                    onTap: () {},
                    txt: price+"snkdsankda",
                    textStyle: TextStyle(
                      
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                      fontSize: 19,
                      overflow: TextOverflow.ellipsis
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            //height: MediaQuery.of(context).size.height,
            // color: Colors.red,
            padding: EdgeInsets.only(left: 10, top: 40, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const Text(
                  'kitob haqida',
                  style: TextStyle(fontSize: 21),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 235, 240, 248),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: Icon(
                            Icons.book,
                            size: 18,
                          )),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        category,
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 0,
                  child: ExpandablePanel(
                    header: Text(
                      "Description",
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
                          color: AppColors.grey,
                          fontWeight: FontWeight.w400),
                    ),
                    expanded: Text(
                      description,
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Seller',
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
                              width: 20,
                              child: Icon(
                                CupertinoIcons.person,
                                color: AppColors.mainColor,
                                size: 20,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            ownerName,
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.location,
                            size: 20,
                            color: AppColors.mainColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            location,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.date_range_outlined,
                            size: 20,
                            color: AppColors.mainColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            postedTimestamp,
                            style: TextStyle(fontWeight: FontWeight.w400),
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
        height: 65,
        width: 65,
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
