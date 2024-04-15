import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer/repositories/topics/topics.dart';

part 'prayer_topics_event.dart';
part 'prayer_topics_state.dart';

class PrayerTopicsBloc extends Bloc<PrayerTopicsEvent, PrayerTopicsState> {
  PrayerTopicsBloc({
    required PrayerTopicsRepositoryInterface prayerTopicsRepository,
  })  : _prayerTopicsRepository = prayerTopicsRepository,
        super(PrayerTopicInitial()) {
    on<LoadPrayerTopicsList>(_loadAll);
    on<LoadPrayerTopic>(_loadById);
    on<CreatePrayerTopic>(_create);
    on<UpdatePrayerTopic>(_update);
    on<DeletePrayerTopic>(_delete);
  }

  final PrayerTopicsRepositoryInterface _prayerTopicsRepository;

  Future<void> _loadAll(
    LoadPrayerTopicsList event,
    Emitter<PrayerTopicsState> emit,
  ) async {
    try {
      emit(PrayerTopicLoading());
      final topics = await _prayerTopicsRepository.getAll();

      if (topics.isNotEmpty) {
        emit(PrayerTopicsListLoaded(topics: topics));
      } else {
        emit(PrayerTopicInitial());
      }
    } catch (e) {
      log(e.toString());
      emit(const PrayerTopicFailure('Something went wrong'));
    }
  }

  Future<void> _loadById(
    LoadPrayerTopic event,
    Emitter<PrayerTopicsState> emit,
  ) async {
    try {
      emit(PrayerTopicLoading());
      final topic = await _prayerTopicsRepository.getById(event.id);
      if (topic != null) {
        emit(PrayerTopicLoaded(topic: topic));
      } else {
        emit(PrayerTopicFailure('No topic with ID ${event.id}'));
      }
    } catch (e) {
      log(e.toString());
      emit(const PrayerTopicFailure('Something went wrong'));
    }
  }

  Future<void> _create(
    CreatePrayerTopic event,
    Emitter<PrayerTopicsState> emit,
  ) async {
    try {
      await _prayerTopicsRepository.create(event.topic);
      emit(PrayerTopicSuccess());
      add(LoadPrayerTopicsList());
    } catch (e) {
      log(e.toString());
      emit(const PrayerTopicFailure('Something went wrong'));
    }
  }

  Future<void> _update(
    UpdatePrayerTopic event,
    Emitter<PrayerTopicsState> emit,
  ) async {
    try {
      await _prayerTopicsRepository.update(event.topic);
      emit(PrayerTopicSuccess());
      add(LoadPrayerTopicsList());
    } catch (e) {
      log(e.toString());
      emit(const PrayerTopicFailure('Something went wrong'));
    }
  }

  Future<void> _delete(
    DeletePrayerTopic event,
    Emitter<PrayerTopicsState> emit,
  ) async {
    try {
      await _prayerTopicsRepository.delete(event.id);
      emit(PrayerTopicSuccess());
      add(LoadPrayerTopicsList());
    } catch (e) {
      log(e.toString());
      emit(const PrayerTopicFailure('Something went wrong'));
    }
  }
}
