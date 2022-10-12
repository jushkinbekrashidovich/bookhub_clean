import 'package:bookhub/app/modules/book_review/views/book_review_view.dart';
import 'package:bookhub/app/modules/bookhub_shop/views/bookhub_shop_view.dart';
import 'package:bookhub/app/modules/categories/views/categories_view.dart';
import 'package:bookhub/app/modules/home/views/home_view.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) => Scaffold(
        body: DoubleBackToCloseApp(
          snackBar: SnackBar(
            content: Text('Double click to exit app'),
            dismissDirection: DismissDirection.horizontal,
            duration: Duration(seconds: 1),
          ),
          child: IndexedStack(
            index: controller.bottomMenu.index,
            children: [
              HomeView(),
              BookhubShopView(),
            //  BookReviewView(),
              CategoriesView(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: AppColors.unselectedBottomNavItem,
          selectedItemColor: AppColors.mainColor,
          onTap: (pos) => controller.setMenu(BottomMenu.values[pos]),
          currentIndex: controller.bottomMenu.index,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedLabelStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
          elevation: 8,
          items: [
            _bottomNavigationBarItem(
              icon: 'icon_home',
              label: 'Home'.tr,
              activeIcon: 'icon_home_active',
            ),
            _bottomNavigationBarItem(
              icon: 'icon_bookmark',
              label: 'Bookshop'.tr,
              activeIcon: 'icon_bookmark_active',
            ),
            // _bottomNavigationBarItem(
            //   icon: 'icon_donation',
            //   label: 'Reviews'.tr,
            //   activeIcon: 'icon_donation_active',
            // ),
            _bottomNavigationBarItem(
              icon: 'icon_category',
              label: 'Categories'.tr,
              activeIcon: 'icon_category_active',
            ),
          ],
        ),
      ),
    );
  }

  _bottomNavigationBarItem({
    required String activeIcon,
    required String icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: SvgPicture.asset('assets/svg/$icon.svg'),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: SvgPicture.asset('assets/svg/$activeIcon.svg'),
      ),
      label: label,
    );
  }
}
