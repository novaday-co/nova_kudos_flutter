import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/splash_cubit/splash_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/splash_cubit/splash_state.dart';
import 'package:nova_kudos_flutter/src/presentation/config/routes.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/dart_extension.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateless_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/icon_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/loading_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class SplashPage extends BaseStatelessWidget<SplashCubit> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  CustomAppbar? appBar(BuildContext context) {
    return CustomAppbar(
      statusBarColor: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  @override
  void onBuild(BuildContext context) {
    context.read<SplashCubit>().checkUserToken();
  }

  @override
  Color? backgroundColor(context) => Theme.of(context).primaryColor;

  @override
  Widget body(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: _listenToUserAuthentication,
      listenWhen: _listenWhenToSplashState,
      child: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconWidget(
                    icon: Assets.appLogo,
                    size: 30,
                    padding: 12,
                    iconColor: Theme.of(context).colorScheme.background,
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .background
                        .withOpacity(0.1),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextWidget.bold(
                    context.getStrings.appName,
                    context: context,
                    additionalStyle: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Loading(
                    primaryLoading: false,
                  ),
                ],
              ),
            ),
            FutureBuilder<String>(
              future: context.read<SplashCubit>().getAppVersion(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return TextWidget.bold(
                    "${context.getStrings.version} ${snapshot.data}",
                    context: context,
                    additionalStyle: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.background,
                    ),
                  );
                }
                return const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }

  bool _listenWhenToSplashState(SplashState previous, SplashState current) {
    return current is CheckUserSplashState;
  }

  void _listenToUserAuthentication(BuildContext context, SplashState state) {
    state.isA<CheckUserSplashState>()?.when(
          unAuthenticated: () {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.login, (route) => false);
          },
          authenticated: () {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.landingPage, (route) => false);
          },
        );
  }
}
