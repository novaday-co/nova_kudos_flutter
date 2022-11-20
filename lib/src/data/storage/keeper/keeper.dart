import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kiwi/kiwi.dart';

abstract class Keeper {
  final FlutterSecureStorage _storage =
      KiwiContainer().resolve<FlutterSecureStorage>();

  @protected
  Future<String?> readValue(key) async {
    return await _storage.read(key: key);
  }

  @protected
  Future<void> writeValue(key, value) async {
    await _storage.write(key: key, value: value);
  }

  @protected
  void deleteValue(key) async {
    await _storage.delete(key: key);
  }
}
