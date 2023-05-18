import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  final Widget child;
  final Color? color;
  const MyScaffold({super.key, required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      backgroundColor: color,
    );
  }
}
