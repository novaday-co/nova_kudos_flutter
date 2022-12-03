import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/profile/profile_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/profile/profile_state.dart';
import 'package:nova_kudos_flutter/src/domain/model/achievement/achievement.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/helper_functions.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/profile/widgets/circular_medal_item.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/profile/widgets/medal_list_item.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/profile/widgets/profile_page_skeleton.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/components/row_user_profile.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateful_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/custom_sliver_persistent_header.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class ProfilePage extends BaseStatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState
    extends BaseStatefulWidgetState<ProfilePage, ProfileCubit> {
  @override
  CustomAppbar? appBar(BuildContext context) {
    return CustomAppbar(
      title: context.getStrings.profile,
      hasBackButton: true,
    );
  }

  @override
  void initState() {
    postFrameCallback(() {
      context.read<ProfileCubit>().getProfileMedal();
    });
    super.initState();
  }

  @override
  Widget body(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: _buildWhenProfileRequest,
      builder: (context, state) {
        if (state is GetProfileRequestState) {
          return state.when(
              loading: () => const ProfilePageSkeleton(),
              success: (achievement) => ExtendedNestedScrollView(
                    pinnedHeaderSliverHeightBuilder: () => 210,
                    headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      SliverToBoxAdapter(
                        child: Column(
                          children: const [
                            RowUserProfile(
                              imageUrl: "https://loremflickr.com/640/360",
                              name: "سارا تهرانی",
                              jobTitle: "برنامه نویس موبایل",
                            ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                    body: ListView.separated(
                      itemCount: achievement.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return MedalListItem(
                          index: index,
                          achievement: achievement[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(height: 4),
                    ),
                  ),
              failed: (error) => const SizedBox.shrink());
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  ///region Bloc When Conditions Functions

  bool _buildWhenProfileRequest(ProfileState previous, ProfileState current) {
    return current is GetProfileRequestState;
  }

  ///endregion
}
