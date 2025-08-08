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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
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
    return Intl.message(
      'Filters',
      name: 'filters',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      '\$',
      name: 'moneySymbol',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Date range`
  String get dateRange {
    return Intl.message(
      'Date range',
      name: 'dateRange',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `SpendWise`
  String get appTitle {
    return Intl.message(
      'SpendWise',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Expenses`
  String get tabSpends {
    return Intl.message(
      'Expenses',
      name: 'tabSpends',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get tabCategories {
    return Intl.message(
      'Categories',
      name: 'tabCategories',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get tabSettings {
    return Intl.message(
      'Settings',
      name: 'tabSettings',
      desc: '',
      args: [],
    );
  }

  /// `About app`
  String get aboutApp {
    return Intl.message(
      'About app',
      name: 'aboutApp',
      desc: '',
      args: [],
    );
  }

  /// `Version {version}`
  String version(Object version) {
    return Intl.message(
      'Version $version',
      name: 'version',
      desc: '',
      args: [version],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get themeDark {
    return Intl.message(
      'Dark',
      name: 'themeDark',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get themeLight {
    return Intl.message(
      'Light',
      name: 'themeLight',
      desc: '',
      args: [],
    );
  }

  /// `Expense details`
  String get spendDetailsTitle {
    return Intl.message(
      'Expense details',
      name: 'spendDetailsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Category: {value}`
  String categoryWithValue(Object value) {
    return Intl.message(
      'Category: $value',
      name: 'categoryWithValue',
      desc: '',
      args: [value],
    );
  }

  /// `Date: {value}`
  String dateWithValue(Object value) {
    return Intl.message(
      'Date: $value',
      name: 'dateWithValue',
      desc: '',
      args: [value],
    );
  }

  /// `Amount: {value}`
  String amountWithValue(Object value) {
    return Intl.message(
      'Amount: $value',
      name: 'amountWithValue',
      desc: '',
      args: [value],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Search by categories`
  String get searchByCategories {
    return Intl.message(
      'Search by categories',
      name: 'searchByCategories',
      desc: '',
      args: [],
    );
  }

  /// `Add expense`
  String get addSpendTitle {
    return Intl.message(
      'Add expense',
      name: 'addSpendTitle',
      desc: '',
      args: [],
    );
  }

  /// `Update expense`
  String get updateSpendTitle {
    return Intl.message(
      'Update expense',
      name: 'updateSpendTitle',
      desc: '',
      args: [],
    );
  }

  /// `Expense title`
  String get spendTitleLabel {
    return Intl.message(
      'Expense title',
      name: 'spendTitleLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter expense title`
  String get spendTitleHint {
    return Intl.message(
      'Enter expense title',
      name: 'spendTitleHint',
      desc: '',
      args: [],
    );
  }

  /// `Expense amount`
  String get spendAmountLabel {
    return Intl.message(
      'Expense amount',
      name: 'spendAmountLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter expense amount`
  String get spendAmountHint {
    return Intl.message(
      'Enter expense amount',
      name: 'spendAmountHint',
      desc: '',
      args: [],
    );
  }

  /// `Select a date`
  String get selectDate {
    return Intl.message(
      'Select a date',
      name: 'selectDate',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Delete expense?`
  String get deleteSpendTitle {
    return Intl.message(
      'Delete expense?',
      name: 'deleteSpendTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete the expense?`
  String get deleteSpendConfirmation {
    return Intl.message(
      'Are you sure you want to delete the expense?',
      name: 'deleteSpendConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Delete category?`
  String get deleteCategoryTitle {
    return Intl.message(
      'Delete category?',
      name: 'deleteCategoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete the category?\nThis may delete related expenses.`
  String get deleteCategoryConfirmation {
    return Intl.message(
      'Are you sure you want to delete the category?\nThis may delete related expenses.',
      name: 'deleteCategoryConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Add category`
  String get addCategoryTitle {
    return Intl.message(
      'Add category',
      name: 'addCategoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Update category`
  String get updateCategoryTitle {
    return Intl.message(
      'Update category',
      name: 'updateCategoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Category title`
  String get categoryTitleLabel {
    return Intl.message(
      'Category title',
      name: 'categoryTitleLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter a category title`
  String get categoryTitleHint {
    return Intl.message(
      'Enter a category title',
      name: 'categoryTitleHint',
      desc: '',
      args: [],
    );
  }

  /// `No data on categories`
  String get noDataOnCategories {
    return Intl.message(
      'No data on categories',
      name: 'noDataOnCategories',
      desc: '',
      args: [],
    );
  }

  /// `Click on + to add a category`
  String get clickPlusToAddFirstCategory {
    return Intl.message(
      'Click on + to add a category',
      name: 'clickPlusToAddFirstCategory',
      desc: '',
      args: [],
    );
  }

  /// `Last spend: {date}`
  String lastSpendAt(Object date) {
    return Intl.message(
      'Last spend: $date',
      name: 'lastSpendAt',
      desc: '',
      args: [date],
    );
  }

  /// `no expenses`
  String get noSpends {
    return Intl.message(
      'no expenses',
      name: 'noSpends',
      desc: '',
      args: [],
    );
  }

  /// `Expense title cannot be empty`
  String get spendTitleEmpty {
    return Intl.message(
      'Expense title cannot be empty',
      name: 'spendTitleEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Expense title must not exceed {max} characters`
  String spendTitleTooLong(Object max) {
    return Intl.message(
      'Expense title must not exceed $max characters',
      name: 'spendTitleTooLong',
      desc: '',
      args: [max],
    );
  }

  /// `Please enter an expense amount`
  String get spendAmountEmpty {
    return Intl.message(
      'Please enter an expense amount',
      name: 'spendAmountEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Expense amount must be a number`
  String get spendAmountNotNumber {
    return Intl.message(
      'Expense amount must be a number',
      name: 'spendAmountNotNumber',
      desc: '',
      args: [],
    );
  }

  /// `Expense amount must be greater than 0`
  String get spendAmountGreaterThanZero {
    return Intl.message(
      'Expense amount must be greater than 0',
      name: 'spendAmountGreaterThanZero',
      desc: '',
      args: [],
    );
  }

  /// `Expense amount must not exceed {max}`
  String spendAmountTooLarge(Object max) {
    return Intl.message(
      'Expense amount must not exceed $max',
      name: 'spendAmountTooLarge',
      desc: '',
      args: [max],
    );
  }

  /// `Please select an expense category`
  String get spendCategoryRequired {
    return Intl.message(
      'Please select an expense category',
      name: 'spendCategoryRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a category name`
  String get categoryTitleEmpty {
    return Intl.message(
      'Please enter a category name',
      name: 'categoryTitleEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Category name must not exceed {max} characters`
  String categoryTitleTooLong(Object max) {
    return Intl.message(
      'Category name must not exceed $max characters',
      name: 'categoryTitleTooLong',
      desc: '',
      args: [max],
    );
  }

  /// `A category with this name already exists`
  String get categoryTitleExists {
    return Intl.message(
      'A category with this name already exists',
      name: 'categoryTitleExists',
      desc: '',
      args: [],
    );
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
