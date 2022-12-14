import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/settings_cubit/settings_cubit.dart';
import 'package:nova_kudos_flutter/src/presentation/config/routes.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/complete_profile/params/complete_profile_params.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/settings_page/widgets/settings_item_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/dialogs/default_dialog_style.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/dialogs/dialog_function.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/background_widget.dart';

class UserSettingsWidget extends StatelessWidget {
  const UserSettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BackgroundWidget(
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          borderRadius: 16,
          child: Column(
            children: [
              SettingsItemWidget(
                title: context.getStrings.editProfile,
                icon: Assets.iconProfile,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.completeProfile,
                    arguments: CompleteProfilePageParams(
                      phoneNumber: "09024377152",
                      isEdit: true,
                    ),
                  );
                },
              ),
              Divider(
                color: Theme.of(context).colorScheme.outline,
                height: 0,
              ),
              SettingsItemWidget(
                title: context.getStrings.novadayCompany,
                icon: Assets.iconCompany,
                onTap: () {},
              ),
              Divider(
                color: Theme.of(context).colorScheme.outline,
                height: 0,
              ),
              SettingsItemWidget(
                title: context.getStrings.transactions,
                icon: Assets.iconTransaction,
                onTap: () {
                  Navigator.pushNamed(context, Routes.transactionsPage);
                },
              ),
              Divider(
                color: Theme.of(context).colorScheme.outline,
                height: 0,
              ),
              SettingsItemWidget(
                title: context.getStrings.depositRequest,
                icon: Assets.iconDeposit,
                onTap: () {},
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 48,
        ),
        BackgroundWidget(
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          borderRadius: 16,
          child: Column(
            children: [
              SettingsItemWidget(
                title: context.getStrings.logout,
                icon: Assets.iconLogout,
                textColor: Theme.of(context).colorScheme.error,
                iconColor: Theme.of(context).colorScheme.error,
                onTap: () {
                  showKodusDialog(
                    context,
                    (_) => DialogDefaultStyle(
                      title: context.getStrings.logOutFromAccount,
                      question: context.getStrings.sureYouWantToLogout,
                      onAccept: () async {
                        await context.read<SettingsCubit>().logout(context);
                      },
                      onReject: () {
                        Navigator.pop(context);
                      },
                      acceptButtonText: context.getStrings.exit,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
