import 'package:app/features/spend/domain/entities/spend.dart';
import 'package:app/features/spend/infrastructure/datamodels/spend_model.dart';

abstract class ISpendRepository {
  Future<List<Spend>> getSpends();
  Future<void> addSpend(SpendModel spend);
  Future<void> updateSpend(SpendModel spend);
  Future<void> deleteSpend(int spendId);
}