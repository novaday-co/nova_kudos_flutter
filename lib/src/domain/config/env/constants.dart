const bool isRelease = String.fromEnvironment("BUILD_TYPE") == "RELEASE";
const bool isDev = String.fromEnvironment("BUILD_TYPE") == "DEV";
bool isTest = false;