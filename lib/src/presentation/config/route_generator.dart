import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/login_cubit/login_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/profile/profile_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/splash_cubit/splash_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/veirfy_code_cubit/verify_code_cubit.dart';
import 'package:nova_kudos_flutter/src/presentation/config/routes.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/complete_profile/complete_profile_page.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/login_signup/login_page.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/profile/profile_page.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/splash/splash_page.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/verify_code/verify_code_page.dart';

class RouteGenerator {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings settings) {
    return {
      Routes.splash: (context) => BlocProvider(
            create: (context) => SplashCubit(),
            child: const SplashPage(),
          ),
      Routes.login: (context) => BlocProvider(
            create: (context) => LoginCubit(),
            child: LoginPage(),
          ),
      Routes.verifyCode: (context) => BlocProvider(
            create: (context) => VerifyCodeCubit(),
            child: VerifyCodePage(),
          ),
      Routes.completeProfile: (context) => BlocProvider(
            create: (context) => CompleteProfileCubit(),
            child: const CompleteProfilePage(),
          ),
      Routes.profile: (context) => BlocProvider(
            create: (context) => ProfileCubit(),
            child: const ProfilePage(),
          )
    };
  }
}
