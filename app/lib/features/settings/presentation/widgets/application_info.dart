import 'package:flutter/material.dart';

class ApplicationInfo extends StatelessWidget {
  const ApplicationInfo({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('О приложении', style: theme.textTheme.bodyLarge),
      subtitle: Text('Версия 1.0.1', style: theme.textTheme.bodySmall),
      trailing: const Icon(Icons.info),
    );
  }
}
