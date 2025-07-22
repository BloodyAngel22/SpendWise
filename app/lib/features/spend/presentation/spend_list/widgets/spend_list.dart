import 'package:app/features/spend/domain/entities/spend.dart';
import 'package:app/features/spend/presentation/spend_list/widgets/spend_list_item.dart';
import 'package:flutter/material.dart';

class SpendList extends StatelessWidget {
  final List<Spend> spends;

  const SpendList({
    super.key,
    required this.spends,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (spends.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.money_off,
                size: 64,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
              ),
              const SizedBox(height: 16),
              Text(
                'Нет данных о расходах',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Нажмите на + чтобы добавить первый расход',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 80),
      itemCount: spends.length,
      itemBuilder: (context, index) => SpendListItem(
        spend: spends[index],
      ),
    );
  }
}