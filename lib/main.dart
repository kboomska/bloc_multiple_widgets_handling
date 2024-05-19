import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_multiple_widgets_handling/bloc/bloc_observer.dart';
import 'package:bloc_multiple_widgets_handling/bloc/handsome_bloc.dart';
import 'package:bloc_multiple_widgets_handling/bloc/handsome_event.dart';
import 'package:bloc_multiple_widgets_handling/bloc/handsome_state.dart';

void main() {
  // Включение логирования состояния блока в консоль.
  Bloc.observer = const AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Создаем начальное состояние для блока.
    final initialState = HandsomeStateIdle(
      date: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ).toString(),
      number: '0',
    );

    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => HandsomeBloc(initialState),
        child: const HandsomePage(),
      ),
    );
  }
}

class HandsomePage extends StatelessWidget {
  const HandsomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HandsomeBloc>().state;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Bloc Multiple Widgets Handling Demo'),
      ),
      body: Stack(
        children: [
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ADataWidget(),
                BDataWidget(),
              ],
            ),
          ),
          if (state is HandsomeStateProcessing) const ProcessingWidget(),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<HandsomeBloc>().add(HandsomeEventFetchDataA());
            },
            tooltip: 'Fetch A data',
            child: const Text(
              'A',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              context.read<HandsomeBloc>().add(HandsomeEventFetchDataB());
            },
            tooltip: 'Fetch B data',
            child: const Text(
              'B',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ADataWidget extends StatelessWidget {
  const ADataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Генерация случайного цвета контейнера для контроля его перерисовки.
    final color = Colors.primaries[Random().nextInt(Colors.primaries.length)];

    // Получение текущей даты для отображения в контейнере.

    // Исходный вариант.
    // final date = DateTime.now().toString();

    // Использование блока, но с обновлением всех виджетов, зависящих от стейта.
    // final date = context.watch<HandsomeBloc>().state.date;

    // Использование блока, но с обновлением виджетов, зависящих от конкрентных данных в стейте.
    final date = context.select((HandsomeBloc bloc) => bloc.state.date);

    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: color,
      ),
      child: Center(
        child: Text(
          date,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

class BDataWidget extends StatelessWidget {
  const BDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Генерация случайного цвета контейнера для контроля его перерисовки.
    final color = Colors.primaries[Random().nextInt(Colors.primaries.length)];

    // Получение случайного числа для отображения в контейнере.

    // Исходный вариант.
    // final number = Random().nextInt(10).toString();

    // Использование блока, но с обновлением всех виджетов, зависящих от стейта.
    // final number = context.watch<HandsomeBloc>().state.number;

    // Использование блока, но с обновлением виджетов, зависящих от конкрентных данных в стейте.
    final number = context.select((HandsomeBloc bloc) => bloc.state.number);

    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: color,
      ),
      child: Center(
        child: Text(
          number,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

class ProcessingWidget extends StatelessWidget {
  const ProcessingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ModalBarrier(
          barrierSemanticsDismissible: false,
          dismissible: false,
          color: Colors.white.withOpacity(0.8),
        ),
        const RepaintBoundary(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}
