import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/settings_cubit/settings_cubit.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/settings_page/widgets/admin_settings_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/settings_page/widgets/user_settings_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateless_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class SettingsPage extends BaseStatelessWidget<SettingsCubit> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            TextWidget.bold(
              context.getStrings.settings,
              context: context,
              additionalStyle: const TextStyle(fontSize: 18),
            ),
            Row(
              children: const [
                Align(
                  alignment: Alignment.centerRight,
                  child: ImageLoaderWidget.fromNetwork(
                    imageUrl: "https://loremflickr.com/640/360",
                    boxShape: BoxShape.circle,
                    height: 40,
                    width: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                UserSettingsWidget(),
                AdminSettingsWidget(),
                SizedBox(
                  height: 74,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
