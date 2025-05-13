import 'package:flutter/material.dart';

class WelcomeCardComponent extends StatelessWidget {
  final String title; // Add a title property
  final String imagePath; // Add an imagePath property
  final void Function()? onTap;

  const WelcomeCardComponent({
    super.key,
    required this.title, // Mark as required
    required this.imagePath, // Mark as required
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 400,
          padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(0xFFDDDDDD), width: 1),
          ),
          child: Column(
            children: [
              Center(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  10,
                ), // Adjust the radius as needed
                child: Image.asset(
                  imagePath,
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.antiAlias,
            child: InkWell(onTap: onTap),
          ),
        ),
      ],
    );
  }
}
