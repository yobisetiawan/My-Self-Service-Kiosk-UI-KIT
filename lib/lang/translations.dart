import 'package:get/get.dart';
import 'package:myapp/lang/en_US.dart';
import 'package:myapp/lang/id_ID.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'id_ID': idID,
      };
}