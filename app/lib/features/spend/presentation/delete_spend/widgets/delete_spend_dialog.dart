import 'package:flutter/material.dart';

class DeleteSpendDialog extends StatelessWidget {
  const DeleteSpendDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      title: Text('Удалить трату?', style: theme.textTheme.titleMedium),
      content: Text(
        'Вы действительно хотите удалить трату?',
        style: theme.textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          child: Text('Отмена', style: TextStyle(color: Colors.blue)),
          onPressed: () => Navigator.pop(context, false),
        ),
        const SizedBox(width: 8),
        TextButton(
          child: Text('Удалить', style: TextStyle(color: Colors.red)),
          onPressed: () => Navigator.pop(context, true),
        ),
      ],
    );
  }
}
