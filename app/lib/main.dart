import 'package:app/common/utils/cubits/theme_cubit.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/di/injection.dart';
import 'package:app/core/route/app_router.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'dart:io';

final _appRouter = AppRouter();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!Platform.isAndroid && !Platform.isIOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  await Injection.init();

  GetIt.I<Talker>().info('Start app');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = GetIt.I<ThemeCubit>();
    return BlocProvider<ThemeCubit>(
      create: (context) => themeCubit,
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, isDark) {
          return MaterialApp.router(
            onGenerateTitle: (context) => S.of(context).appTitle,
            builder: (context, child) {
              final mediaQueryData = MediaQuery.of(context);
              final isDesktop = mediaQueryData.size.width > 600;
              final deviceScaleFactor = isDesktop
                  ? ScreenSizeConstants.desktopSizeCoefficient
                  : ScreenSizeConstants.mobileSizeCoefficient;

              final textScaler = TextScaler.linear(deviceScaleFactor);

              return Theme(
                data: AppTheme.getTheme(isDark: isDark, textScaler: textScaler),
                child: MediaQuery(
                  data: mediaQueryData.copyWith(textScaler: textScaler),
                  child: SafeArea(child: child!),
                ),
              );
            },
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            // TODO: убрать
            // locale: const Locale('en'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
