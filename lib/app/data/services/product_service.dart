import 'dart:convert';
import 'dart:io';
import 'package:food_app_test/app/data/models/products_model.dart';
import 'package:food_app_test/constants/constants.dart';
import 'package:http/http.dart' as http;

import '../models/category_model.dart';

class ProductService {
  Future<List<ProductsModel>> getProducts(int id) async {
    final List<ProductsModel> productList = [];
    final response = await http.get(
      Uri.parse(
        '$serverURL/api/v1/product/category/$id',
      ),
      headers: <String, String>{
        HttpHeaders.acceptLanguageHeader: 'tm',
      },
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body)['products'];
      for (final Map product in responseJson) {
        productList.add(ProductsModel.fromJson(product));
      }
      return productList;
    } else {
      return [];
    }
  }
}
