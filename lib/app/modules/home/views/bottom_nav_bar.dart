// // ignore_for_file: file_names, must_be_immutable, always_use_package_imports, avoid_void_async, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:food_app_test/app/modules/basket/views/basket_view.dart';
import 'package:food_app_test/app/modules/category/views/category_view.dart';
import 'package:food_app_test/app/modules/home/controllers/home_controller.dart';
import 'package:food_app_test/app/modules/order/views/order_view.dart';
import 'package:food_app_test/app/modules/profil/views/profil_view.dart';
import 'package:food_app_test/constants/constants.dart';
import 'package:get/get.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'home_view.dart';
import 'package:ionicons/ionicons.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  HomeController homeController = Get.put(HomeController());

  List page = [const HomeView(), const CategoryView(), BasketView(), const OrderView(), const ProfilView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 22,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: kPrimaryColor,
        useLegacyColorScheme: true,
        selectedLabelStyle: const TextStyle(fontFamily: gilroySemiBold, fontSize: 13),
        unselectedLabelStyle: const TextStyle(fontFamily: gilroyMedium, fontSize: 12),
        currentIndex: selectedIndex,
        onTap: (index) async {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(IconlyLight.home),
            activeIcon: const Icon(IconlyBold.home),
            label: 'home'.tr,
            tooltip: 'home'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(IconlyLight.category),
            activeIcon: const Icon(IconlyBold.category),
            label: 'category'.tr,
            tooltip: 'category'.tr,
          ),
          BottomNavigationBarItem(
            icon: badgeIcon(false),
            activeIcon: badgeIcon(true),
            label: 'cart'.tr,
            tooltip: 'cart'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Ionicons.cube_outline),
            activeIcon: const Icon(Ionicons.cube),
            label: 'order'.tr,
            tooltip: 'order'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              IconlyLight.profile,
            ),
            activeIcon: const Icon(IconlyBold.profile),
            label: 'profil'.tr,
            tooltip: 'profil'.tr,
          ),
        ],
      ),
      body: Center(
        child: page[selectedIndex],
      ),
    );
  }

  Badge badgeIcon(bool isSelected) {
    return Badge(
        alignment: Alignment.topRight,
        backgroundColor: isSelected ? kDefaultIconDarkColor : kPrimaryColor,
        label: Obx(() => Text(
              homeController.cartList.length.toString(),
            )),
        child: Icon(isSelected ? IconlyBold.buy : IconlyLight.buy));
  }
}
