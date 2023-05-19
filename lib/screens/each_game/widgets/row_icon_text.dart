import 'package:flutter/material.dart';

class RowIconText extends StatelessWidget {
  final Icon icon;
  
  final String text;
  const RowIconText({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [icon, Text(text)],
    );
  }
}
