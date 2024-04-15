import 'package:realm/realm.dart';

part 'prayer_result.realm.dart';

@RealmModel()
class _PrayerResult {
  @PrimaryKey()
  late String id;
  late String topicName;
  late String summary;
  late DateTime createdAt;
}
