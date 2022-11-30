import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/domain/model/achievement/achievement.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/background_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class AchievementItemWidget extends StatelessWidget {
  final Achievement achievement;

  const AchievementItemWidget({
    Key? key,
    required this.achievement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      borderRadius: 8,
      height: 96,
      width: 96,
      horizontalPadding: 8,
      verticalPadding: 8,
      child: Column(
        children: [
          BackgroundWidget(
            backgroundColor: Theme.of(context).colorScheme.background,
            borderRadius: 8,
            height: 36,
            verticalPadding: 5,
            child: Row(
              children: [
                const ImageLoaderWidget.fromNetwork(
                  imageUrl: "https://loremflickr.com/640/360",
                  boxShape: BoxShape.circle,
                ),
                ImageLoaderWidget.fromAsset(
                  imageUrl: achievement.achievementAsset,
                )
              ],
            ),
          ),
          const Spacer(),
          TextWidget.bold(
            achievement.username ?? "اکبر رسولی",
            context: context,
            maxLines: 1,
            additionalStyle: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.tertiaryContainer),
          ),
          const SizedBox(
            height: 4,
          ),
          TextWidget.regular(
            achievement.username ?? "حرفه ای ترین ها",
            context: context,
            maxLines: 1,
            additionalStyle: TextStyle(
                fontSize: 10,
                color: Theme.of(context).colorScheme.tertiaryContainer),
          )
        ],
      ),
    );
  }
}
