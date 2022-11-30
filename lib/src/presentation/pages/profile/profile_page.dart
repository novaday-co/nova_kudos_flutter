import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/domain/model/achievement/achievement.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/profile/widgets/circular_medal_item.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/profile/widgets/medal_list_item.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/components/row_user_profile.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateless_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class ProfilePage extends BaseStatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  CustomAppbar? appBar(BuildContext context) {
    return const CustomAppbar(
      title: 'پروفایل',
      hasBackButton: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    List medals = [
      Achievement(title: 'با احساس ترین',medalEnum: MedalEnum.gold,dateTime: DateTime.now()),
      Achievement(title: 'با احساس ترین',medalEnum: MedalEnum.silver,dateTime: DateTime.now()),
      Achievement(title: 'با احساس ترین',medalEnum: MedalEnum.bronze,dateTime: DateTime.now()),
      Achievement(title: 'با احساس ترین',medalEnum: MedalEnum.gold,dateTime: DateTime.now()),
      Achievement(title: 'با احساس ترین',medalEnum: MedalEnum.gold,dateTime: DateTime.now()),
      Achievement(title: 'با احساس ترین',medalEnum: MedalEnum.bronze,dateTime: DateTime.now()),
      Achievement(title: 'با احساس ترین',medalEnum: MedalEnum.silver,dateTime: DateTime.now()),
      Achievement(title: 'با احساس ترین',medalEnum: MedalEnum.bronze,dateTime: DateTime.now()),


    ];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RowUserProfile(),
          const SizedBox(height: 25),
          TextWidget.bold(
            'مدال های من',
            context: context,
            additionalStyle: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CircularMedalItem(
                medalEnum: MedalEnum.gold,
                score: 20,
              ),
              CircularMedalItem(
                medalEnum: MedalEnum.silver,
                score: 10,
              ),
              CircularMedalItem(
                medalEnum: MedalEnum.bronze,
                score: 5,
              ),
            ],
          ),
          const SizedBox(height: 24),
          ListView.builder(
            itemCount: 18,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return MedalListItem(
                index: index,
                medalEnum: MedalEnum.gold,
              );
            },
          )
        ],
      ),
    );
  }
}
