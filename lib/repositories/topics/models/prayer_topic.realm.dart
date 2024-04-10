// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_topic.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class PrayerTopic extends _PrayerTopic
    with RealmEntity, RealmObjectBase, RealmObject {
  PrayerTopic(
    String id,
    String name,
    String description,
    bool resolved, {
    Iterable<String> results = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'resolved', resolved);
    RealmObjectBase.set<RealmList<String>>(
        this, 'results', RealmList<String>(results));
  }

  PrayerTopic._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  bool get resolved => RealmObjectBase.get<bool>(this, 'resolved') as bool;
  @override
  set resolved(bool value) => RealmObjectBase.set(this, 'resolved', value);

  @override
  RealmList<String> get results =>
      RealmObjectBase.get<String>(this, 'results') as RealmList<String>;
  @override
  set results(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<PrayerTopic>> get changes =>
      RealmObjectBase.getChanges<PrayerTopic>(this);

  @override
  PrayerTopic freeze() => RealmObjectBase.freezeObject<PrayerTopic>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'name': name.toEJson(),
      'description': description.toEJson(),
      'resolved': resolved.toEJson(),
      'results': results.toEJson(),
    };
  }

  static EJsonValue _toEJson(PrayerTopic value) => value.toEJson();
  static PrayerTopic _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'name': EJsonValue name,
        'description': EJsonValue description,
        'resolved': EJsonValue resolved,
        'results': EJsonValue results,
      } =>
        PrayerTopic(
          fromEJson(id),
          fromEJson(name),
          fromEJson(description),
          fromEJson(resolved),
          results: fromEJson(results),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(PrayerTopic._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, PrayerTopic, 'PrayerTopic', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('resolved', RealmPropertyType.bool),
      SchemaProperty('results', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
