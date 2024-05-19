import 'dart:math';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_multiple_widgets_handling/bloc/handsome_event.dart';
import 'package:bloc_multiple_widgets_handling/bloc/handsome_state.dart';

class HandsomeBloc extends Bloc<HandsomeEvent, HandsomeState> {
  HandsomeBloc(super.initialState) {
    on<HandsomeEvent>(
      (event, emit) async {
        if (event is HandsomeEventFetchDataA) {
          await _fetchDataA(event, emit);
        } else if (event is HandsomeEventFetchDataB) {
          await _fetchDataB(event, emit);
        }
      },
      transformer: sequential(),
    );
  }

  // Действия при нажатии на A.
  Future<void> _fetchDataA(
    HandsomeEventFetchDataA event,
    Emitter<HandsomeState> emit,
  ) async {
    // Переключаемся в состояние загрузки, сохраняя данные текущего стейта.
    emit(HandsomeStateProcessing(date: state.date, number: state.number));

    // Добавим задержку для состояния загрузки.
    await Future.delayed(const Duration(seconds: 1));

    // Получение текущей даты.
    final newDate = DateTime.now().toString();

    // Переключаемся в состояние бездействия с новой датой, но исходным числом.
    emit(HandsomeStateIdle(date: newDate, number: state.number));
  }

  // Действия при нажатии на B.
  Future<void> _fetchDataB(
    HandsomeEventFetchDataB event,
    Emitter<HandsomeState> emit,
  ) async {
    // Переключаемся в состояние загрузки, сохраняя данные текущего стейта.
    emit(HandsomeStateProcessing(date: state.date, number: state.number));

    // Добавим задержку для состояния загрузки.
    await Future.delayed(const Duration(seconds: 1));

    // Получение случайного числа.
    final newNumber = Random().nextInt(10).toString();

    // Переключаемся в состояние бездействия с новым числом, но исходной датой.
    emit(HandsomeStateIdle(date: state.date, number: newNumber));
  }
}
