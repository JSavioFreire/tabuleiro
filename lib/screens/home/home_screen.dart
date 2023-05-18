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
                  authProvider.logout();
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
                        itemCount: homeProvider.gameModel!.content!.length,
                        itemBuilder: (context, index) => MyListTile(
                            eachGame: homeProvider.gameModel!.content![index])))
          ],
        ));
  }
}
