part of 'prayer_topics_bloc.dart';

sealed class PrayerTopicsEvent extends Equatable {
  const PrayerTopicsEvent();

  @override
  List<Object> get props => [];
}

final class LoadPrayerTopicsList extends PrayerTopicsEvent {}

final class LoadPrayerTopic extends PrayerTopicsEvent {
  const LoadPrayerTopic(this.id);

  final String id;

  @override
  List<Object> get props => super.props..add(id);
}

final class CreatePrayerTopic extends PrayerTopicsEvent {
  const CreatePrayerTopic(this.topic);

  final PrayerTopic topic;

  @override
  List<Object> get props => super.props..add(topic);
}

final class UpdatePrayerTopic extends PrayerTopicsEvent {
  const UpdatePrayerTopic(this.topic);

  final PrayerTopic topic;

  @override
  List<Object> get props => super.props..add(topic);
}

final class DeletePrayerTopic extends PrayerTopicsEvent {
  const DeletePrayerTopic(this.id);

  final String id;

  @override
  List<Object> get props => super.props..add(id);
}
