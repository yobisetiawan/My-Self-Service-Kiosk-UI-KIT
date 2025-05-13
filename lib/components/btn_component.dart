import 'package:flutter/material.dart';
import 'package:myapp/configs/app_color.dart';

class BtnComponent extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final String? variant;

  const BtnComponent({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = 'primary',
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: variant == 'primary' ? AppColor.primary : Colors.white,
        fixedSize: Size(200, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
