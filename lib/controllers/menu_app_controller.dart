import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:myapp/data/menu.dart';

class MenuAppController extends GetxController {
  var menus = <MenuItem>[].obs;
  var selectedMenu = Rx<MenuItem?>(null);

  // Reactive variable to track the selected menu key
  var selectedMenuKey = 'home'.obs;

  // Function to update the selected menu

  void selectMenu(MenuItem menu) {
    selectedMenu.value = menu;
  }

  @override
  void onInit() {
    super.onInit();
    loadMenu();
  }

  Future<void> loadMenu() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'lib/data/main_menu.json',
      );
      final List<dynamic> jsonData = json.decode(jsonString);

      menus.value = jsonData.map((item) => MenuItem.fromJson(item)).toList();
    } catch (e) {
      if (kDebugMode) {
        print('Error loading menus: $e');
      }
    }
  }
}
