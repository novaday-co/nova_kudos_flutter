import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/pulls_list_cubit/pulls_list_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/pulls_list_cubit/pulls_list_state.dart';
import 'package:nova_kudos_flutter/src/domain/model/pull/pull.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/helper_functions.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/home_page/widgets/pull_item_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/pulls_list_page/widgets/skeleton_loading.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/dialogs/default_dialog_style.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/dialogs/dialog_function.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateful_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/custom_snackbars_widget.dart';

class PullsListPage extends BaseStatefulWidget {
  const PullsListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PullsListPageState();
}

class _PullsListPageState
    extends BaseStatefulWidgetState<PullsListPage, PullsListCubit> {
  @override
  void initState() {
    super.initState();
    postFrameCallback(() {
      cubit.getPullsList();
    });
  }

  @override
  CustomAppbar? appBar(BuildContext context) {
    return CustomAppbar(
      hasBackButton: true,
      title: context.getStrings.transactions,
      onPressBack: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget body(BuildContext context) {
    return BlocConsumer<PullsListCubit, PullsListState>(
      listener: _listenToPullsList,
      listenWhen: _listenWhenToPullsList,
      buildWhen: _buildWhenPullsList,
      builder: (context, state) {
        if (state is GetPullsListState) {
          return state.when(
            loading: () => const PullsListSkeletonLoading(),
            success: (pulls) => SingleChildScrollView(
              child: ListView.separated(
                itemBuilder: (context, index) => PullItemWidget(
                  pull: pulls[index],
                  backgroundColor: Theme.of(context).colorScheme.onBackground,
                  index: index,
                  onEnd: () {},
                  enableAction: true,
                  onDelete: () {
                    _showDeletePullDialog(pulls[index]);
                  },
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 8,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pulls.length,
              ),
            ),
            failed: (error) => const SizedBox(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  bool _buildWhenPullsList(PullsListState previous, PullsListState current) {
    return current is GetPullsListState;
  }

  bool _listenWhenToPullsList(PullsListState previous, PullsListState current) {
    return current is DeletePullsListItemState;
  }

  void _listenToPullsList(BuildContext context, PullsListState state) {
    if (state is DeletePullsListItemState) {
      state.when(
        loading: () {},
        success: () {
          context.dismissModal();
          KodusSnackBars.showSnackBar(
            snackType: SnackType.success,
            title: "نظرسنجی با موفقیت حذف شد.",
            context: context,
          );
        },
        failed: (error) {
          KodusSnackBars.showSnackBar(
            snackType: SnackType.failure,
            title: error ?? "",
            context: context,
          );
        },
      );
    }
  }

  void _showDeletePullDialog(PullModel pull) {
    showKodusDialog(
      context,
      (context) => DialogDefaultStyle(
        title: "حذف نظرسنجی",
        question: "آیا از حذف کردن این نظرسنجی اطمینان دارید؟",
        acceptButtonText: context.getStrings.delete,
        onAccept: () async {
          await cubit.deletePull(pull);
        },
        onReject: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
