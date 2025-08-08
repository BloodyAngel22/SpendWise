import 'package:app/generated/l10n.dart';
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
      title: Text(S.of(context).aboutApp, style: theme.textTheme.bodyLarge),
      subtitle: Text(S.of(context).version('1.0.1'), style: theme.textTheme.bodySmall),
      trailing: const Icon(Icons.info),
    );
  }
}
