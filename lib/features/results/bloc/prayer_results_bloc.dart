import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer/repositories/results/results.dart';

part 'prayer_results_event.dart';
part 'prayer_results_state.dart';

class PrayerResultsBloc extends Bloc<PrayerResultsEvent, PrayerResultsState> {
  PrayerResultsBloc(
      {required PrayerResultsRepositoryInterface prayerResultsRepository})
      : _prayerResultsRepository = prayerResultsRepository,
        super(PrayerResultInitial()) {
    on<LoadPrayerResults>(_load);
    on<AddPrayerResult>(_add);
    on<UpdatePrayerResult>(_update);
    on<DeletePrayerResult>(_delete);
  }

  final PrayerResultsRepositoryInterface _prayerResultsRepository;

  Future<void> _load(
    LoadPrayerResults event,
    Emitter<PrayerResultsState> emit,
  ) async {
    try {
      emit(PrayerResultsLoading());
      final results = await _prayerResultsRepository.getAll();

      if (results.isNotEmpty) {
        emit(PrayerResultsLoaded(results: results));
      } else {
        emit(PrayerResultInitial());
      }
    } catch (e) {
      emit(PrayerResultFailure(e));
    }
  }

  Future<void> _add(
    AddPrayerResult event,
    Emitter<PrayerResultsState> emit,
  ) async {
    try {
      _prayerResultsRepository.create(event.result);
      add(LoadPrayerResults());
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> _update(
    UpdatePrayerResult event,
    Emitter<PrayerResultsState> emit,
  ) async {
    try {
      await _prayerResultsRepository.update(event.result);
      emit(PrayerResultSuccess());
      add(LoadPrayerResults());
    } catch (e) {
      log(e.toString());
      emit(const PrayerResultFailure('Something went wrong'));
    }
  }

  Future<void> _delete(
    DeletePrayerResult event,
    Emitter<PrayerResultsState> emit,
  ) async {
    try {
      await _prayerResultsRepository.delete(event.id);
      emit(PrayerResultSuccess());
      add(LoadPrayerResults());
    } catch (e) {
      log(e.toString());
      emit(const PrayerResultFailure('Something went wrong'));
    }
  }
}
