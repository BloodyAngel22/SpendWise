
import 'package:app/common/utils/cubits/theme_cubit.dart';
import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({
    super.key,
    required this.isDark,
    required this.theme,
  });

  final bool isDark;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: isDark,
      onChanged: (_) => context.read<ThemeCubit>().toggleTheme(),
      title: Text(S.of(context).theme, style: theme.textTheme.bodyLarge),
      subtitle: Text(
        isDark ? S.of(context).themeDark : S.of(context).themeLight,
        style: theme.textTheme.bodySmall,
      ),
      secondary: isDark
          ? const Icon(Icons.dark_mode)
          : const Icon(Icons.light_mode),
    );
  }
}