// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(money) => "Сумма трат (${money})";

  static String m1(value) => "Сумма: ${value}";

  static String m2(max) =>
      "Название категории не должно превышать ${max} символов";

  static String m3(value) => "Категория: ${value}";

  static String m4(value) => "Дата: ${value}";

  static String m5(message) => "Ошибка. ${message}";

  static String m6(date) => "Последняя трата: ${date}";

  static String m7(max) => "Сумма расхода не должна превышать ${max}";

  static String m8(max) =>
      "Название расхода не должно превышать ${max} символов";

  static String m9(version) => "Версия ${version}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aboutApp": MessageLookupByLibrary.simpleMessage("О приложении"),
        "add": MessageLookupByLibrary.simpleMessage("Добавить"),
        "addCategoryTitle":
            MessageLookupByLibrary.simpleMessage("Добавить категорию"),
        "addSpendTitle":
            MessageLookupByLibrary.simpleMessage("Добавить расход"),
        "amountOfExpenses": m0,
        "amountWithValue": m1,
        "appTitle": MessageLookupByLibrary.simpleMessage("SpendWise"),
        "apply": MessageLookupByLibrary.simpleMessage("Применить"),
        "cancel": MessageLookupByLibrary.simpleMessage("Отменить"),
        "category": MessageLookupByLibrary.simpleMessage("Категория"),
        "categoryTitleEmpty": MessageLookupByLibrary.simpleMessage(
            "Пожалуйста, введите название категории"),
        "categoryTitleExists": MessageLookupByLibrary.simpleMessage(
            "Категория с таким названием уже существует"),
        "categoryTitleHint":
            MessageLookupByLibrary.simpleMessage("Введите название категории"),
        "categoryTitleLabel":
            MessageLookupByLibrary.simpleMessage("Название категории"),
        "categoryTitleTooLong": m2,
        "categoryWithValue": m3,
        "clickPlusToAddFirstCategory": MessageLookupByLibrary.simpleMessage(
            "Нажмите на + чтобы добавить категорию"),
        "clickPlusToAddFirstExpense": MessageLookupByLibrary.simpleMessage(
            "Нажмите на + чтобы добавить первый расход"),
        "date": MessageLookupByLibrary.simpleMessage("Дата"),
        "dateRange": MessageLookupByLibrary.simpleMessage("Диапазон дат"),
        "dateWithValue": m4,
        "delete": MessageLookupByLibrary.simpleMessage("Удалить"),
        "deleteCategoryConfirmation": MessageLookupByLibrary.simpleMessage(
            "Вы действительно хотите удалить категорию?\nЭто действие может повлечь удаление связанных трат."),
        "deleteCategoryTitle":
            MessageLookupByLibrary.simpleMessage("Удалить категорию?"),
        "deleteSpendConfirmation": MessageLookupByLibrary.simpleMessage(
            "Вы действительно хотите удалить трату?"),
        "deleteSpendTitle":
            MessageLookupByLibrary.simpleMessage("Удалить трату?"),
        "english": MessageLookupByLibrary.simpleMessage("Английский"),
        "error": m5,
        "filters": MessageLookupByLibrary.simpleMessage("Фильтры"),
        "language": MessageLookupByLibrary.simpleMessage("Язык"),
        "lastSpendAt": m6,
        "moneySymbol": MessageLookupByLibrary.simpleMessage("₽"),
        "noDataOnCategories":
            MessageLookupByLibrary.simpleMessage("Нет данных о категориях"),
        "noDataOnExpenses":
            MessageLookupByLibrary.simpleMessage("Нет данных о расходах"),
        "noSpends": MessageLookupByLibrary.simpleMessage("нет трат"),
        "notSelected": MessageLookupByLibrary.simpleMessage("Не выбрано"),
        "reset": MessageLookupByLibrary.simpleMessage("Сбросить"),
        "russian": MessageLookupByLibrary.simpleMessage("Русский"),
        "searchByCategories":
            MessageLookupByLibrary.simpleMessage("Поиск по категориям"),
        "searchByExpenses":
            MessageLookupByLibrary.simpleMessage("Поиск по расходам"),
        "selectDate": MessageLookupByLibrary.simpleMessage("Выберите дату"),
        "spendAmountEmpty": MessageLookupByLibrary.simpleMessage(
            "Пожалуйста, введите сумму расхода"),
        "spendAmountGreaterThanZero": MessageLookupByLibrary.simpleMessage(
            "Сумма расхода должна быть больше 0"),
        "spendAmountHint":
            MessageLookupByLibrary.simpleMessage("Введите сумму расхода"),
        "spendAmountLabel":
            MessageLookupByLibrary.simpleMessage("Сумма расхода"),
        "spendAmountNotNumber": MessageLookupByLibrary.simpleMessage(
            "Сумма расхода должна быть числом"),
        "spendAmountTooLarge": m7,
        "spendCategoryRequired": MessageLookupByLibrary.simpleMessage(
            "Пожалуйста, выберите категорию расхода"),
        "spendDetailsTitle":
            MessageLookupByLibrary.simpleMessage("Детали траты"),
        "spendTitleEmpty": MessageLookupByLibrary.simpleMessage(
            "Название расхода не может быть пустым"),
        "spendTitleHint":
            MessageLookupByLibrary.simpleMessage("Введите название расхода"),
        "spendTitleLabel":
            MessageLookupByLibrary.simpleMessage("Название расхода"),
        "spendTitleTooLong": m8,
        "tabCategories": MessageLookupByLibrary.simpleMessage("Категории"),
        "tabSettings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "tabSpends": MessageLookupByLibrary.simpleMessage("Траты"),
        "theme": MessageLookupByLibrary.simpleMessage("Тема"),
        "themeDark": MessageLookupByLibrary.simpleMessage("Тёмная"),
        "themeLight": MessageLookupByLibrary.simpleMessage("Светлая"),
        "update": MessageLookupByLibrary.simpleMessage("Обновить"),
        "updateCategoryTitle":
            MessageLookupByLibrary.simpleMessage("Обновить категорию"),
        "updateSpendTitle":
            MessageLookupByLibrary.simpleMessage("Обновить расход"),
        "version": m9
      };
}
