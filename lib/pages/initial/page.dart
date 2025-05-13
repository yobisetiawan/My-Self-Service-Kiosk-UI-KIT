import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/btn_component.dart';
import 'package:myapp/components/image_network_component.dart';
import 'package:myapp/components/initial_load_component.dart';
import 'package:myapp/configs/app_color.dart';
import 'package:myapp/routes.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InitialLoadComponent(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Centers vertically
            crossAxisAlignment: CrossAxisAlignment.start, // Centers horizontally
            children: [
              SizedBox(
                width: double.infinity,
      
                child: ImageNetworkComponent(
                  url:
                      'https://scontent.fcgk32-1.fna.fbcdn.net/v/t39.30808-6/495185928_1100795128749530_1576850121694493096_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=127cfc&_nc_ohc=O2Adcfy1lvgQ7kNvwFAeTlc&_nc_oc=AdnnyXaAEuB0osNpBHVmTh9z8wjJlBXYl2bb2Q3t72sevzCJZm92Pnnra5qUJ92Pu_o&_nc_zt=23&_nc_ht=scontent.fcgk32-1.fna&_nc_gid=jK2-Sxoo6IsgzConIIk24g&oh=00_AfIurB2JjIV0UwB1NZrvsQwP_x-EK5Vc7pLOY01Xx1UfWQ&oe=6827BB52',
                ),
              ),
              Spacer(),
      
              Container(
                color: AppColor.primary,
                width: double.infinity,
                height: 80,
                margin: EdgeInsets.all(30),
                child: BtnComponent(
                  text: 'Mulai Pesananan',
                  onPressed: () {
                    Get.toNamed(AppRoutes.welcome);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
