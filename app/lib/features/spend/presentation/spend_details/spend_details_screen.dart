import 'package:app/features/spend/domain/entities/spend.dart';
import 'package:auto_route/auto_route.dart';
import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

@RoutePage()
class SpendDetailsScreen extends StatelessWidget {
  final Spend spend;
  const SpendDetailsScreen({super.key, required this.spend});

  String formattedDate(BuildContext context) => DateFormat('dd.MM.yyyy').format(spend.spendAt);
  String formattedAmount(BuildContext context) => NumberFormat.currency(
        symbol: S.of(context).moneySymbol,
        decimalDigits: 2,
      ).format(spend.amount);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).spendDetailsTitle)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    spend.title,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.category, color: colorScheme.primary),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        S.of(context).categoryWithValue(spend.categoryName),
                        style: theme.textTheme.bodyLarge,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: colorScheme.primary),
                    const SizedBox(width: 8),
                    Text(
                      S.of(context).dateWithValue(formattedDate(context)),
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.attach_money, color: colorScheme.primary),
                    const SizedBox(width: 8),
                    Text(
                      S.of(context).amountWithValue(formattedAmount(context)),
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
