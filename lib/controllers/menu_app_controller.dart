import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:myapp/data/menu.dart';

class MenuAppController extends GetxController {
  var menus = <MenuItem>[].obs;

  // Reactive variable to track the selected menu key
  var selectedMenuKey = 'home'.obs;

  // Function to update the selected menu
  void selectMenu(String key) {
    selectedMenuKey.value = key;
  }

  @override
  void onInit() {
    super.onInit();
    loadMenu();
  }

  Future<void> loadMenu() async {
    try {
      // Load the JSON file from assets
      final String jsonString = await rootBundle.loadString(
        'lib/data/main_menu.json',
      );
      final List<dynamic> jsonData = json.decode(jsonString);
      // Convert JSON data to a list of Product objects
      menus.value = jsonData.map((item) => MenuItem.fromJson(item)).toList();
 
    } catch (e) {
      if (kDebugMode) {
        print('Error loading menus: $e');
      }
    }
  }
}
