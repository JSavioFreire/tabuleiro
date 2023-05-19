import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:tabuleiro/db/sql_db.dart';
import 'package:http/http.dart' as http;
import 'package:tabuleiro/model/game_model.dart';

class HomeProvider extends ChangeNotifier {
  final dbHelper = DatabaseHelper();

  GameModel? gameModel;
  bool isLoadingInfos = true;
  List<Content> all = [];
  int page = 0;

  Future<bool> infoDb({required String token, required context}) async {
    page++;
    String url = 'http://206.189.206.44:8080/api/jogo?page=$page';

    final headers = {
      'Authorization': token,
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        gameModel = GameModel.fromJson(data);
        all.addAll(gameModel!.content!);

        isLoadingInfos = false;

        notifyListeners();
        return true;
      } else {
        AwesomeDialog(
          context: context,
          animType: AnimType.scale,
          dialogType: DialogType.error,
          body: const Center(
            child: Text(
              'Ocorreu um erro. Tente novamente mais tarde!',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          btnOkOnPress: () {},
        ).show();
        return false;
      }
    } catch (e) {
      AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        dialogType: DialogType.error,
        body: const Center(
          child: Text(
            'Ocorreu um erro. Tente novamente mais tarde!',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        btnOkOnPress: () {},
      ).show();
      return false;
    }
  }
}
