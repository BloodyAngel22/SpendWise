import 'package:app/features/spend/application/usecases/spend_usecases.dart';
import 'package:app/features/spend/domain/entities/spend.dart';
import 'package:app/features/spend/infrastructure/datamodels/spend_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'spend_events.dart';
part 'spend_states.dart';

class SpendBloc extends Bloc<SpendEvent, SpendState> {
  final Talker talker;
  final SpendUsecases spendUsecases;

  SpendBloc(this.talker, this.spendUsecases) : super(SpendInitialState()) {
    on<GetSpendsEvent>((event, emit) async {
      emit(SpendLoadingState());
      try {
        final spends = await spendUsecases.getSpendsWithCategory();
        emit(SpendsLoadedState(spends: spends));
      } catch (exception, stackTrace) {
        talker.handle(exception, stackTrace);
        emit(SpendErrorState(message: exception.toString()));
      }
    });

    on<AddSpendEvent>((event, emit) async {
      try {
        await spendUsecases.addSpend(event.spend);
        emit(SpendAddedState());
        final spends = await spendUsecases.getSpendsWithCategory();
        emit(SpendsLoadedState(spends: spends));
      } catch (exception, stackTrace) {
        talker.handle(exception, stackTrace);
        emit(SpendErrorState(message: exception.toString()));
      }
    });

    on<UpdateSpendEvent>((event, emit) async {
      try {
        await spendUsecases.updateSpend(event.spend);
        emit(SpendUpdatedState());
        final spends = await spendUsecases.getSpendsWithCategory();
        emit(SpendsLoadedState(spends: spends));
      } catch (exception, stackTrace) {
        talker.handle(exception, stackTrace);
        emit(SpendErrorState(message: exception.toString()));
      }
    });

    on<DeleteSpendEvent>((event, emit) async {
      try {
        await spendUsecases.deleteSpend(event.spendId);
        emit(SpendDeletedState());
        final spends = await spendUsecases.getSpendsWithCategory();
        emit(SpendsLoadedState(spends: spends));
      } catch (exception, stackTrace) {
        talker.handle(exception, stackTrace);
        emit(SpendErrorState(message: exception.toString()));
      }
    });
  }
}
