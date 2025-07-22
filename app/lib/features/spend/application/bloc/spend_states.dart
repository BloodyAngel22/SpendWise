part of 'spend_bloc.dart';

abstract class SpendState {}

class SpendInitialState extends SpendState {}

class SpendLoadingState extends SpendState {}

class SpendsLoadedState extends SpendState {
  final List<Spend> spends;
  SpendsLoadedState({required this.spends});
}

class SpendErrorState extends SpendState {
  final String message;
  SpendErrorState({required this.message});
}

class SpendDeletedState extends SpendState {}

class SpendUpdatedState extends SpendState {}

class SpendAddedState extends SpendState {}