import 'package:app/core/constants/constants.dart';
import 'package:app/core/di/injection.dart';
import 'package:app/core/route/app_router.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
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
    return MaterialApp.router(
      title: 'SpendWise',
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        final isDesktop = mediaQueryData.size.width > 600;
        final double deviceScaleFactor = isDesktop
            ? ScreenSizeConstants.desktopSizeCoefficient
            : ScreenSizeConstants.mobileSizeCoefficient;

        final textScaler = TextScaler.linear(deviceScaleFactor);

        return Theme(
          data: AppTheme.getTheme(textScaler),
          child: MediaQuery(
            data: mediaQueryData.copyWith(textScaler: textScaler),
            child: SafeArea(child: child!),
          ),
        );
      },
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}
