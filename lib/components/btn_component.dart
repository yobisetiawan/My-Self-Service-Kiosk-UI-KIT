import 'package:flutter/material.dart';
import 'package:myapp/configs/app_color.dart';

class BtnComponent extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final String? variant;
  final Size? size;

  const BtnComponent({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = 'primary',
    this.size = const Size(200, 50),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: variant == 'primary' ? AppColor.primary : Colors.white,
        fixedSize: size,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(
            color: const Color(0xFFDDDDDD), // Light gray border (#DDD)
            width: 1, // Border width
          ),
        ),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
