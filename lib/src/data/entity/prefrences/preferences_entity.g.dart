// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PreferencesEntityAdapter extends TypeAdapter<PreferencesEntity> {
  @override
  final int typeId = 4;

  @override
  PreferencesEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PreferencesEntity(
      language: fields[1] as String?,
      locale: fields[0] as String?,
      theme: fields[2] == null ? 'Solar' : fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PreferencesEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.locale)
      ..writeByte(1)
      ..write(obj.language)
      ..writeByte(2)
      ..write(obj.theme);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PreferencesEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreferencesEntity _$PreferencesEntityFromJson(Map<String, dynamic> json) =>
    PreferencesEntity(
      language: json['language'] as String?,
      locale: json['locale'] as String?,
      theme: json['theme'] as String?,
    );

Map<String, dynamic> _$PreferencesEntityToJson(PreferencesEntity instance) =>
    <String, dynamic>{
      'locale': instance.locale,
      'language': instance.language,
      'theme': instance.theme,
    };
