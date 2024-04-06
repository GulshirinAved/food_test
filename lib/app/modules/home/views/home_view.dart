import 'package:flutter/material.dart';
import 'package:food_app_test/app/data/models/category_model.dart';
import 'package:food_app_test/app/data/models/products_model.dart';
import 'package:food_app_test/app/data/services/product_service.dart';
import 'package:food_app_test/constants/cards/product_card.dart';
import 'package:food_app_test/constants/constants.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController homeController = Get.put(HomeController());

  int selectedIndex = 1;
  int categoryID = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('home'.tr, style: TextStyle(color: Colors.white, fontSize: 18.sp)),
          actions: [
            Padding(padding: EdgeInsets.only(right: 18.r), child: const Icon(IconlyLight.call, color: Colors.white)),
          ],
          centerTitle: false,
        ),
        body: Column(
          children: [paradiseMenu(), categories(), products()],
        ));
  }

  Expanded products() {
    return Expanded(
        flex: 2,
        child: FutureBuilder<List<ProductsModel>>(
            future: ProductService().getProducts(categoryID),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Text('Error');
              } else if (snapshot.data!.isEmpty) {
                return const Text('Empty');
              }
              return ListView.separated(
                itemCount: snapshot.data!.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(snapshot: snapshot, index: index);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: Colors.white,
                    thickness: 1,
                  );
                },
              );
            }));
  }

  Container categories() {
    return Container(
      height: 40.h,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: FutureBuilder<List<CategoryModel>>(
          future: homeController.category,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.data!.isEmpty) {
              return const Text('Empty');
            }
            return ListView.builder(
              itemCount: snapshot.data!.length + 1,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return index == 0
                    ? Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 10.r),
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                        child: const Icon(IconlyLight.search),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            categoryID = snapshot.data![index - 1].id!;
                            ProductService().getProducts(categoryID);
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          margin: EdgeInsets.only(left: 10.w),
                          decoration: BoxDecoration(color: selectedIndex == index ? const Color(0xffe8d575) : Colors.white, borderRadius: borderRadius20),
                          child: Text(
                            snapshot.data![index - 1].title.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontFamily: gilroySemiBold, fontSize: 14.sp),
                          ),
                        ),
                      );
              },
            );
          }),
    );
  }

  Container paradiseMenu() {
    return Container(
      decoration: const BoxDecoration(color: Color(0xff457b45), borderRadius: borderRadius15),
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 8.w),
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      child: Row(
        children: [
          Expanded(
              child: Text(
            'Paradise Menu',
            style: TextStyle(color: Colors.white, fontFamily: gilroyBold, fontSize: 24.sp),
          )),
          Container(padding: EdgeInsets.all(6.sp), decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white), child: const Icon(IconlyLight.arrowDownCircle))
        ],
      ),
    );
  }
}
