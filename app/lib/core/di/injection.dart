import 'package:app/core/states/locale_cubit.dart';
import 'package:app/core/states/theme_cubit.dart';
import 'package:app/core/data/init.dart';
import 'package:app/core/talker/log.dart';
import 'package:app/features/category/application/bloc/category_bloc.dart';
import 'package:app/features/category/application/usecases/category_usecases.dart';
import 'package:app/features/category/domain/irepositories/i_category_repository.dart';
import 'package:app/features/category/infrastructure/repositories/category_repository.dart';
import 'package:app/features/spend/application/bloc/spend_bloc.dart';
import 'package:app/features/spend/application/usecases/spend_usecases.dart';
import 'package:app/features/spend/domain/irepositories/i_spend_repository.dart';
import 'package:app/features/spend/infrastructure/repositories/spend_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import 'package:talker_flutter/talker_flutter.dart';

class Injection {
  static Future<void> init() async {
    final getIt = GetIt.instance;

    // cubits
    getIt.registerLazySingleton(() => ThemeCubit());
    getIt.registerLazySingleton(() => LocaleCubit());

    // talker
    getIt.registerSingleton<Talker>(Log.init());

    // database
    getIt.registerSingletonAsync<Database>(
      () async => await DatabaseInit.init(),
    );

    // repositories
    getIt.registerSingletonWithDependencies<ICategoryRepository>(
      () => CategoryRepository(getIt<Database>()),
      dependsOn: [Database],
    );
    getIt.registerSingletonWithDependencies<ISpendRepository>(
      () => SpendRepository(getIt<Database>()),
      dependsOn: [Database],
    );

    // usecases
    getIt.registerFactory<CategoryUsecases>(
      () => CategoryUsecases(getIt<ICategoryRepository>()),
    );
    getIt.registerFactory<SpendUsecases>(
      () => SpendUsecases(getIt<ISpendRepository>()),
    );

    // blocs
    getIt.registerFactory<CategoryBloc>(
      () => CategoryBloc(getIt<Talker>(), getIt<CategoryUsecases>()),
    );

    getIt.registerFactory<SpendBloc>(
      () => SpendBloc(getIt<Talker>(), getIt<SpendUsecases>()),
    );

    await getIt.allReady();
  }
}
