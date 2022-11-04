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
      required this.id, required this.pages, required this.deliver})
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
                      SizedBox(height: 15,),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text(
                            title,
                          style: TextStyle(fontSize: 19),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text(
                            price,
                            //style: TextStyle(color: AppColors.red),
                            style: TextStyle(color: AppColors.mainColor, fontSize: 22),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          )),
                          SizedBox(height: 10,),
                      
                      Container(
                        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                        margin: EdgeInsets.only(left: 6, right: 6,),
                        //height: 100,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('✍️'),
                                SizedBox(width: 5,),
                                Text(authorName),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Row(
                              children: [
                                Text('📘'),
                                SizedBox(width: 5,),
                                Text(type),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Row(
                              children: [
                                Text('📖'),
                                SizedBox(width: 5,),
                                Text(pages),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Row(
                              children: [
                                Text('🚚'),
                                SizedBox(width: 5,),
                                Text(deliver,),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Row(
                              children: [
                                Text('✅'),
                                SizedBox(width: 5,),
                                Text(quality),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  
                  //height: MediaQuery.of(context).size.height,
                  // color: Colors.red,
                  padding: EdgeInsets.only(left: 10, top: 20, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About'.tr,
                        style: TextStyle(fontSize: 20),
                      ),
                      Card(
                        color: AppColors.white,
                        elevation: 0,
                        child: ExpandablePanel(
                          header: Text(
                            'Description'.tr,
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
                            style: GoogleFonts.ptSerif(
                              fontSize: 16,
                              color: Color.fromARGB(255, 126, 126, 126),
                              wordSpacing: 1.5,
                              fontWeight: FontWeight.w400,

                            ),
                            // TextStyle(
                            //   letterSpacing: 1,
                            //   wordSpacing: 1.5,
                            //     fontSize: 16,
                            //     color: Color.fromARGB(255, 126, 126, 126),
                            //     fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // CustomButton(
          //     onTap: () async {
          //       await launch("https://t.me/bookhubshop");
          //     },
          //     txt: 'Sotib olish'),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: 'contactPhone',
            onPressed: () async {
              launch('tel://+998880189977');
            },
            backgroundColor: Colors.blue,
            child: const Icon(
              Icons.phone,
              color: AppColors.white,
              size: 35,
            ),
          ),
          FloatingActionButton(
            heroTag: 'contactOnline',
            onPressed: () async {
              launch('https://t.me/bookhubshopbot');
            },
            backgroundColor: Colors.blue,
            child: const Icon(
              Icons.telegram_outlined,
              color: AppColors.white,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
