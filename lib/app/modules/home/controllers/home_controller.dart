import 'package:food_app_test/app/data/models/category_model.dart';
import 'package:food_app_test/app/data/models/products_model.dart';
import 'package:food_app_test/app/data/services/category_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late Future<List<CategoryModel>> category;

  RxList cartList = [].obs;
  RxDouble totalPrice = 0.0.obs;
  RxBool agree = false.obs;
  void addToCart(ProductsModel productsModel) {
    bool itemExists = false;

    for (final item in cartList) {
      if (item.id == productsModel.id) {
        item.quantity += 1;
        itemExists = true;
        update();
        break;
      }
    }

    if (!itemExists) {
      cartList.add(productsModel);
    }
  }

  void removeFromCart(ProductsModel product) {
    cartList.removeWhere((item) => item.id == product.id);
  }

  void plusToggle(ProductsModel product) {
    for (var element in cartList) {
      if (element.position == product.position) {
        element.quantity += 1;
        update();
      }
    }
  }

  void minusToggle(ProductsModel product) {
    int index = cartList.indexWhere((element) => element.id == product.id);
    if (index != -1) {
      if (cartList[index].quantity == 1) {
        cartList.removeAt(index);

        update();
      } else {
        cartList[index].quantity--;
        update();
      }
    }
  }

  void agreeToggle() {
    agree.value = !agree.value;
    print(agree);
    update();
  }

  void sumProduct() {
    for (int i = 0; i < cartList.length; i++) {
      totalPrice.value += double.parse(cartList[i].price) * cartList[i].quantity;
      update();
    }
  }

  // addCartList({required String foodName, required int foodID, required String image, required String foodPrice, required String restoran}) {
  //   if (cartList.isEmpty) {
  //     cartList.add({
  //       'id': foodID,
  //       'name': foodName,
  //       'price': foodPrice,
  //       'image': image,
  //       'resto': restoran,
  //     });
  //     totalPrice.value += double.parse(foodPrice.toString());
  //     showSnackBar("Gosuldy", 'Haryt sebede gosuldy', Colors.green);
  //   } else {
  //     print(cartList.length);
  //     print('-------------------------------');
  //     for (var element in cartList) {
  //       if (int.parse(element['id'].toString()) == foodID) {
  //         showSnackBar("Yalnyslyk", "Bu haryt sebetde bar", Colors.red);
  //       } else {
  //         print(foodID);
  //         // cartList.add({
  //         //   'id': foodID,
  //         //   'name': foodName,
  //         //   'price': foodPrice,
  //         //   'image': image,
  //         //   'resto': restoran,
  //         // });
  //         showSnackBar("Gosuldy", 'Haryt sebede gosuldy', Colors.green);
  //       }
  //     }
  //   }
  //   print(cartList);
  // }

  @override
  void onInit() {
    category = CategoryService().getCategories();

    super.onInit();
  }
}
