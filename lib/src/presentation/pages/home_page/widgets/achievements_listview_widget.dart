import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/domain/model/achievement/achievement.dart';
import 'package:nova_kudos_flutter/src/presentation/config/routes.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/home_page/widgets/achievement_item_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class RecentAchievementWidget extends StatelessWidget {
  const RecentAchievementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                child: TextWidget.semiBold(
                  context.getStrings.recentAchievement,
                  context: context,
                  additionalStyle: const TextStyle(fontSize: 16),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.winnersListPage);
                },
                child: TextWidget.regular(
                  context.getStrings.seeAll,
                  context: context,
                  additionalStyle: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 110,
          child: ListView.separated(
            itemBuilder: (context, index) => AchievementItemWidget(
              achievement: Achievement(),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 8,
            ),
            itemCount: 6,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
