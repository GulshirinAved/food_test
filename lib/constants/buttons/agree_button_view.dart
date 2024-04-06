// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_app_test/constants/constants.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AgreeButton extends StatelessWidget {
  final Function() onTap;

  const AgreeButton({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: animatedContaner());
  }

  Widget animatedContaner() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: borderRadius10,
        color: Colors.white,
      ),
      margin: EdgeInsets.only(top: 20.h),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: Get.size.width,
      child: Text(
        'agree'.tr,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: kPrimaryColor, fontFamily: gilroyBold, fontSize: 22.sp),
      ),
    );
  }
}
