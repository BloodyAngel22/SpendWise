
import 'package:app/common/utils/cubits/theme_cubit.dart';
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
      title: Text('Тема', style: theme.textTheme.bodyLarge),
      subtitle: Text(
        isDark ? 'Темная' : 'Светлая',
        style: theme.textTheme.bodySmall,
      ),
      secondary: isDark
          ? const Icon(Icons.dark_mode)
          : const Icon(Icons.light_mode),
    );
  }
}