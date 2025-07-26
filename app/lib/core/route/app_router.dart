import 'package:app/common/widgets/main_tabs_screen.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/features/category/application/bloc/category_bloc.dart';
import 'package:app/features/category/domain/entities/category.dart';
import 'package:app/features/category/presentation/add_category/add_category_screen.dart';
import 'package:app/features/category/presentation/category_list/category_list_screen.dart';
import 'package:app/features/category/presentation/update_category/update_category_screen.dart';
import 'package:app/features/spend/application/bloc/spend_bloc.dart';
import 'package:app/features/spend/domain/entities/spend.dart';
import 'package:app/features/spend/presentation/add_spend/add_spend_screen.dart';
import 'package:app/features/spend/presentation/spend_details/spend_details_screen.dart';
import 'package:app/features/spend/presentation/spend_list/spend_list_screen.dart';
import 'package:app/features/spend/presentation/update_spend/update_spend_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: MainTabsRoute.page,
      path: '/',
      children: [
        AutoRoute(
          path: ScreenNameConstants.spendListScreenName,
          page: SpendListRoute.page,
          initial: true,
        ),

        AutoRoute(
          path: ScreenNameConstants.categoryListScreenName,
          page: CategoryListRoute.page,
        ),
      ],
    ),
    AutoRoute(
      path: ScreenNameConstants.addCategoryScreenName,
      page: AddCategoryRoute.page,
    ),
    AutoRoute(
      path: ScreenNameConstants.updateCategoryScreenName,
      page: UpdateCategoryRoute.page,
    ),
    AutoRoute(
      path: ScreenNameConstants.addSpendScreenName,
      page: AddSpendRoute.page,
    ),
    AutoRoute(
      path: ScreenNameConstants.updateSpendScreenName,
      page: UpdateSpendRoute.page,
    ),
    AutoRoute(
      path: ScreenNameConstants.spendDetailsScreenName,
      page: SpendDetailsRoute.page,
    )
  ];
}
