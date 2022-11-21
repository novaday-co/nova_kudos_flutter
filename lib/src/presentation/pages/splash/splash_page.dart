import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/splash_cubit/splash_cubit.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/app_bar.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/icon_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/lottie_animations.dart';
import 'package:nova_kudos_flutter/src/presentation/shared_widgets/text_widget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: CustomAppbar(
        statusBarColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
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
                    LottieAnimations.loading(isPrimary: false),
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
                        fontSize: 18.sp,
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
      ),
    );
  }
}
