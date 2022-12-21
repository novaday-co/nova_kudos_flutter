import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/settings_cubit/settings_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/settings_cubit/settings_state.dart';
import 'package:nova_kudos_flutter/src/presentation/config/routes.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/dart_extension.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/settings_page/widgets/admin_settings_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/settings_page/widgets/user_settings_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/components/row_profile_header.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateless_widget.dart';

class SettingsPage extends BaseStatelessWidget<SettingsCubit> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: _listenToSettingsState,
      listenWhen: _listenWhenToSettingsState,
      child: Column(
        children: [
          RowProfileHeader(
            title: context.getStrings.settings,
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
      ),
    );
  }

  bool _listenWhenToSettingsState(
      SettingsState previous, SettingsState current) {
    return current is LogoutSettingsState;
  }

  void _listenToSettingsState(BuildContext context, SettingsState state) {
    state.isA<LogoutSettingsState>()?.when(
          loading: () {},
          success: () => Navigator.pushNamedAndRemoveUntil(
              context, Routes.splash, (route) => false),
        );
  }
}
