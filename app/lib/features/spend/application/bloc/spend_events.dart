part of 'spend_bloc.dart';

abstract class SpendEvent {}

class GetSpendsEvent extends SpendEvent {}

class AddSpendEvent extends SpendEvent {
  final SpendModel spend;

  AddSpendEvent(this.spend);
}

class DeleteSpendEvent extends SpendEvent {
  final int spendId;

  DeleteSpendEvent(this.spendId);
}

class UpdateSpendEvent extends SpendEvent {
  final SpendModel spend;

  UpdateSpendEvent(this.spend);
}
