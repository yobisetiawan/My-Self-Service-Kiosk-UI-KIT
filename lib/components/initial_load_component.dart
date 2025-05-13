import 'package:flutter/material.dart';

class InitialLoadComponent extends StatefulWidget {
  final Widget child; // The child widget to render after loading

  const InitialLoadComponent({super.key, required this.child});

  @override
  State<InitialLoadComponent> createState() => _InitialLoadComponentState();
}

class _InitialLoadComponentState extends State<InitialLoadComponent> {
  bool _isLoading = true; // Tracks whether to show the loading indicator

  @override
  void initState() {
    super.initState();
    // Delay for 1 second before rendering the child
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isLoading = false; // Stop loading and show the child
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(),
            ), // Loading indicator
          ),
        )
        : widget.child; // Render the child after loading
  }
}
