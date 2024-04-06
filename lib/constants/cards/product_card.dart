import 'package:flutter/material.dart';
import 'package:food_app_test/app/data/models/products_model.dart';
import 'package:food_app_test/app/modules/home/controllers/home_controller.dart';
import 'package:food_app_test/constants/constants.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.snapshot, required this.index});
  final AsyncSnapshot<List<ProductsModel>> snapshot;
  final int index;
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        homeController.addToCart(ProductsModel(
          id: snapshot.data![index].id,
          active: snapshot.data![index].active,
          createdAt: snapshot.data![index].createdAt,
          currentPrice: snapshot.data![index].currentPrice,
          discount: snapshot.data![index].discount,
          image: snapshot.data![index].image,
          popular: snapshot.data![index].popular,
          position: snapshot.data![index].position,
          price: snapshot.data![index].price,
          prodCategoryId: snapshot.data![index].prodCategoryId,
          restaurant: snapshot.data![index].restaurant,
          restaurantId: snapshot.data![index].restaurantId,
          updatedAt: snapshot.data![index].updatedAt,
        ));
        print(homeController.cartList.length);
        // homeController.addCartList(
        //     foodName: 'No Name', image: snapshot.data![index].image!, foodPrice: snapshot.data![index].price!, restoran: snapshot.data![index].restaurant!, foodID: snapshot.data![index].id!);
      },
      child: Container(
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
                imageUrl: snapshot.data![index].image!,
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
                placeholder: (context, url) =>
                    Container(width: 70.w, height: 70.h, decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: borderRadius20), child: const Center(child: CircularProgressIndicator())),
                errorWidget: (context, url, error) => Center(
                  child: Text('noImage'.tr),
                ),
              ),
            ),
            Expanded(
                child: Container(
              height: 70.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    '${snapshot.data![index].restaurant}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: kPrimaryColor1, fontFamily: gilroyMedium, fontSize: 18.sp),
                  ),
                  Text(
                    '${snapshot.data![index].createdAt}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: kPrimaryColor1, fontFamily: gilroyMedium, fontSize: 14.sp),
                  ),
                  Text(
                    '${snapshot.data![index].price} TMT',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: kPrimaryColor1, fontFamily: gilroySemiBold, fontSize: 18.sp),
                  ),
                ],
              ),
            )),
            Icon(
              IconlyBold.arrowRightCircle,
              color: kPrimaryColor1,
              size: 30.dg,
            )
          ],
        ),
      ),
    );
  }
}
