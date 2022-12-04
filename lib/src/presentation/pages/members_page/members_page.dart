import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/members_cubit/members_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/members_cubit/members_state.dart';
import 'package:nova_kudos_flutter/src/domain/model/user/user_model.dart';
import 'package:nova_kudos_flutter/src/presentation/config/routes.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/helper_functions.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/members_page/widgets/member_item_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/members_page/widgets/skeleton_loading.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/bottom_sheets/bottom_sheet_function.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/bottom_sheets/member_info_sheet.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/components/row_profile_header.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/dialogs/default_dialog_style.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/dialogs/dialog_function.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/background_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateful_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/custom_snackbars_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/icon_widget.dart';
import 'package:sprintf/sprintf.dart';

class MembersPage extends BaseStatefulWidget {
  const MembersPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MembersPageState();
}

class _MembersPageState
    extends BaseStatefulWidgetState<MembersPage, MembersCubit> {
  @override
  void initState() {
    super.initState();
    postFrameCallback(() {
      context.read<MembersCubit>().getMembers();
    });
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        RowProfileHeader(
          title: context.getStrings.members,
          action: IconWidget(
            icon: Assets.iconNotification,
            size: 24,
            borderColor: Theme.of(context).colorScheme.outline,
            hasBorder: true,
            padding: 10,
            boxShape: BoxShape.circle,
            onPressed: () {
              Navigator.pushNamed(context, Routes.notification);
            },
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: BlocConsumer<MembersCubit, MembersState>(
              listener: _listenToMembersCubit,
              buildWhen: _buildWhenMembersListView,
              builder: (context, state) {
                if (state is GetMembersState) {
                  return state.when(
                    loading: () => const MembersPageSkeletonLoading(),
                    success: (members) => BackgroundWidget(
                      backgroundColor:
                          Theme.of(context).colorScheme.onBackground,
                      borderRadius: 15,
                      child: ListView.separated(
                        itemBuilder: (context, index) => MemberItemWidget(
                          user: members[index],
                          onPress: () =>
                              _showMemberInfoBottomSheet(members[index]),
                          onLongPress: () {},
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => Divider(
                          color: Theme.of(context).colorScheme.outline,
                          height: 0,
                        ),
                        itemCount: members.length,
                      ),
                    ),
                    failed: (error) => const SizedBox(),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        )
      ],
    );
  }

  bool _buildWhenMembersListView(MembersState previous, MembersState current) {
    return current is GetMembersState;
  }

  void _listenToMembersCubit(BuildContext context, MembersState state) {
    if (state is DeleteMembersState) {
      state.when(
        loading: () {},
        success: () {
          context.dismissModal();
          KodusSnackBars.showSnackBar(
            snackType: SnackType.success,
            title: context.getStrings.memberDeletedSuccessfully,
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

  void _showMemberInfoBottomSheet(UserModel userModel) {
    showKodusBottomSheet(
      context,
      (_) => MemberInfoBottomSheet(
        userModel: userModel,
        onTapAdmin: () {},
        onTapDelete: () {
          Navigator.pop(context);
          showKodusDialog(
            context,
            (_) => DialogDefaultStyle(
              title: context.getStrings.deleteMember,
              acceptButtonText: context.getStrings.delete,
              question: sprintf(
                  context.getStrings.phDeleteMemberTitle, [userModel.name]),
              onAccept: () async {
                await context.read<MembersCubit>().deleteMember();
              },
              onReject: () {
                Navigator.pop(context);
              },
            ),
          );
        },
        onTapSendGift: () {},
      ),
    );
  }
}
