// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app_test/app/data/models/products_model.dart';
import 'package:food_app_test/app/modules/basket/views/basket_view.dart';
import 'package:food_app_test/app/modules/home/controllers/home_controller.dart';
import 'package:food_app_test/constants/constants.dart';
import 'package:get/get.dart';

class CartCounter extends StatefulWidget {
  final int index;
  final HomeController homeController;
  const CartCounter({
    Key? key,
    required this.index,
    required this.homeController,
  }) : super(key: key);

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(
            color: backgroundColor,
          ),
          borderRadius: borderRadius8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CartButton(
            onTap: () {
              widget.homeController.plusToggle(ProductsModel(
                id: widget.homeController.cartList[widget.index].id,
                active: widget.homeController.cartList[widget.index].active,
                createdAt: widget.homeController.cartList[widget.index].createdAt,
                currentPrice: widget.homeController.cartList[widget.index].currentPrice,
                discount: widget.homeController.cartList[widget.index].discount,
                image: widget.homeController.cartList[widget.index].image,
                popular: widget.homeController.cartList[widget.index].popular,
                position: widget.homeController.cartList[widget.index].position,
                price: widget.homeController.cartList[widget.index].price,
                prodCategoryId: widget.homeController.cartList[widget.index].prodCategoryId,
                restaurant: widget.homeController.cartList[widget.index].restaurant,
                restaurantId: widget.homeController.cartList[widget.index].restaurantId,
                updatedAt: widget.homeController.cartList[widget.index].updatedAt,
              ));
              setState(() {});
            },
            icon: CupertinoIcons.add,
          ),
          Obx(
            () => Text(
              widget.homeController.cartList[widget.index].quantity.toString(),
              style: TextStyle(
                color: backgroundColor,
                fontSize: 18.sp,
                fontFamily: gilroyBold,
              ),
            ),
          ),
          CartButton(
            onTap: () {
              widget.homeController.minusToggle(ProductsModel(
                id: widget.homeController.cartList[widget.index].id,
                active: widget.homeController.cartList[widget.index].active,
                createdAt: widget.homeController.cartList[widget.index].createdAt,
                currentPrice: widget.homeController.cartList[widget.index].currentPrice,
                discount: widget.homeController.cartList[widget.index].discount,
                image: widget.homeController.cartList[widget.index].image,
                popular: widget.homeController.cartList[widget.index].popular,
                position: widget.homeController.cartList[widget.index].position,
                price: widget.homeController.cartList[widget.index].price,
                prodCategoryId: widget.homeController.cartList[widget.index].prodCategoryId,
                restaurant: widget.homeController.cartList[widget.index].restaurant,
                restaurantId: widget.homeController.cartList[widget.index].restaurantId,
                updatedAt: widget.homeController.cartList[widget.index].updatedAt,
              ));
              setState(() {});
            },
            icon: widget.homeController.cartList[widget.index].quantity == 1 ? CupertinoIcons.delete : CupertinoIcons.minus,
          )
        ],
      ),
    );
  }
}
