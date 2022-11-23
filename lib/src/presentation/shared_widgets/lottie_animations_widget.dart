import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';

class LottieAnimations {

  static Widget loading({
    double? height,
    double? width,
    bool isPrimary = true,
  }) {
    return SizedBox(
      height: height ?? 30,
      width: width ?? 30,
      child: Center(
        child: Transform.scale(
          scale: 2.5,
          child: Lottie.asset(
            isPrimary ? Assets.loadingPrimary : Assets.loadingSecondary,
            repeat: true,
          ),
        ),
      ),
    );
  }
}
