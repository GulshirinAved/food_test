// ignore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors, avoid_implementing_value_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app_test/constants/constants.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final bool backArrow;
  final Widget? icon;
  final bool actionIcon;
  final String name;

  const CustomAppBar({
    required this.backArrow,
    required this.actionIcon,
    required this.name,
    this.icon,
    super.key,
  });

  @override
  Widget get child => Text('ad');

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 1);

  @override
  Widget build(BuildContext context) {
    final double sizeWidth = MediaQuery.of(context).size.width;
    return AppBar(
      elevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: kPrimaryColor,
      ),
      leadingWidth: 40,
      leading: backArrow
          ? Padding(
              padding: const EdgeInsets.only(left: 8),
              child: IconButton(
                color: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(
                  Icons.arrow_back,
                  // IconlyLight.arrowLeftCircle,
                  color: Colors.white,
                  size: 22,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            )
          : SizedBox.shrink(),
      actions: [
        if (actionIcon)
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: icon,
          )
        else
          SizedBox.shrink()
      ],
      automaticallyImplyLeading: false,
      backgroundColor: kPrimaryColor2,
      title: Text(
        name.tr,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontFamily: gilroyMedium,
          fontSize: sizeWidth > 800 ? 35 : 22,
        ),
      ),
    );
  }
}
