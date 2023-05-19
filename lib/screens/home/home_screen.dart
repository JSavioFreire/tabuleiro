import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tabuleiro/global/widgets/my_scaffold.dart';
import 'package:tabuleiro/provider/auth/auth_provider.dart';
import 'package:tabuleiro/provider/home/home_provider.dart';
import 'package:tabuleiro/screens/home/widget/my_listtile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);

    return MyScaffold(
        color: Colors.white,
        appBar: AppBar(
          title: const Text('Jogos'),
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
                      authProvider.logout();
                    },
                  ).show();
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        child: Column(
          children: [
            homeProvider.isLoadingInfos
                ? Center(child: LottieBuilder.asset('assets/loading.json'))
                : Expanded(
                    child: ListView.builder(
                        itemCount: homeProvider.all.length + 1,
                        itemBuilder: (context, index) => index ==
                                homeProvider.all.length
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 20, right: 15, left: 15),
                                child: ElevatedButton(
                                    onPressed: () {
                                      homeProvider.infoDb(
                                          token:
                                              authProvider.responses.toString(),
                                          context: context);
                                    },
                                    child: const Text(
                                      'Mostrar mais',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              )
                            : MyListTile(eachGame: homeProvider.all[index])))
          ],
        ));
  }
}
