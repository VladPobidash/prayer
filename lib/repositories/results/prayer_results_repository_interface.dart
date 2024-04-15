import 'package:prayer/repositories/results/models/models.dart';

abstract interface class PrayerResultsRepositoryInterface {
  Future<List<PrayerResult>> getAll();
  Future<PrayerResult?> getById(String id);
  Future<void> create(PrayerResult result);
  Future<void> update(PrayerResult result);
  Future<void> delete(String id);
}
