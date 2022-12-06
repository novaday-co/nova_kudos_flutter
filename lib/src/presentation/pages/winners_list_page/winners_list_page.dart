import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/winners_list_cubit/winners_list_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/winners_list_cubit/winners_list_state.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/helper_functions.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/winners_list_page/widgets/winners_list_item_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/winners_list_page/widgets/winners_list_page_skeleton.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateful_widget.dart';
import 'package:sprintf/sprintf.dart';

class WinnersListPage extends BaseStatefulWidget {
  const WinnersListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WinnersListPageState();
}

class _WinnersListPageState
    extends BaseStatefulWidgetState<WinnersListPage, WinnersListCubit> {
  @override
  CustomAppbar? appBar(BuildContext context) {
    return CustomAppbar(
      hasBackButton: true,
      title: sprintf(context.getStrings.phTheBestOfMonth, ["مهر"]),
      onPressBack: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  void initState() {
    postFrameCallback(() {
      cubit.getWinners();
    });
    super.initState();
  }

  @override
  Widget body(BuildContext context) {
    return BlocBuilder<WinnersListCubit, WinnersListState>(
      builder: (context, state) {
        if (state is GetWinnersRequestState) {
          return state.when(
            loading: () => const WinnersListPageSkeleton(),
            success: () => ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => const WinnersListItemWidget(),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: 6,
            ),
            failed: (error) => const SizedBox.shrink(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
