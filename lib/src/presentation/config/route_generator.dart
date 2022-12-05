import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/create_shop_cubit/create_shop_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/events_list_cubit/events_list_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/home_cubit/home_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/landing_cubit/landing_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/login_cubit/login_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/members_cubit/members_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/notification_cubit/notification_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/profile_cubit/profile_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/pulls_list_cubit/pulls_list_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/settings_cubit/settings_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/shop_cubit/shop_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/splash_cubit/splash_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/transactions_cubit/transactions_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/veirfy_code_cubit/verify_code_cubit.dart';
import 'package:nova_kudos_flutter/src/presentation/config/routes.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/complete_profile/complete_profile_page.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/create_shop_page/create_shop_page.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/events_list_page/events_list_page.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/landing_page/landing_page.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/login_signup/login_page.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/notification/notification_page.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/profile/profile_page.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/pulls_list_page/pulls_list_page.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/splash/splash_page.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/transactions_page/transactions_page.dart';
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
      Routes.landingPage: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => LandingCubit(),
              ),
              BlocProvider(
                create: (context) => HomeCubit(),
              ),
              BlocProvider(
                create: (context) => SettingsCubit(),
              ),
              BlocProvider(
                create: (context) => ShopCubit(),
              ),
              BlocProvider(
                create: (context) => MembersCubit(),
              ),
            ],
            child: const LandingPage(),
          ),
      Routes.profile: (context) => BlocProvider(
            create: (context) => ProfileCubit(),
            child: const ProfilePage(),
          ),
      Routes.notification: (context) => BlocProvider(
            create: (context) => NotificationCubit(),
            child: const NotificationPage(),
          ),
      Routes.createShopPage: (context) => BlocProvider(
            create: (context) => CreateShopCubit(),
            child: CreateShopPage(),
          ),
      Routes.transactionsPage: (context) => BlocProvider(
            create: (context) => TransactionsCubit(),
            child: const TransactionsPage(),
          ),
      Routes.pullsListPage: (context) => BlocProvider(
            create: (context) => PullsListCubit(),
            child: const PullsListPage(),
          ),

      Routes.eventsListPage: (context) => BlocProvider(
        create: (context) => EventsListCubit(),
        child: const EventsListPage(),
      ),
    };
  }
}
