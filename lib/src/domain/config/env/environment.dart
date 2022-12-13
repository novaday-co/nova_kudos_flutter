import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nova_kudos_flutter/src/domain/config/env/constants.dart';

class Environment {

  static Future<void> loadEnvironment() async  {
    if(isRelease){
      await dotenv.load(fileName: "production.env");
    }
    await dotenv.load(fileName: "development.env");
  }

  static String get baseURL {
    return dotenv.get("BASE_URL");
  }

}
