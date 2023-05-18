import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tabuleiro/db/sql_db.dart';
import 'package:http/http.dart' as http;
import 'package:tabuleiro/model/game_model.dart';

class HomeProvider extends ChangeNotifier {
  final dbHelper = DatabaseHelper();

  GameModel? gameModel;
  bool isLoadingInfos = true;

  Future<bool> infoDb({required String token}) async {
    const url = 'http://206.189.206.44:8080/api/jogo?page=1';
    final headers = {
      'Authorization': token,
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        gameModel = GameModel.fromJson(data);

        isLoadingInfos = false;

        notifyListeners();
        return true;
      } else {
        print('Erro de conexão');
        return false;
      }
    } catch (e) {
      print('Erro no banco de dados');
      return false;
    }
  }
}
