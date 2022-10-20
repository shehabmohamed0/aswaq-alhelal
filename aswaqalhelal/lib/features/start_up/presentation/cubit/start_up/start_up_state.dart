part of 'start_up_cubit.dart';

@immutable
abstract class StartUpState {}

class StartUpInitial extends StartUpState {}

class StartUpFinished extends StartUpState {
  final String routeName;
  final Object? arguments;

  StartUpFinished({
    required this.routeName,
    this.arguments,
  });
}

class StartupNeedToUpdateTheApp extends StartUpState {}
