import 'package:app/common/utils/cubits/locale_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleSwitcher extends StatelessWidget {
  const LocaleSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.watch<LocaleCubit>().state;
    final theme = Theme.of(context);

    return ListTile(
      title: Text(S.of(context).language, style: theme.textTheme.bodyLarge),
      leading: const Icon(Icons.language),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          _buildLocaleButton(
            context,
            locale: const Locale('en'),
            label: S.of(context).english,
            currentLocale: currentLocale,
            theme: theme,
          ),
          _buildLocaleButton(
            context,
            locale: const Locale('ru'),
            label: S.of(context).russian,
            currentLocale: currentLocale,
            theme: theme,
          ),
        ],
      ),
    );
  }

  Widget _buildLocaleButton(
    BuildContext context, {
    required Locale locale,
    required String label,
    required Locale currentLocale,
    required ThemeData theme,
  }) {
    final isSelected = currentLocale.languageCode == locale.languageCode;

    return ElevatedButton(
      onPressed: () =>
          context.read<LocaleCubit>().changeLocale(locale.languageCode),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? theme.colorScheme.primary
            : theme.colorScheme.surface,
        foregroundColor: isSelected
            ? theme.colorScheme.onPrimary
            : theme.colorScheme.onSurface,
      ),
      child: Text(label),
    );
  }
}
