part of 'prayer_results_bloc.dart';

sealed class PrayerResultsState extends Equatable {
  const PrayerResultsState();

  @override
  List<Object> get props => [];
}

final class PrayerResultInitial extends PrayerResultsState {}

final class PrayerResultsLoading extends PrayerResultsState {}

final class PrayerResultSuccess extends PrayerResultsState {}

final class PrayerResultsLoaded extends PrayerResultsState {
  const PrayerResultsLoaded({required this.results});

  final List<PrayerResult> results;

  @override
  List<Object> get props => super.props..add(results);
}

final class PrayerResultFailure extends PrayerResultsState {
  const PrayerResultFailure(this.error);

  final Object error;

  @override
  List<Object> get props => super.props..add(error);
}
