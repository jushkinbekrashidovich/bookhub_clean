import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
  final String pages;
  final String deliver;

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
      required this.id,
      required this.pages,
      required this.deliver})
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
              padding: EdgeInsets.only(bottom: 30),
              children: [
                Container(
                  padding: EdgeInsets.only(top: 2),
                  //color: Colors.red,
                  height: 435,
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
                      SizedBox(height: 3,),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text(
                            title,
                            style: TextStyle(
                                fontSize: 17, color: Color.fromARGB(255, 100, 118, 210)),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          )),
                          Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text(
                            authorName,
                            style: TextStyle(
                                fontSize: 15, color: Color.fromARGB(255, 90, 89, 89)),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          )),

                      SizedBox(
                        height: 3,
                      ),
                      // Container(
                      //     width: MediaQuery.of(context).size.width * 0.9,
                      //     child: Text(
                      //       price,
                      //       //style: TextStyle(color: AppColors.red),
                      //       style: TextStyle(
                      //           color: AppColors.mainColor, fontSize: 20),
                      //       maxLines: 1,
                      //       overflow: TextOverflow.ellipsis,
                      //       textAlign: TextAlign.center,
                      //     )),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Container(
                        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        //height: 100,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 199, 224, 244)
                                  .withOpacity(0.3),
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
                                Icons.book_outlined,
                                color: AppColors.mainColor,
                                size: 18,
                              )),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  type,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            Divider(
                              indent: 1.0,
                              endIndent: 30.0,
                              thickness: 1,
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
                                CupertinoIcons.book,
                                color: AppColors.mainColor,
                                size: 18,
                              )),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  pages,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            Divider(
                              indent: 1.0,
                              endIndent: 30.0,
                              thickness: 1,
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
                                Icons.local_shipping_outlined,
                                color: AppColors.mainColor,
                                size: 18,
                              )),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  deliver,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            Divider(
                              indent: 1.0,
                              endIndent: 30.0,
                              thickness: 1,
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
                              Icons.done,
                                color: AppColors.mainColor,
                                size: 18,
                              )),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  quality,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10)),

                  //height: MediaQuery.of(context).size.height,
                  // color: Colors.red,
                  padding: EdgeInsets.only(left: 10, top: 20, right: 10),
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About'.tr,
                        style: TextStyle(fontSize: 18),
                      ),
                      Card(
                        
                        color: AppColors.white,
                        elevation: 0,
                        child: ExpandablePanel(
                          header: Text(
                            'Description'.tr,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
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
                            style: GoogleFonts.ptSerif(
                              fontSize: 15,
                              color: Color.fromARGB(255, 126, 126, 126),
                              wordSpacing: 1.5,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: ()async{
          await launch("https://t.me/bookhubshopbot");
        },
        child: Container(
            //padding: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.mainColor
            ),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(left: 10, right: 10),
            //width: 280,
            height: 47,
             child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart, size: 17,color: AppColors.white,),
                  SizedBox(width: 5,),
                  Text(price, style: TextStyle(color: AppColors.white, fontSize: 16),),
                  
                ],
              ),
           ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   //heroTag: 'contactOnline',
      //   onPressed: () async {
      //     launch('https://t.me/bookhubshopbot');
      //   },
      //   backgroundColor: AppColors.mainColor,
      //   child: Icon(
      //     CupertinoIcons.shopping_cart,
      //     color: AppColors.white,
      //     size: 35,
      //   ),
      // ),
    );
  }
}
