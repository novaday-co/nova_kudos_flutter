import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/home_cubit/home_cubit.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/home_page/widgets/balance_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/home_page/widgets/home_header_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/home_page/widgets/recent_achievement_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateless_widget.dart';

// class HomePage extends BaseStatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState
//     extends BaseStatefulWidgetState<HomePage, HomeCubit> {
//
//   @override
//   Widget body(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//
//         ],
//       ),
//     );
//   }
//
// }

class HomePage extends BaseStatelessWidget<HomeCubit> {
  const HomePage({Key? key}) : super(key: key, includeHorizontalPadding: false);

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        const HomeHeaderWidget(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                SizedBox(
                  height: 32,
                ),
                HomeBalanceWidget(),
                SizedBox(
                  height: 24,
                ),
                RecentAchievementWidget()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
