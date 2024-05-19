import 'dart:math';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_multiple_widgets_handling/bloc/handsome_event.dart';
import 'package:bloc_multiple_widgets_handling/bloc/handsome_state.dart';

class HandsomeBloc extends Bloc<HandsomeEvent, HandsomeState> {
  HandsomeBloc(super.initialState) {
    on<HandsomeEvent>(
      (event, emit) {
        if (event is HandsomeEventFetchDataA) {
          _fetchDataA(event, emit);
        } else if (event is HandsomeEventFetchDataB) {
          _fetchDataB(event, emit);
        }
      },
      transformer: sequential(),
    );
  }

  // Действия при нажатии на A.
  void _fetchDataA(
    HandsomeEventFetchDataA event,
    Emitter<HandsomeState> emit,
  ) {
    // Переключаемся в состояние загрузки, сохраняя данные текущего стейта.
    emit(HandsomeStateProcessing(date: state.date, number: state.number));

    // Получение текущей даты.
    final newDate = DateTime.now().toString();

    // Переключаемся в состояние бездействия с новой датой, но исходным числом.
    emit(HandsomeStateIdle(date: newDate, number: state.number));
  }

  // Действия при нажатии на B.
  void _fetchDataB(
    HandsomeEventFetchDataB event,
    Emitter<HandsomeState> emit,
  ) {
    // Переключаемся в состояние загрузки, сохраняя данные текущего стейта.
    emit(HandsomeStateProcessing(date: state.date, number: state.number));

    // Получение случайного числа.
    final newNumber = Random().nextInt(10).toString();

    // Переключаемся в состояние бездействия с новым числом, но исходной датой.
    emit(HandsomeStateIdle(date: state.date, number: newNumber));
  }
}
