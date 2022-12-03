import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/home_cubit/home_cubit.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/components/row_balance_component.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/home_page/widgets/home_header_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/home_page/widgets/achievements_listview_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/home_page/widgets/pulls_listview_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/home_page/widgets/voluntary_events_listview.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateless_widget.dart';

class HomePage extends BaseStatelessWidget<HomeCubit> {
  const HomePage({Key? key})
      : super(
          key: key,
          includeHorizontalPadding: false,
          includeVerticalPadding: false,
        );

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: HomeHeaderWidget(),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: RowBalanceComponent(),
                ),
                SizedBox(
                  height: 24,
                ),
                RecentAchievementWidget(),
                SizedBox(
                  height: 20,
                ),
                HomePullsListViewWidget(),
                SizedBox(
                  height: 20,
                ),
                HomeVoluntaryEventsListview(),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 74,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
