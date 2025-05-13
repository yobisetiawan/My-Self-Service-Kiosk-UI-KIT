import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/btn_component.dart';
import 'package:myapp/components/initial_load_component.dart';
import 'components/welcome_card_component.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return InitialLoadComponent(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centers vertically
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Centers horizontally
              children: [
                SizedBox(height: 50),
                SizedBox(
                  width: 500,
                  child: Text(
                    'home.title'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: WelcomeCardComponent(
                          imagePath: 'assets/images/icons/eat_here.jpeg',
                          title: 'home.eatHere'.tr,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: WelcomeCardComponent(
                          imagePath: 'assets/images/icons/take_away.jpeg',
                          title: 'home.takeAway'.tr,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 150),
                Text(
                  'home.languages'.tr,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BtnComponent(
                      text: 'Bahasa Indonesia',
                      variant: 'secondary',
                      onPressed: () {
                        Get.updateLocale(Locale('id', 'ID'));
                      },
                    ),
                    SizedBox(width: 20),
                    BtnComponent(
                      text: 'English',
                      variant: 'secondary',
                      onPressed: () {
                        Get.updateLocale(Locale('en', 'US'));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
