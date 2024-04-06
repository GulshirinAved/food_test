import 'package:flutter/material.dart';
import 'package:food_app_test/app/modules/home/controllers/home_controller.dart';
import 'package:food_app_test/constants/buttons/agree_button_view.dart';
import 'package:food_app_test/constants/buttons/cartCounter_button.dart';
import 'package:food_app_test/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:get/get.dart';

class BasketView extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  BasketView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('cart'.tr),
          centerTitle: true,
        ),
        body: Obx(() => Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: homeController.cartList.isEmpty
                  ? const Center(
                      child: Text("Sebet bos"),
                    )
                  : Column(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Obx(() {
                              return ListView.builder(
                                itemCount: homeController.cartList.length,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                                    margin: EdgeInsets.only(left: 10.w, right: 10.w),
                                    decoration: const BoxDecoration(borderRadius: borderRadius20),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: borderRadius15,
                                          child: CachedNetworkImage(
                                            fadeInCurve: Curves.ease,
                                            imageUrl: homeController.cartList[index].image,
                                            imageBuilder: (context, imageProvider) => Container(
                                              width: 70.w,
                                              height: 70.h,
                                              decoration: BoxDecoration(
                                                borderRadius: borderRadius15,
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            placeholder: (context, url) => Container(
                                                width: 70.w,
                                                height: 70.h,
                                                decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: borderRadius20),
                                                child: const Center(child: CircularProgressIndicator())),
                                            errorWidget: (context, url, error) => Center(
                                              child: Text('noImage'.tr),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            child: Container(
                                          height: 70.h,
                                          width: 150.w,
                                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '${homeController.cartList[index].position}',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(color: kPrimaryColor1, fontFamily: gilroyMedium, fontSize: 18.sp),
                                              ),
                                              Text(
                                                '${homeController.cartList[index].restaurant}',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(color: kPrimaryColor1, fontFamily: gilroyMedium, fontSize: 14.sp),
                                              ),
                                              Text(
                                                '${homeController.cartList[index].currentPrice} TMT',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(color: kPrimaryColor1, fontFamily: gilroySemiBold, fontSize: 18.sp),
                                              ),
                                            ],
                                          ),
                                        )),
                                        CartCounter(index: index, homeController: homeController)
                                      ],
                                    ),
                                  );
                                },
                              );
                            })),
                        GetBuilder<HomeController>(
                          builder: (controller) {
                            return lastPrice();
                          },
                        ),
                        const Expanded(flex: 1, child: SizedBox()),
                      ],
                    ),
            )));
  }

  Widget lastPrice() {
    HomeController homeController = Get.put(HomeController());
    double sum = 0;
    for (var element in homeController.cartList) {
      double a = double.parse(element.price);

      a *= element.quantity;

      sum += a;
    }
    return Column(
      children: [
        const Divider(
          color: Colors.white,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Jemi Bahasy:',
              style: TextStyle(color: Colors.white60, fontFamily: gilroyMedium, fontSize: 18.sp),
            ),
            Text(
              '${sum.toStringAsFixed(2)} TMT',
              style: TextStyle(color: Colors.white60, fontFamily: gilroyMedium, fontSize: 18.sp),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Eltip bermek :',
                style: TextStyle(color: Colors.white60, fontFamily: gilroyMedium, fontSize: 18.sp),
              ),
              Text(
                '20.0 TMT',
                style: TextStyle(color: Colors.white60, fontFamily: gilroyMedium, fontSize: 18.sp),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Umumy bahasy :',
              style: TextStyle(color: Colors.white, fontFamily: gilroySemiBold, fontSize: 18.sp),
            ),
            Text(
              '${sum + 20} TMT',
              style: TextStyle(color: Colors.white, fontFamily: gilroySemiBold, fontSize: 18.sp),
            ),
          ],
        ),
        AgreeButton(onTap: () {
          print(homeController.cartList.length);
        })
      ],
    );
  }
}

class CartButton extends StatelessWidget {
  final IconData icon;
  VoidCallback onTap;
  CartButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Icon(
          icon,
          color: backgroundColor,
          size: 16.w,
        ),
      ),
    );
  }
}
