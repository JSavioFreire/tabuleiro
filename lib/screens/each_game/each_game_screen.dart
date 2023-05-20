import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabuleiro/global/widgets/my_scaffold.dart';
import 'package:tabuleiro/provider/auth/auth_provider.dart';
import 'package:tabuleiro/provider/home/home_provider.dart';
import 'package:tabuleiro/screens/each_game/components/box_info.dart';
import 'package:tabuleiro/screens/each_game/widgets/row_icon_text.dart';
import 'package:tabuleiro/screens/loading/loading_screen.dart';

class EachGameScreen extends StatelessWidget {
  const EachGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);

    if (homeProvider.eachGame == null) {
      return const LoadingScreen();
    } else {
      return MyScaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            actions: [
              IconButton(
                  onPressed: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.scale,
                      dialogType: DialogType.question,
                      headerAnimationLoop: false,
                      title: 'Tem certeza que deseja sair?',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {
                        Navigator.pop(context);
                        authProvider.logout();
                      },
                    ).show();
                  },
                  icon: const Icon(Icons.logout))
            ],
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                            homeProvider.eachGame!.urlCapa.toString()),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                homeProvider.eachGame!.nome.toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              RowIconText(
                                  icon: const Icon(
                                    Icons.calendar_month,
                                    color: Colors.black,
                                  ),
                                  text: homeProvider.eachGame!.ano.toString()),
                              RowIconText(
                                  icon: const Icon(
                                    Icons.people,
                                    color: Colors.black,
                                  ),
                                  text:
                                      '${homeProvider.eachGame!.minimoJogadores.toString()} - ${homeProvider.eachGame!.maximoJogadores.toString()}'),
                              RowIconText(
                                  icon: const Icon(
                                    Icons.timer_sharp,
                                    color: Colors.black,
                                  ),
                                  text:
                                      '${homeProvider.eachGame!.duracaoMedia}')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  BoxInfos(
                      title: 'Descrição do jogo:',
                      info: Text(homeProvider.eachGame!.descricao.toString())),
                  BoxInfos(
                      title: 'Mecânicas',
                      info: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (var i
                                  in homeProvider.eachGame!.caracteristicas!)
                                if (i.tipo == 'MECANICA')
                                  Text(i.descricao.toString())
                            ],
                          ),
                        ],
                      )),
                  if (homeProvider.eachGame!.expansao == true)
                    const Text('Este é um jogo do tipo expansão!')
                  else
                    const Text('Este não é um jogo do tipo expansão!')
                ],
              ),
            ),
          ));
    }
  }
}
