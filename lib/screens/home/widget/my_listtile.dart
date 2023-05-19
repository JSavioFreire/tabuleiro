import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabuleiro/model/game_model.dart';
import 'package:tabuleiro/provider/auth/auth_provider.dart';
import 'package:tabuleiro/provider/home/home_provider.dart';
import 'package:tabuleiro/screens/each_game/each_game_screen.dart';

class MyListTile extends StatelessWidget {
  final Content eachGame;
  const MyListTile({super.key, required this.eachGame});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          homeProvider.eachInfoDb(
              token: authProvider.responses.toString(),
              id: eachGame.id,
              context: context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EachGameScreen()),
          );
        },
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      eachGame.nome.toString(),
                      style: const TextStyle(
                          overflow: TextOverflow.clip,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(eachGame.ano.toString())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
