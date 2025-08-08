// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(money) => "Amount of expenses (${money})";

  static String m1(value) => "Amount: ${value}";

  static String m2(max) => "Category name must not exceed ${max} characters";

  static String m3(value) => "Category: ${value}";

  static String m4(value) => "Date: ${value}";

  static String m5(message) => "Error. ${message}";

  static String m6(date) => "Last spend: ${date}";

  static String m7(max) => "Expense amount must not exceed ${max}";

  static String m8(max) => "Expense title must not exceed ${max} characters";

  static String m9(version) => "Version ${version}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aboutApp": MessageLookupByLibrary.simpleMessage("About app"),
        "add": MessageLookupByLibrary.simpleMessage("Add"),
        "addCategoryTitle":
            MessageLookupByLibrary.simpleMessage("Add category"),
        "addSpendTitle": MessageLookupByLibrary.simpleMessage("Add expense"),
        "amountOfExpenses": m0,
        "amountWithValue": m1,
        "appTitle": MessageLookupByLibrary.simpleMessage("SpendWise"),
        "apply": MessageLookupByLibrary.simpleMessage("Apply"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "category": MessageLookupByLibrary.simpleMessage("Category"),
        "categoryTitleEmpty": MessageLookupByLibrary.simpleMessage(
            "Please enter a category name"),
        "categoryTitleExists": MessageLookupByLibrary.simpleMessage(
            "A category with this name already exists"),
        "categoryTitleHint":
            MessageLookupByLibrary.simpleMessage("Enter a category title"),
        "categoryTitleLabel":
            MessageLookupByLibrary.simpleMessage("Category title"),
        "categoryTitleTooLong": m2,
        "categoryWithValue": m3,
        "clickPlusToAddFirstCategory": MessageLookupByLibrary.simpleMessage(
            "Click on + to add a category"),
        "clickPlusToAddFirstExpense": MessageLookupByLibrary.simpleMessage(
            "Click on + to add your first expense"),
        "date": MessageLookupByLibrary.simpleMessage("Date"),
        "dateRange": MessageLookupByLibrary.simpleMessage("Date range"),
        "dateWithValue": m4,
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteCategoryConfirmation": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete the category?\nThis may delete related expenses."),
        "deleteCategoryTitle":
            MessageLookupByLibrary.simpleMessage("Delete category?"),
        "deleteSpendConfirmation": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete the expense?"),
        "deleteSpendTitle":
            MessageLookupByLibrary.simpleMessage("Delete expense?"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "error": m5,
        "filters": MessageLookupByLibrary.simpleMessage("Filters"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "lastSpendAt": m6,
        "moneySymbol": MessageLookupByLibrary.simpleMessage("\$"),
        "noDataOnCategories":
            MessageLookupByLibrary.simpleMessage("No data on categories"),
        "noDataOnExpenses":
            MessageLookupByLibrary.simpleMessage("No data on expenses"),
        "noSpends": MessageLookupByLibrary.simpleMessage("no expenses"),
        "notSelected": MessageLookupByLibrary.simpleMessage("Not selected"),
        "reset": MessageLookupByLibrary.simpleMessage("Reset"),
        "russian": MessageLookupByLibrary.simpleMessage("Russian"),
        "searchByCategories":
            MessageLookupByLibrary.simpleMessage("Search by categories"),
        "searchByExpenses":
            MessageLookupByLibrary.simpleMessage("Search by expenses"),
        "selectDate": MessageLookupByLibrary.simpleMessage("Select a date"),
        "spendAmountEmpty": MessageLookupByLibrary.simpleMessage(
            "Please enter an expense amount"),
        "spendAmountGreaterThanZero": MessageLookupByLibrary.simpleMessage(
            "Expense amount must be greater than 0"),
        "spendAmountHint":
            MessageLookupByLibrary.simpleMessage("Enter expense amount"),
        "spendAmountLabel":
            MessageLookupByLibrary.simpleMessage("Expense amount"),
        "spendAmountNotNumber": MessageLookupByLibrary.simpleMessage(
            "Expense amount must be a number"),
        "spendAmountTooLarge": m7,
        "spendCategoryRequired": MessageLookupByLibrary.simpleMessage(
            "Please select an expense category"),
        "spendDetailsTitle":
            MessageLookupByLibrary.simpleMessage("Expense details"),
        "spendTitleEmpty": MessageLookupByLibrary.simpleMessage(
            "Expense title cannot be empty"),
        "spendTitleHint":
            MessageLookupByLibrary.simpleMessage("Enter expense title"),
        "spendTitleLabel":
            MessageLookupByLibrary.simpleMessage("Expense title"),
        "spendTitleTooLong": m8,
        "tabCategories": MessageLookupByLibrary.simpleMessage("Categories"),
        "tabSettings": MessageLookupByLibrary.simpleMessage("Settings"),
        "tabSpends": MessageLookupByLibrary.simpleMessage("Expenses"),
        "theme": MessageLookupByLibrary.simpleMessage("Theme"),
        "themeDark": MessageLookupByLibrary.simpleMessage("Dark"),
        "themeLight": MessageLookupByLibrary.simpleMessage("Light"),
        "update": MessageLookupByLibrary.simpleMessage("Update"),
        "updateCategoryTitle":
            MessageLookupByLibrary.simpleMessage("Update category"),
        "updateSpendTitle":
            MessageLookupByLibrary.simpleMessage("Update expense"),
        "version": m9
      };
}
