import 'dart:convert';

class JsonValidator{
  static bool isValidJson(String jsonString){
    var decodeSucceeded = false;
    try {
      json.decode(jsonString) as Map<String, dynamic>;
      decodeSucceeded = true;
    } on FormatException catch (e){}
    return decodeSucceeded;
  }
}