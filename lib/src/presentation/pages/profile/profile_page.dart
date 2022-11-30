import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/domain/model/achievement/achievement.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/profile/widgets/circular_medal_item.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/profile/widgets/medal_list_item.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/components/row_user_profile.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateless_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/custom_sliver_persistent_header.dart';
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
      Achievement(
        title: 'با احساس ترین',
        medalEnum: MedalEnum.gold,
        dateTime: DateTime.now().add(const Duration(days: 1)),
      ),
      Achievement(
        title: 'پرتلاش ترین',
        medalEnum: MedalEnum.silver,
        dateTime: DateTime.now(),
      ),
      Achievement(
        title: 'نتیجه گرا ترین',
        medalEnum: MedalEnum.bronze,
        dateTime: DateTime.now(),
      ),
      Achievement(
        title: 'پرتلاش ترین',
        medalEnum: MedalEnum.gold,
        dateTime: DateTime.now(),
      ),
      Achievement(
        title: 'با احساس ترین',
        medalEnum: MedalEnum.gold,
        dateTime: DateTime.now(),
      ),
      Achievement(
        title: 'پرتلاش ترین',
        medalEnum: MedalEnum.bronze,
        dateTime: DateTime.now(),
      ),
      Achievement(
        title: 'نتیجه گرا ترین',
        medalEnum: MedalEnum.silver,
        dateTime: DateTime.now(),
      ),
      Achievement(
        title: 'با احساس ترین',
        medalEnum: MedalEnum.bronze,
        dateTime: DateTime.now(),
      ),
      Achievement(
        title: 'با احساس ترین',
        medalEnum: MedalEnum.bronze,
        dateTime: DateTime.now(),
      ),
      Achievement(
        title: 'با احساس ترین',
        medalEnum: MedalEnum.bronze,
        dateTime: DateTime.now(),
      ),
      Achievement(
        title: 'با احساس ترین',
        medalEnum: MedalEnum.bronze,
        dateTime: DateTime.now(),
      ),
      Achievement(
        title: 'با احساس ترین',
        medalEnum: MedalEnum.bronze,
        dateTime: DateTime.now(),
      ),
    ];
    return ExtendedNestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverToBoxAdapter(
          child: Column(
            children: const [
              RowUserProfile(),
              SizedBox(height: 25),
            ],
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: CustomSliverPersistentHeader(
            maxHeight: 210,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget.bold(
                  context.getStrings.myMedals,
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
              ],
            ),
          ),
        ),
      ],
      pinnedHeaderSliverHeightBuilder: () => 210,
      body: ListView.builder(
        itemCount: medals.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return MedalListItem(
            index: index,
            achievement: medals[index],
          );
        },
      ),
    );
  }
}
