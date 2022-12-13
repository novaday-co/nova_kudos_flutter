import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import 'package:nova_kudos_flutter/src/data/config/api_provider/api_provider.dart';
import 'package:nova_kudos_flutter/src/data/config/api_provider/api_provider_impl.dart';
import 'package:nova_kudos_flutter/src/data/config/dio_wrapper.dart';

class NetworkModule {
  static Future<void> inject() async {
    KiwiContainer()
        .registerFactory<ApiService>((container) => ApiServiceImpl());

    KiwiContainer().registerSingleton<Dio>((container) => DioWrapper.provide());
  }
}
