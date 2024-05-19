import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Bloc Multiple Widgets Handling Demo'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ADataWidget(),
            BDataWidget(),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            tooltip: 'Fetch A data',
            child: const Text(
              'A',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {},
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
    final date = DateTime.now().toString();

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
    final number = Random().nextInt(10).toString();

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
