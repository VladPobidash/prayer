import 'package:realm/realm.dart';

part 'prayer_topic.realm.dart';

@RealmModel()
class _PrayerTopic {
  @PrimaryKey()
  late String id;
  late String name;
  late String description;
  late bool resolved;
  late List<String> results;
}
