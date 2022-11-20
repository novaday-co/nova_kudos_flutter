import 'package:nova_kudos_flutter/src/data/entity/prefrences/preferences_entity.dart';
import 'package:nova_kudos_flutter/src/domain/model/settings/prefrences.dart';

extension PreferencesEntityMapper on PreferencesEntity {
  PreferencesModel mapTopModel() {
    return PreferencesModel(
      language: language,
      locale: locale,
      theme: theme,
    );
  }
}

extension PreferencesModelMapper on PreferencesModel {
  PreferencesEntity mapToEntity() {
    return PreferencesEntity(
      language: language,
      locale: locale,
      theme: theme,
    );
  }
}
