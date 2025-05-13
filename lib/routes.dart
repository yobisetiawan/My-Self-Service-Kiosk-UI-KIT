import 'package:get/get.dart';
import 'package:myapp/pages/initial/page.dart';
import 'package:myapp/pages/product_details/page.dart';
import 'pages/welcome/page.dart';
import 'pages/main/page.dart';

class AppRoutes {
  static const initial = '/';
  static const welcome = '/welcome';
  static const main = '/main';
  static const productDetails = '/productDetails';
}

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.initial, page: () => const InitialPage()),
    GetPage(name: AppRoutes.welcome, page: () => const WelcomePage()),
    GetPage(name: AppRoutes.main, page: () => const MainPage()),
    GetPage(
      name: AppRoutes.productDetails,
      page: () => const ProductDetailsPage(),
    ),
  ];
}
