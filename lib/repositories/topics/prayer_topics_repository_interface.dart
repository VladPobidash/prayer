import 'package:prayer/repositories/topics/models/models.dart';

abstract interface class PrayerTopicsRepositoryInterface {
  Future<List<PrayerTopic>> getAll();
  Future<PrayerTopic?> getById(String id);
  Future<void> create(PrayerTopic topic);
  Future<void> update(PrayerTopic topic);
  Future<void> delete(String id);
}
