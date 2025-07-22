import 'package:app/features/spend/domain/entities/spend.dart';
import 'package:app/features/spend/domain/irepositories/i_spend_repository.dart';
import 'package:app/features/spend/infrastructure/datamodels/spend_model.dart';

class SpendUsecases {
  final ISpendRepository spendRepository;

  SpendUsecases(this.spendRepository);

  Future<List<Spend>> getSpendsWithCategory() async {
    return await spendRepository.getSpends();
  }

  Future<void> addSpend(SpendModel spend) async {
    await spendRepository.addSpend(spend);
  }

  Future<void> deleteSpend(int spendId) async {
    await spendRepository.deleteSpend(spendId);
  }

  Future<void> updateSpend(SpendModel spend) async {
    await spendRepository.updateSpend(spend);
  }
}