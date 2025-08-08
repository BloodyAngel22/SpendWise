import 'package:app/features/settings/presentation/widgets/application_info.dart';
import 'package:app/features/settings/presentation/widgets/locale_switcher.dart';
import 'package:app/features/settings/presentation/widgets/theme_switcher.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ThemeSwitcher(),
            const Divider(),
            LocaleSwitcher(),
            const Divider(),
            ApplicationInfo(),
          ],
        ),
      ),
    );
  }
}
