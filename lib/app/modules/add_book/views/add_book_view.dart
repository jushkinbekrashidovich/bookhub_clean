import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/custom_widgets/custom_button/custom_button.dart';
import '../../../core/theme/app_colors.dart';
import '../controllers/add_book_controller.dart';

class AddBookView extends GetView<AddBookController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add your book'),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 10, bottom: 15, left: 10, right: 10),
        children: [
          Container(
            height: 120,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(),
                  const Text(
                    'Please upload image',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    'Photo',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Color(0xffE6F2FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.photo_camera,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'select image',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 7, bottom: 10),
                  child: Text(
                    'Title',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 44,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    //controller: nameController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      // suffixIcon: Icon(Icons.clear_rounded),
                      filled: true,
                      fillColor: Color(0xffF9F9FD),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          gapPadding: 0,
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.mainColor),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      hintText: 'Example: Hello World',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 7, bottom: 10),
                  child: Text(
                    'Description',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ),
                TextFormField(
                  maxLines: 3,
                  maxLength: 70,
                  keyboardType: TextInputType.text,
                  //controller: nameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    // suffixIcon: Icon(Icons.clear_rounded),
                    filled: true,
                    fillColor: Color(0xffF9F9FD),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        gapPadding: 0,
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.mainColor),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    hintText: 'Ismingiz',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 7, bottom: 10),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xffF9F9FD),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton<String>(
                      isExpanded: true,
                      underline: Container(),
                      selectedItemBuilder: (_) {
                        return [
                          "educational",
                          "sel-improvement",
                          'textbook',
                          'language',
                          'fiction',
                          'novel'
                        ].map((String choice) {
                          return Center(
                            child: Container(
                              width: double.infinity,
                              child: Text(choice),
                            ),
                          );
                        }).toList();
                      },
                      items: [
                        "educational",
                        "sel-improvement",
                        'textbook',
                        'language',
                        'fiction',
                        'novel'
                      ].map((String choice) {
                        return DropdownMenuItem<String>(
                          value: choice,
                          child: Row(
                            children: [Text(choice)],
                          ),
                        );
                      }).toList(),
                      onChanged: (opt) {}),
                ),
               const SizedBox(
                  height: 10,
                ),
                Container(
                  //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  
                  // margin:
                  // EdgeInsets.symmetric(horizontal: DEFAULT_PADDING * 1.0),
                  height: 48,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffF9F9FD),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Is exchange?",
                        style: TextStyle(fontSize: 13),
                      ),
                      Spacer(),
                      Container(
                        //padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        height: double.infinity,
                        //width: 150,
                        child: CupertinoSwitch(
                          onChanged: (value) {
                            //value = value;
                          },
                          value: false,
                          //activeColor: yellow1,
                          //activeTrackColor: Colors.yellow,
                          //inactiveThumbColor: Colors.redAccent,
                          //inactiveTrackColor: Colors.orange,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 7, bottom: 10),
                  child: Text(
                    'Price',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ),
                const SizedBox(
                  height: 48,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    //controller: nameController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      // suffixIcon: Icon(Icons.clear_rounded),
                      //suffix: Text('UZS',style: TextStyle(color: AppColors.black),),
                      filled: true,
                      fillColor: Color(0xffF9F9FD),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          gapPadding: 0,
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.mainColor),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      hintText: 'price',
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
              padding: EdgeInsets.only(right: 10, left: 10),
              child: CustomButton(onTap: () {}, txt: 'save')),
        ],
      ),
    );
  }
}
