import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/lottie_animations_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

enum SnackType { failure, success, normal }

class KodusSnackBars {
  static showSnackBar({
    required SnackType snackType,
    required String title,
    required BuildContext context,
  }) {
    BotToast.showCustomNotification(
      toastBuilder: (cancelFunc) => _snackBarWidget(context, snackType, title),
      duration: const Duration(seconds: 2)
    );
  }

  static Widget _snackBarWidget(
      BuildContext context, SnackType snackType, String title) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: snackTypeColor(context, snackType),
        ),
      ),
      child: Container(
        color: snackTypeColor(context, snackType).withOpacity(0.1),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Row(
          children: [
            LottieAnimations.customLottie(
                lottieAsset: snackTypeAsset(snackType,),
                height: 30,
                width: 30,
                scale: 2.5
            ),
            const SizedBox(width: 16,),
            Expanded(
              child: TextWidget.medium(
                title,
                context: context,
                additionalStyle: TextStyle(
                  fontSize: 14,
                  color: snackTypeColor(context, snackType),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  static String snackTypeAsset(SnackType snackType) {
    switch (snackType) {
      case SnackType.success:
        return Assets.lottieSuccess;
      default:
        return Assets.lottieFailed;
    }
  }

  static Color snackTypeColor(BuildContext context, SnackType snackType) {
    switch (snackType) {
      case SnackType.success:
        return Theme.of(context).colorScheme.surfaceVariant;
      default:
        return Theme.of(context).colorScheme.primary;
    }
  }
}
