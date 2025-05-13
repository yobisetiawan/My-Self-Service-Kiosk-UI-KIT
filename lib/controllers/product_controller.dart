import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:myapp/data/product.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var mainCategories = <MainCategory>[].obs;
  var productRecomendations = <Product>[].obs;
  var selectedProducts = <Product>[].obs;

  var productDetails = Rx<Product?>(null);

  @override
  void onInit() async {
    super.onInit();
    await loadProducts();
    loadMainCategories();
    loadProductRecomendations();
  }

  void setProductDetails(Product product) {
    productDetails.value = product;
  }

  Future<void> loadProducts() async {
    try {
      List<String> jsonFiles = [
        'lib/data/product_burgers.json',
        'lib/data/product_breakfast.json',
        'lib/data/product_chickennfish.json',
        'lib/data/product_FriesnSides.json',
        'lib/data/product_nuggets.json',
        'lib/data/product_SweetsTreats.json',
        'lib/data/product_HappyMeal.json',
        'lib/data/product_beverages.json',
        'lib/data/product_coffee.json',
      ];

      List<Product> p = [];

      for (String file in jsonFiles) {
        final String jsonString = await rootBundle.loadString(file);

        final List<dynamic> jsonData = json.decode(jsonString);

        p.addAll(jsonData.map((item) => Product.fromJson(item)).toList());
      }

      // Update the observable list with the combined data
      products.value = p;
    } catch (e) {
      if (kDebugMode) {
        print('Error loading product recommendations: $e');
      }
    }
  }

  Future<void> loadProductRecomendations() async {
    try {
      // Ensure the products list is not empty
      if (products.isNotEmpty) {
        // Take the first 9 products from the products list
        productRecomendations.value = products.take(9).toList();
      } else {
        if (kDebugMode) {
          print('Products list is empty. Cannot load recommendations.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading product recommendations: $e');
      }
    }
  }

  Future<void> loadMainCategories() async {
    try {
      // Load the JSON file from assets
      final String jsonString = await rootBundle.loadString(
        'lib/data/main_category.json',
      );
      final List<dynamic> jsonData = json.decode(jsonString);
      // Convert JSON data to a list of Product objects
      mainCategories.value =
          jsonData.map((item) => MainCategory.fromJson(item)).toList();
    } catch (e) {
      if (kDebugMode) {
        print('Error loading mainCategories: $e');
      }
    }
  }

  Future<void> setSelectedProducts(List<String> productIds) async {
    // Ensure the products list is not empty
    if (products.isNotEmpty) {
      // Take the first 9 products from the products list
      selectedProducts.value =
          products.where((product) => productIds.contains(product.id)).toList();
    } else {
      if (kDebugMode) {
        print('Products list is empty. Cannot load recommendations.');
      }
    }
  }
}
