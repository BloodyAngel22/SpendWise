import 'package:flutter/material.dart';
import 'package:app/generated/l10n.dart';

class DeleteSpendDialog extends StatelessWidget {
  const DeleteSpendDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      title: Text(S.of(context).deleteSpendTitle, style: theme.textTheme.titleMedium),
      content: Text(
        S.of(context).deleteSpendConfirmation,
        style: theme.textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          child: Text(S.of(context).cancel, style: const TextStyle(color: Colors.blue)),
          onPressed: () => Navigator.pop(context, false),
        ),
        const SizedBox(width: 8),
        TextButton(
          child: Text(S.of(context).delete, style: const TextStyle(color: Colors.red)),
          onPressed: () => Navigator.pop(context, true),
        ),
      ],
    );
  }
}
