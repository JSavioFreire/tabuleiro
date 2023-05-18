import 'package:flutter/material.dart';
import 'package:tabuleiro/model/game_model.dart';

class MyListTile extends StatelessWidget {
  final Content eachGame;
  const MyListTile({super.key, required this.eachGame});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              height: 100,
              child: Image.network(eachGame.urlCapa.toString())),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eachGame.nome.toString(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(eachGame.ano.toString())
              ],
            ),
          )
        ],
      ),
    );
  }
}
