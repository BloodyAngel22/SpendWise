import 'package:flutter/material.dart';

class DeleteCategoryDialog extends StatelessWidget {
  const DeleteCategoryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      title: Text('Удалить категорию?', style: theme.textTheme.titleMedium),
      content: Text(
        'Вы действительно хотите удалить категорию?\nЭто действие может повлечь удаление связанных трат.',
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
