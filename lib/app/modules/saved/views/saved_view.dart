import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../controllers/saved_controller.dart';

class SavedView extends GetView<SavedController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        itemCount: 3,
        itemBuilder: (context, index) => 
        Container(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 120,
                width: 85,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/books/item1.jpg"),
                      fit: BoxFit.fill),
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1.2,
                      blurRadius: 1.2,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 20,
                      width: 120,
                      child: const Text(
                        'Atomic Habits',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 4),
                      height: 20,
                      width: 120,
                      child: const Text(
                        'Hello World',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.location_on_outlined,
                          size: 17,
                        ),
                        Text(
                          'Tashkent',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 0, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.bookmark,
                            size: 23,
                          )),
                    ),
                    Container(
                      height: 15,
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        '11/03/2022',
                        style: TextStyle(fontSize: 11),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
