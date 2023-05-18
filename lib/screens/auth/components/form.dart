import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabuleiro/global/widgets/my_textformfield.dart';
import 'package:tabuleiro/provider/auth/auth_provider.dart';

class FormAuth extends StatelessWidget {
  const FormAuth({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Column(
      children: [
        MyTextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo vazio. Digite seu email!';
              } else if (value.contains('@') && value.contains('.com')) {
                return null;
              } else {
                return 'Digite um email válido!';
              }
            },
            icon: const Icon(Icons.person),
            hint: 'Email',
            controller: authProvider.emailController,
            keyboard: TextInputType.emailAddress),
        MyTextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo vazio. Digite uma senha';
              } else if (value.length < 6) {
                return 'Senha incorreta, sua senha deve ter no mínimo 6 caracteres';
              } else {
                return null;
              }
            },
            icon: const Icon(Icons.password),
            hint: 'Senha',
            controller: authProvider.passwordController,
            keyboard: TextInputType.visiblePassword),
      ],
    );
  }
}
