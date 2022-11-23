import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/lottie_animations_widget.dart';

class Loading extends StatelessWidget {
  final bool? primaryLoading;
  final double? width;
  final double? height;

  const Loading({
    Key? key,
    this.primaryLoading = false,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LottieAnimations.loading(
      isPrimary: primaryLoading ?? false,
      width: width,
      height: height,
    );
  }
}
