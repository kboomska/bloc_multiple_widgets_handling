import 'package:flutter_bloc/flutter_bloc.dart';

/// [BlocObserver] which logs all bloc state changes, errors and events.
class AppBlocObserver extends BlocObserver {
  /// [BlocObserver] which logs all bloc state changes, errors and events.
  const AppBlocObserver();

  @override
  void onCreate(BlocBase<Object?> bloc) {
    print('Bloc: ${bloc.runtimeType} | Created');
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    print('New State: ${change.nextState.toString()}');
    super.onChange(bloc, change);
  }

  @override
  void onEvent(Bloc<Object?, Object?> bloc, Object? event) {
    print('Event: ${event.runtimeType}');
    super.onEvent(bloc, event);
  }

  @override
  void onClose(BlocBase<Object?> bloc) {
    print('Bloc: ${bloc.runtimeType} | Closed');
    super.onClose(bloc);
  }
}
