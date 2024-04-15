part of 'prayer_results_bloc.dart';

sealed class PrayerResultsEvent extends Equatable {
  const PrayerResultsEvent();

  @override
  List<Object> get props => [];
}

final class LoadPrayerResults extends PrayerResultsEvent {}

final class AddPrayerResult extends PrayerResultsEvent {
  const AddPrayerResult(this.result);

  final PrayerResult result;

  @override
  List<Object> get props => super.props..add(result);
}

final class UpdatePrayerResult extends PrayerResultsEvent {
  const UpdatePrayerResult(this.result);

  final PrayerResult result;

  @override
  List<Object> get props => super.props..add(result);
}

final class DeletePrayerResult extends PrayerResultsEvent {
  const DeletePrayerResult(this.id);

  final String id;

  @override
  List<Object> get props => super.props..add(id);
}
