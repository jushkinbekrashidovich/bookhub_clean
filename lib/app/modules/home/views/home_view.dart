import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final List _images = [
    'assets/books/item1.jpg',
    'assets/books/item2.jpg',
    'assets/books/item3.jpg',
    'assets/books/item4.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
              appBar: AppBar(
                title: const SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        prefixIcon: SizedBox(
                          width: 20,
                          height: 20,
                          child: Center(child: Icon(Icons.search)),
                        ),
                        filled: true,
                        fillColor: Color(0xffF9F9FD),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          gapPadding: 0,
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'search'),
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    Get.toNamed("/profile");
                  },
                  icon: const Icon(
                    CupertinoIcons.person_circle,
                    size: 34,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Get.toNamed('/add-book');
                    },
                    icon: const Icon(Icons.add),
                    iconSize: 27,
                  ),
                ],
              ),
              body: ListView.separated(
                physics: BouncingScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                padding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
                itemCount: _images.length,
                //primary: false,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(left: 6),
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
                                image: AssetImage(_images[index]),
                                fit: BoxFit.fill),
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1.2,
                                blurRadius: 1.2,
                                offset:
                                    Offset(0, 3), // changes position of shadow
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
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
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
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 15),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 17,
                                  ),
                                  Text(
                                    'Tashkent',
                                    style: TextStyle(fontSize: 13),
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
                                  style: TextStyle(fontSize: 10),
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ));
            
  }
}
