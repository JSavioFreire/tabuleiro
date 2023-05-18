import 'package:flutter/material.dart';
import 'package:tabuleiro/global/widgets/my_scaffold.dart';
import 'package:tabuleiro/screens/auth/components/btn_auth.dart';
import 'package:tabuleiro/screens/auth/components/form.dart';
import 'package:tabuleiro/screens/auth/components/title_auth.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return MyScaffold(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleAuth(),
            const FormAuth(),
            BtnAuth(
              formKey: formKey,
            )
          ],
        ),
      ),
    ));
  }
}
