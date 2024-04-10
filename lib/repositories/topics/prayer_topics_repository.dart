import 'package:prayer/repositories/topics/models/prayer_topic.dart';
import 'package:prayer/repositories/topics/prayer_topics_repository_interface.dart';
import 'package:realm/realm.dart';

class PrayerTopicsRepository implements PrayerTopicsRepositoryInterface {
  PrayerTopicsRepository({required this.realm});

  final Realm realm;

  @override
  Future<List<PrayerTopic>> getAll() async {
    return realm.all<PrayerTopic>().toList();
  }

  @override
  Future<PrayerTopic?> getById(String id) async {
    return realm.find<PrayerTopic>(id);
  }

  @override
  Future<void> create(PrayerTopic topic) async {
    realm.write(() => realm.add<PrayerTopic>(topic));
  }

  @override
  Future<void> update(PrayerTopic updatedTopic) async {
    final topic = await getById(updatedTopic.id);

    if (topic != null) {
      realm.write(() {
        topic.name = updatedTopic.name;
        topic.description = updatedTopic.description;
      });
    }
  }

  @override
  Future<void> delete(String id) async {
    final topic = await getById(id);

    if (topic != null) {
      realm.write(() => realm.delete(topic));
    }
  }
}
