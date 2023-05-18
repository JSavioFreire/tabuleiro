import 'package:flutter/material.dart';
import 'package:tabuleiro/global/style/style_text.dart';

class TitleAuth extends StatelessWidget {
  const TitleAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Login',
          style: Style().title,
        ),
        const Text('Por favor, faça o login para continuar!')
      ],
    );
  }
}
