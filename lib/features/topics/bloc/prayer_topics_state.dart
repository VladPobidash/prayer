part of 'prayer_topics_bloc.dart';

sealed class PrayerTopicsState extends Equatable {
  const PrayerTopicsState();

  @override
  List<Object> get props => [];
}

final class PrayerTopicInitial extends PrayerTopicsState {}

final class PrayerTopicLoading extends PrayerTopicsState {}

final class PrayerTopicsListLoaded extends PrayerTopicsState {
  const PrayerTopicsListLoaded({required this.topics});

  final List<PrayerTopic> topics;

  @override
  List<Object> get props => super.props..add(topics);
}

final class PrayerTopicLoaded extends PrayerTopicsState {
  const PrayerTopicLoaded({required this.topic});

  final PrayerTopic topic;

  @override
  List<Object> get props => super.props..add(topic);
}

final class PrayerTopicSuccess extends PrayerTopicsState {}

final class PrayerTopicFailure extends PrayerTopicsState {
  const PrayerTopicFailure(this.error);
  final String error;

  @override
  List<Object> get props => super.props..add(error);
}
