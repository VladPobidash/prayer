// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_result.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class PrayerResult extends _PrayerResult
    with RealmEntity, RealmObjectBase, RealmObject {
  PrayerResult(
    String id,
    String topicName,
    String summary,
    DateTime createdAt,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'topicName', topicName);
    RealmObjectBase.set(this, 'summary', summary);
    RealmObjectBase.set(this, 'createdAt', createdAt);
  }

  PrayerResult._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get topicName =>
      RealmObjectBase.get<String>(this, 'topicName') as String;
  @override
  set topicName(String value) => RealmObjectBase.set(this, 'topicName', value);

  @override
  String get summary => RealmObjectBase.get<String>(this, 'summary') as String;
  @override
  set summary(String value) => RealmObjectBase.set(this, 'summary', value);

  @override
  DateTime get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime;
  @override
  set createdAt(DateTime value) =>
      RealmObjectBase.set(this, 'createdAt', value);

  @override
  Stream<RealmObjectChanges<PrayerResult>> get changes =>
      RealmObjectBase.getChanges<PrayerResult>(this);

  @override
  PrayerResult freeze() => RealmObjectBase.freezeObject<PrayerResult>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'topicName': topicName.toEJson(),
      'summary': summary.toEJson(),
      'createdAt': createdAt.toEJson(),
    };
  }

  static EJsonValue _toEJson(PrayerResult value) => value.toEJson();
  static PrayerResult _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'topicName': EJsonValue topicName,
        'summary': EJsonValue summary,
        'createdAt': EJsonValue createdAt,
      } =>
        PrayerResult(
          fromEJson(id),
          fromEJson(topicName),
          fromEJson(summary),
          fromEJson(createdAt),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(PrayerResult._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, PrayerResult, 'PrayerResult', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('topicName', RealmPropertyType.string),
      SchemaProperty('summary', RealmPropertyType.string),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
