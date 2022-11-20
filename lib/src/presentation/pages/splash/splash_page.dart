import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/styles/text_styles.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Splash Page",
                style: Styles.headline6(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
