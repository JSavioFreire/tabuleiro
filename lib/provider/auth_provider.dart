import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rounded_loading_button/rounded_loading_button.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? responses;

  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  bool iconVisibility = true;

  void changeToVisibility() {
    iconVisibility = !iconVisibility;
    notifyListeners();
  }

  void resetBtn() async {
    Timer(const Duration(seconds: 2), () {
      btnController.stop();
    });
  }

  void errorBtn() {
    btnController.error();
  }

  Future<bool> login({required String email, required String password}) async {
    const url = 'http://206.189.206.44:8080/login';
    final body = json.encode({'email': email, 'senha': password});

    try {
      final response = await http.post(Uri.parse(url), body: body);

      if (response.statusCode == 200) {
        btnController.success();
        responses = response.body;
        notifyListeners();
        // Lógica para lidar com a resposta do servidor em caso de login bem-sucedido
        return true;
      } else {
        btnController.error();
        print('senha e email errado');

        // Lógica para lidar com a resposta do servidor em caso de login mal-sucedido
        return false;
      }
    } catch (e) {
      btnController.error();

      print('erro de servidor');

      // Lógica para lidar com erros de conexão ou outras exceções
      return false;
    }
  }
}
