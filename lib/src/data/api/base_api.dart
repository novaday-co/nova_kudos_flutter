import 'package:flutter/cupertino.dart';
import 'package:kiwi/kiwi.dart';
import 'package:nova_kudos_flutter/src/data/config/api_provider/api_provider.dart';

abstract class BaseApi {
  @protected
  final apiService = KiwiContainer().resolve<ApiService>();
}
