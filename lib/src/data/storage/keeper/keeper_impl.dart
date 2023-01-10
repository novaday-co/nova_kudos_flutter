import 'package:nova_kudos_flutter/src/data/storage/keeper/keeper.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/tags.dart';
import 'keeper_actions.dart';

class KeeperImpl extends Keeper implements KeeperActions {
  @override
  Future<String?> getToken() {
    return readValue(Tags.tokenKey);
  }

  @override
  Future<void> setToken(String token) async {
    writeValue(Tags.tokenKey, token);
  }

  @override
  Future<void> deleteAll() async {
    deleteValue(Tags.tokenKey);
  }

  @override
  Future<void> deleteToken() async {
    deleteValue(Tags.tokenKey);
  }

}
