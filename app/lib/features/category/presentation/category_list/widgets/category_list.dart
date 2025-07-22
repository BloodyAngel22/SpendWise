import 'package:app/features/category/domain/entities/category.dart';
import 'package:app/features/category/presentation/category_list/widgets/category_list_item.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;

  const CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (categories.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.category_outlined,
                size: 64,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
              ),
              const SizedBox(height: 16),
              Text(
                'Нет данных о категориях',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Нажмите на + чтобы добавить категорию',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 80),
      itemCount: categories.length,
      itemBuilder: (context, index) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: CategoryListItem(category: categories[index]),
      ),
    );
  }
}
