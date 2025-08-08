// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Search by expenses`
  String get searchByExpenses {
    return Intl.message(
      'Search by expenses',
      name: 'searchByExpenses',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get filters {
    return Intl.message('Filters', name: 'filters', desc: '', args: []);
  }

  /// `Error. {message}`
  String spendError(Object message) {
    return Intl.message(
      'Error. $message',
      name: 'spendError',
      desc: '',
      args: [message],
    );
  }

  /// `No data on expenses`
  String get noDataOnExpenses {
    return Intl.message(
      'No data on expenses',
      name: 'noDataOnExpenses',
      desc: '',
      args: [],
    );
  }

  /// `Click on + to add your first expense`
  String get clickPlusToAddFirstExpense {
    return Intl.message(
      'Click on + to add your first expense',
      name: 'clickPlusToAddFirstExpense',
      desc: '',
      args: [],
    );
  }

  /// `$`
  String get moneySymbol {
    return Intl.message('\$', name: 'moneySymbol', desc: '', args: []);
  }

  /// `Category`
  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  /// `Date range`
  String get dateRange {
    return Intl.message('Date range', name: 'dateRange', desc: '', args: []);
  }

  /// `Not selected`
  String get notSelected {
    return Intl.message(
      'Not selected',
      name: 'notSelected',
      desc: '',
      args: [],
    );
  }

  /// `Amount of expenses ({money})`
  String amountOfExpenses(Object money) {
    return Intl.message(
      'Amount of expenses ($money)',
      name: 'amountOfExpenses',
      desc: '',
      args: [money],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message('Reset', name: 'reset', desc: '', args: []);
  }

  /// `Cancel `
  String get cancel {
    return Intl.message('Cancel ', name: 'cancel', desc: '', args: []);
  }

  /// `Apply`
  String get apply {
    return Intl.message('Apply', name: 'apply', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
