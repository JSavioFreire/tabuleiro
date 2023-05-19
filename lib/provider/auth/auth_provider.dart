import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:tabuleiro/db/sql_db.dart';
import 'package:tabuleiro/provider/home/home_provider.dart';

class AuthProvider extends ChangeNotifier {
  BuildContext context;
  AuthProvider({required this.context}) {
    getToken(context: context);
  }

  late HomeProvider homeProvider =
      Provider.of<HomeProvider>(context, listen: false);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? responses;
  bool isLoadingAuth = true;
  final dbHelper = DatabaseHelper();

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

  logout() async {
    await dbHelper.deleteToken();
    responses = null;
    notifyListeners();
  }

  getToken({required context}) async {
    final token = await dbHelper.getToken();
    responses = token;
    if (responses != null) {
      homeProvider.infoDb(token: responses.toString(), context: context);
    }
    isLoadingAuth = false;
    notifyListeners();
  }

  Future<bool> login(
      {required String email,
      required String password,
      required context}) async {
    const url = 'http://206.189.206.44:8080/login';
    final body = json.encode({'email': email, 'senha': password});

    try {
      final response = await http.post(Uri.parse(url), body: body);

      if (response.statusCode == 200) {
        btnController.success();
        await dbHelper.saveToken(response.body.toString());
        getToken(context: context);
        notifyListeners();
        return true;
      } else {
        btnController.error();
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email ou senha incorreto!')));
        return false;
      }
    } catch (e) {
      btnController.error();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Erro de conexão!')));
      return false;
    }
  }
}
