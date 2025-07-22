import 'package:app/core/route/app_router.dart';
import 'package:app/features/category/application/bloc/category_bloc.dart';
import 'package:app/features/category/domain/entities/category.dart';
import 'package:app/features/category/presentation/delete_category/widgets/delete_category_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CategoryListItem extends StatelessWidget {
  final Category category;

  const CategoryListItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final isMobile = mediaQuery.size.width < 600;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blueAccent,
        radius: isMobile ? 18 : 26,
        child: Icon(Icons.category, color: Colors.white, size: isMobile ? 24 : 32),
      ),
      title: Text(
        category.title,
        style: theme.textTheme.bodyMedium,
        overflow: TextOverflow.clip,
      ),
      subtitle: Text(
        'Последняя трата: ${category.lastSpendAt != null ? DateFormat('dd.MM.yyyy').format(category.lastSpendAt!) : 'нет трат'}',
        style: theme.textTheme.labelLarge,
      ),
      trailing: Wrap(
        spacing: 2,
        children: [
          Builder(
            builder: (innerContext) => IconButton(
              icon: Icon(Icons.edit, color: Colors.green),
              onPressed: () => AutoRouter.of(context).push(
                UpdateCategoryRoute(
                  categoryBloc: innerContext.read<CategoryBloc>(),
                  category: category,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () => deleteCategory(context),
          ),
        ],
      ),
    );
  }

  Future<void> deleteCategory(BuildContext context) async {
    final isConfirmed = await showDialog<bool>(
      context: context,
      builder: (context) => DeleteCategoryDialog(),
    );

    if (isConfirmed == true && context.mounted) {
      context.read<CategoryBloc>().add(DeleteCategoryEvent(category.id));
      GetIt.I<Talker>().info(category.id);
    }
  }
}
