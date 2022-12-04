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
            isPrimary ? Assets.lottieLoadingPrimary : Assets.lottieLoadingSecondary,
            repeat: true,
          ),
        ),
      ),
    );
  }

  static Widget customLottie({
    required String lottieAsset,
    double? height,
    double? width,
    double? scale,
    bool repeat = false,
  }) {
    return SizedBox(
      height: height ?? 40,
      width: width ?? 40,
      child: Center(
        child: Transform.scale(
          scale: scale,
          child: Lottie.asset(
            lottieAsset,
            repeat: repeat,
          ),
        ),
      ),
    );
  }

}
