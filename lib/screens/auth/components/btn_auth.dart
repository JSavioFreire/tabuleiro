import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:tabuleiro/provider/auth_provider.dart';

class BtnAuth extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const BtnAuth({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 100),
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: RoundedLoadingButton(
              controller: authProvider.btnController,
              onPressed: () {
                authProvider.resetBtn();
                if (formKey.currentState!.validate()) {
                  authProvider.login(
                      email: authProvider.emailController.text,
                      password: authProvider.passwordController.text);
                } else {
                  authProvider.errorBtn();
                }
              },
              child: const Text(
                'Entrar',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ))),
    );
  }
}
