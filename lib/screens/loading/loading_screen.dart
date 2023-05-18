import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tabuleiro/global/widgets/my_scaffold.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        child: Center(
      child: LottieBuilder.asset('assets/loading.json'),
    ));
  }
}
