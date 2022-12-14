const bool isProduction = String.fromEnvironment("BUILD_TYPE") == "PRODUCTION";
const bool isDevelopment = String.fromEnvironment("BUILD_TYPE") == "DEVELOPMENT";
bool isTest = false;