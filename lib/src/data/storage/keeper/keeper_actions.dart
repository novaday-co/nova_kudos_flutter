
abstract class KeeperActions {

  Future<void> setToken(String token);

  Future<String?> getToken();

  Future<void> deleteAll();

  Future<void> deleteToken();

}
