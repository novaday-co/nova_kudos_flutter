import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/config/routes.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/background_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

import 'settings_item_widget.dart';

class AdminSettingsWidget extends StatelessWidget {
  const AdminSettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 24,
        ),
        TextWidget.medium(
          context.getStrings.managerMenu,
          context: context,
          additionalStyle: const TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        BackgroundWidget(
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          borderRadius: 16,
          child: Column(
            children: [
              SettingsItemWidget(
                title: context.getStrings.editCompany,
                icon: Assets.iconCompany,
                onTap: () {},
              ),
              Divider(
                color: Theme.of(context).colorScheme.outline,
                height: 0,
              ),
              SettingsItemWidget(
                title: context.getStrings.manageUsers,
                icon: Assets.iconMembers,
                onTap: () {},
              ),
              Divider(
                color: Theme.of(context).colorScheme.outline,
                height: 0,
              ),
              SettingsItemWidget(
                title: context.getStrings.manageShop,
                icon: Assets.iconShop,
                onTap: () {},
              ),
              Divider(
                color: Theme.of(context).colorScheme.outline,
                height: 0,
              ),
              SettingsItemWidget(
                title: context.getStrings.manageGiftCards,
                icon: Assets.iconGiftCard,
                onTap: () {},
              ),
              Divider(
                color: Theme.of(context).colorScheme.outline,
                height: 0,
              ),
              SettingsItemWidget(
                title: context.getStrings.usersTransactions,
                icon: Assets.iconTransaction,
                onTap: () {},
              ),
              Divider(
                color: Theme.of(context).colorScheme.outline,
                height: 0,
              ),
              SettingsItemWidget(
                title: context.getStrings.manageCoinFee,
                icon: Assets.iconCoin,
                onTap: () {},
              ),
              Divider(
                color: Theme.of(context).colorScheme.outline,
                height: 0,
              ),
              SettingsItemWidget(
                title: context.getStrings.manageEvents,
                icon: Assets.iconEvents,
                onTap: () {
                  Navigator.pushNamed(context, Routes.eventsListPage);
                },
              ),
              Divider(
                color: Theme.of(context).colorScheme.outline,
                height: 0,
              ),
              SettingsItemWidget(
                title: context.getStrings.deleteCompany,
                icon: Assets.iconTrash,
                onTap: () {},
                textColor: Theme.of(context).colorScheme.error,
                iconColor: Theme.of(context).colorScheme.error,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
