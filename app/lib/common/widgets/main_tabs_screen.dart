import 'package:app/core/route/app_router.dart';
import 'package:app/features/category/application/bloc/category_bloc.dart';
import 'package:app/features/spend/application/bloc/spend_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class MainTabsScreen extends StatelessWidget {
  const MainTabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.I;

    return MultiBlocProvider(
      providers: [
        BlocProvider<SpendBloc>(
          create: (_) => getIt<SpendBloc>()..add(GetSpendsEvent()),
        ),
        BlocProvider<CategoryBloc>(
          create: (_) => getIt<CategoryBloc>()..add(GetCategoriesEvent()),
        ),
      ],
      child: AutoTabsScaffold(
        routes: const [SpendListRoute(), CategoryListRoute()],
        bottomNavigationBuilder: (context, tabsRouter) {
          return BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Траты'),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Категории',
              ),
            ],
          );
        },
      ),
    );
  }
}
