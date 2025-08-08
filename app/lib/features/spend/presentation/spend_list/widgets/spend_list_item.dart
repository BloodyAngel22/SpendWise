import 'package:app/core/route/app_router.dart';
import 'package:app/features/spend/application/bloc/spend_bloc.dart';
import 'package:app/features/spend/domain/entities/spend.dart';
import 'package:app/features/spend/presentation/delete_spend/widgets/delete_spend_dialog.dart';
import 'package:app/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:talker_flutter/talker_flutter.dart';

class SpendListItem extends StatelessWidget {
  final Spend spend;

  const SpendListItem({super.key, required this.spend});

  String formattedAmount(BuildContext context) => NumberFormat.currency(
    symbol: S.of(context).moneySymbol,
    decimalDigits: 2,
  ).format(spend.amount);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final mediaQuery = MediaQuery.of(context);
    final isMobile = mediaQuery.size.width < 600;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: InkWell(
        onTap: () =>
            AutoRouter.of(context).push(SpendDetailsRoute(spend: spend)),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      spend.title,
                      style: theme.textTheme.titleLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.category,
                          color: colorScheme.onSurface.withValues(alpha: 0.85),
                          size: isMobile ? 18 : 26,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            spend.categoryName,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.7,
                              ),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: isMobile ? 18 : 26,
                          color: colorScheme.onSurface.withValues(alpha: 0.85),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          DateFormat('dd.MM.yyyy').format(spend.spendAt),
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 18),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: isMobile ? 70 : 150,
                  maxWidth: isMobile ? 130 : 350,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      formattedAmount(context),
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
											spacing: isMobile ? 4 : 16,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Builder(
                          builder: (innerContext) => IconButton(
                            icon: const Icon(Icons.edit, color: Colors.green),
                            onPressed: () => AutoRouter.of(context).push(
                              UpdateSpendRoute(
                                spendBloc: innerContext.read<SpendBloc>(),
                                spend: spend,
                              ),
                            ),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => deleteSpend(context),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> deleteSpend(BuildContext context) async {
    final isConfirmed = await showDialog<bool>(
      context: context,
      builder: (context) => DeleteSpendDialog(),
    );

    if (isConfirmed == true && context.mounted) {
      context.read<SpendBloc>().add(DeleteSpendEvent(spend.id));
      GetIt.I<Talker>().info(spend.id);
    }
  }
}
