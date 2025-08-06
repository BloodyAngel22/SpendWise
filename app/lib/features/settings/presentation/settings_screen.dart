import 'package:app/common/utils/cubits/theme_cubit.dart';
import 'package:app/features/settings/presentation/widgets/application_info.dart';
import 'package:app/features/settings/presentation/widgets/theme_switcher.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state;
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ThemeSwitcher(isDark: isDark, theme: theme),
            const Divider(),
            ApplicationInfo(theme: theme),
          ],
        ),
      ),
    );
  }
}
