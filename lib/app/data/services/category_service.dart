import 'dart:convert';
import 'dart:io';
import 'package:food_app_test/constants/constants.dart';
import 'package:http/http.dart' as http;

import '../models/category_model.dart';

class CategoryService {
  Future<List<CategoryModel>> getCategories() async {
    final List<CategoryModel> categoryList = [];
    final response = await http.get(
      Uri.parse(
        '$serverURL/api/v1/product/category',
      ),
      headers: <String, String>{
        HttpHeaders.acceptLanguageHeader: 'tm',
      },
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body)['category'];
      for (final Map product in responseJson) {
        categoryList.add(CategoryModel.fromJson(product));
      }
      return categoryList;
    } else {
      return [];
    }
  }
}
