import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/controllers/cart_controller.dart';
import 'package:myapp/controllers/menu_app_controller.dart';
import 'package:myapp/controllers/product_controller.dart';
import 'lang/translations.dart';
import 'routes.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive); // fullscreen

  Get.put(MenuAppController());
  Get.put(ProductController());
  Get.put(CartController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      debugShowCheckedModeBanner: false,
      title: 'My Self Service Kiosk',
      initialRoute: AppRoutes.initial,
      getPages: AppPages.pages,
      translations: AppTranslations(),
      locale: Locale('id', 'ID'),
      fallbackLocale: Locale('en', 'US'),
    );
  }
}
