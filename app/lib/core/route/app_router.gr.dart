// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AddCategoryScreen]
class AddCategoryRoute extends PageRouteInfo<AddCategoryRouteArgs> {
  AddCategoryRoute({
    Key? key,
    required CategoryBloc categoryBloc,
    List<PageRouteInfo>? children,
  }) : super(
         AddCategoryRoute.name,
         args: AddCategoryRouteArgs(key: key, categoryBloc: categoryBloc),
         initialChildren: children,
       );

  static const String name = 'AddCategoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddCategoryRouteArgs>();
      return AddCategoryScreen(key: args.key, categoryBloc: args.categoryBloc);
    },
  );
}

class AddCategoryRouteArgs {
  const AddCategoryRouteArgs({this.key, required this.categoryBloc});

  final Key? key;

  final CategoryBloc categoryBloc;

  @override
  String toString() {
    return 'AddCategoryRouteArgs{key: $key, categoryBloc: $categoryBloc}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AddCategoryRouteArgs) return false;
    return key == other.key && categoryBloc == other.categoryBloc;
  }

  @override
  int get hashCode => key.hashCode ^ categoryBloc.hashCode;
}

/// generated route for
/// [AddSpendScreen]
class AddSpendRoute extends PageRouteInfo<AddSpendRouteArgs> {
  AddSpendRoute({
    Key? key,
    required SpendBloc spendBloc,
    List<PageRouteInfo>? children,
  }) : super(
         AddSpendRoute.name,
         args: AddSpendRouteArgs(key: key, spendBloc: spendBloc),
         initialChildren: children,
       );

  static const String name = 'AddSpendRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddSpendRouteArgs>();
      return AddSpendScreen(key: args.key, spendBloc: args.spendBloc);
    },
  );
}

class AddSpendRouteArgs {
  const AddSpendRouteArgs({this.key, required this.spendBloc});

  final Key? key;

  final SpendBloc spendBloc;

  @override
  String toString() {
    return 'AddSpendRouteArgs{key: $key, spendBloc: $spendBloc}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AddSpendRouteArgs) return false;
    return key == other.key && spendBloc == other.spendBloc;
  }

  @override
  int get hashCode => key.hashCode ^ spendBloc.hashCode;
}

/// generated route for
/// [CategoryListScreen]
class CategoryListRoute extends PageRouteInfo<void> {
  const CategoryListRoute({List<PageRouteInfo>? children})
    : super(CategoryListRoute.name, initialChildren: children);

  static const String name = 'CategoryListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CategoryListScreen();
    },
  );
}

/// generated route for
/// [MainTabsScreen]
class MainTabsRoute extends PageRouteInfo<void> {
  const MainTabsRoute({List<PageRouteInfo>? children})
    : super(MainTabsRoute.name, initialChildren: children);

  static const String name = 'MainTabsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainTabsScreen();
    },
  );
}

/// generated route for
/// [SpendDetailsScreen]
class SpendDetailsRoute extends PageRouteInfo<SpendDetailsRouteArgs> {
  SpendDetailsRoute({
    Key? key,
    required Spend spend,
    List<PageRouteInfo>? children,
  }) : super(
         SpendDetailsRoute.name,
         args: SpendDetailsRouteArgs(key: key, spend: spend),
         initialChildren: children,
       );

  static const String name = 'SpendDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SpendDetailsRouteArgs>();
      return SpendDetailsScreen(key: args.key, spend: args.spend);
    },
  );
}

class SpendDetailsRouteArgs {
  const SpendDetailsRouteArgs({this.key, required this.spend});

  final Key? key;

  final Spend spend;

  @override
  String toString() {
    return 'SpendDetailsRouteArgs{key: $key, spend: $spend}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SpendDetailsRouteArgs) return false;
    return key == other.key && spend == other.spend;
  }

  @override
  int get hashCode => key.hashCode ^ spend.hashCode;
}

/// generated route for
/// [SpendListScreen]
class SpendListRoute extends PageRouteInfo<void> {
  const SpendListRoute({List<PageRouteInfo>? children})
    : super(SpendListRoute.name, initialChildren: children);

  static const String name = 'SpendListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SpendListScreen();
    },
  );
}

/// generated route for
/// [UpdateCategoryScreen]
class UpdateCategoryRoute extends PageRouteInfo<UpdateCategoryRouteArgs> {
  UpdateCategoryRoute({
    Key? key,
    required CategoryBloc categoryBloc,
    required Category category,
    List<PageRouteInfo>? children,
  }) : super(
         UpdateCategoryRoute.name,
         args: UpdateCategoryRouteArgs(
           key: key,
           categoryBloc: categoryBloc,
           category: category,
         ),
         initialChildren: children,
       );

  static const String name = 'UpdateCategoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UpdateCategoryRouteArgs>();
      return UpdateCategoryScreen(
        key: args.key,
        categoryBloc: args.categoryBloc,
        category: args.category,
      );
    },
  );
}

class UpdateCategoryRouteArgs {
  const UpdateCategoryRouteArgs({
    this.key,
    required this.categoryBloc,
    required this.category,
  });

  final Key? key;

  final CategoryBloc categoryBloc;

  final Category category;

  @override
  String toString() {
    return 'UpdateCategoryRouteArgs{key: $key, categoryBloc: $categoryBloc, category: $category}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UpdateCategoryRouteArgs) return false;
    return key == other.key &&
        categoryBloc == other.categoryBloc &&
        category == other.category;
  }

  @override
  int get hashCode => key.hashCode ^ categoryBloc.hashCode ^ category.hashCode;
}

/// generated route for
/// [UpdateSpendScreen]
class UpdateSpendRoute extends PageRouteInfo<UpdateSpendRouteArgs> {
  UpdateSpendRoute({
    Key? key,
    required SpendBloc spendBloc,
    required Spend spend,
    List<PageRouteInfo>? children,
  }) : super(
         UpdateSpendRoute.name,
         args: UpdateSpendRouteArgs(
           key: key,
           spendBloc: spendBloc,
           spend: spend,
         ),
         initialChildren: children,
       );

  static const String name = 'UpdateSpendRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UpdateSpendRouteArgs>();
      return UpdateSpendScreen(
        key: args.key,
        spendBloc: args.spendBloc,
        spend: args.spend,
      );
    },
  );
}

class UpdateSpendRouteArgs {
  const UpdateSpendRouteArgs({
    this.key,
    required this.spendBloc,
    required this.spend,
  });

  final Key? key;

  final SpendBloc spendBloc;

  final Spend spend;

  @override
  String toString() {
    return 'UpdateSpendRouteArgs{key: $key, spendBloc: $spendBloc, spend: $spend}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UpdateSpendRouteArgs) return false;
    return key == other.key &&
        spendBloc == other.spendBloc &&
        spend == other.spend;
  }

  @override
  int get hashCode => key.hashCode ^ spendBloc.hashCode ^ spend.hashCode;
}
