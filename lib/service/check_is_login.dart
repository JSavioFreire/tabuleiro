import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabuleiro/provider/auth/auth_provider.dart';
import 'package:tabuleiro/screens/auth/auth_screen.dart';
import 'package:tabuleiro/screens/home/home_screen.dart';
import 'package:tabuleiro/screens/loading/loading_screen.dart';

class CheckIsLogin extends StatelessWidget {
  const CheckIsLogin({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    if (authProvider.isLoadingAuth) {
      return const LoadingScreen();
    } else {
      if (authProvider.responses == null) {
        return const AuthScreen();
      } else {
        return const HomeScreen();
      }
    }
  }
}
