/// Класс состояния для HandsomeBloc.
class HandsomeState {
  /// Текущая дата.
  final String date;

  /// Случайное число.
  final String number;

  /// Класс состояния для HandsomeBloc.
  HandsomeState({
    required this.date,
    required this.number,
  });
}

/// Класс состояния покоя/бездействия/ожидания для HandsomeBloc.
class HandsomeStateIdle extends HandsomeState {
  /// Класс состояния покоя/бездействия/ожидания для HandsomeBloc.
  HandsomeStateIdle({
    required super.date,
    required super.number,
  });

  @override
  String toString() => '$HandsomeStateIdle(date: $date, number: $number)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HandsomeStateIdle &&
        other.runtimeType == runtimeType &&
        other.date == date &&
        other.number == number;
  }

  @override
  int get hashCode => date.hashCode ^ number.hashCode;
}

/// Класс состояния загрузки/получения данных для HandsomeBloc.
class HandsomeStateProcessing extends HandsomeState {
  /// Класс состояния загрузки/получения данных для HandsomeBloc.
  HandsomeStateProcessing({
    required super.date,
    required super.number,
  });

  @override
  String toString() => '$HandsomeStateProcessing(date: $date, number: $number)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HandsomeStateProcessing &&
        other.runtimeType == runtimeType &&
        other.date == date &&
        other.number == number;
  }

  @override
  int get hashCode => date.hashCode ^ number.hashCode;
}
