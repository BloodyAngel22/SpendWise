import 'package:app/core/route/app_router.dart';
import 'package:app/features/category/application/bloc/category_bloc.dart';
import 'package:app/features/category/presentation/category_list/widgets/category_list.dart';
import 'package:app/features/spend/application/bloc/spend_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

	// TODO: добавить поиск по textfield

  @override
  Widget build(BuildContext context) {
    return BlocListener<SpendBloc, SpendState>(
      listener: (context, state) {
        if (state is SpendAddedState ||
            state is SpendUpdatedState ||
            state is SpendDeletedState) {
          context.read<CategoryBloc>().add(GetCategoriesEvent());
        }
      },
      child: Scaffold(
        body: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CategoriesLoadedState) {
              return CategoryList(categories: state.categories);
            }
            if (state is CategoryErrorState) {
              return Center(child: Text('Ошибка. ${state.message}'));
            }
            return Container();
          },
        ),
        floatingActionButton: Builder(
          builder: (innerContext) => FloatingActionButton(
            heroTag: 'addCategory',
            onPressed: () {
              AutoRouter.of(context).push(
                AddCategoryRoute(
                  categoryBloc: innerContext.read<CategoryBloc>(),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
