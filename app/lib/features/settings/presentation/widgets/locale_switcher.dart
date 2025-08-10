import 'package:app/core/states/locale_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleSwitcher extends StatelessWidget {
  const LocaleSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.watch<LocaleCubit>().state;
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 600;

    if (isMobile) {
      String currentLanguageLabel = currentLocale.languageCode == 'en' ? S.of(context).english : S.of(context).russian;

      return ListTile(
        title: Text(S.of(context).language, style: theme.textTheme.bodyLarge),
        leading: const Icon(Icons.language),
        trailing: Text(currentLanguageLabel, style: theme.textTheme.bodyLarge),
        onTap: () => _showLanguageBottomSheet(context),
      );
    } else {
      return ListTile(
        title: Text(S.of(context).language, style: theme.textTheme.bodyLarge),
        leading: const Icon(Icons.language),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLocaleButton(
              context,
              locale: const Locale('en'),
              label: S.of(context).english,
              currentLocale: currentLocale,
              theme: theme,
            ),
            const SizedBox(width: 12),
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
  }
  
  void _showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLocaleListTile(context, locale: const Locale('en'), label: S.of(context).english),
            _buildLocaleListTile(context, locale: const Locale('ru'), label: S.of(context).russian),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }

  Widget _buildLocaleListTile(BuildContext context, {required Locale locale, required String label}) {
    final currentLocale = context.watch<LocaleCubit>().state;
    final isSelected = currentLocale.languageCode == locale.languageCode;

    return ListTile(
      title: Text(label),
      leading: isSelected ? const Icon(Icons.check) : null,
      onTap: () {
        context.read<LocaleCubit>().changeLocale(locale.languageCode);
        Navigator.pop(context);
      },
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
      onPressed: () => context.read<LocaleCubit>().changeLocale(locale.languageCode),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? theme.colorScheme.primary : theme.colorScheme.surface,
        foregroundColor: isSelected ? theme.colorScheme.onPrimary : theme.colorScheme.onSurface,
      ),
      child: Text(label),
    );
  }
}