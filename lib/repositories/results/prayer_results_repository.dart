import 'package:prayer/repositories/results/results.dart';
import 'package:realm/realm.dart';

class PrayerResultsRepository implements PrayerResultsRepositoryInterface {
  PrayerResultsRepository({required this.realm});

  final Realm realm;

  @override
  Future<List<PrayerResult>> getAll() async {
    return realm.all<PrayerResult>().toList();
  }

  @override
  Future<PrayerResult?> getById(String id) async {
    return realm.find<PrayerResult>(id);
  }

  @override
  Future<void> create(PrayerResult result) async {
    realm.write(() => realm.add<PrayerResult>(result));
  }

  @override
  Future<void> update(PrayerResult updatedResult) async {
    final result = await getById(updatedResult.id);

    if (result != null) {
      realm.write(() {
        result.summary = updatedResult.summary;
      });
    }
  }

  @override
  Future<void> delete(String id) async {
    final result = await getById(id);

    if (result != null) {
      realm.write(() => realm.delete(result));
    }
  }
}
