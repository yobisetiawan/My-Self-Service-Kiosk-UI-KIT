import 'package:flutter/material.dart';

class MainContentComponent extends StatelessWidget {
  final Widget content;

  const MainContentComponent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: double.infinity, child: content);
  }
}
