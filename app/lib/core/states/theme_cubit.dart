import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final preferences = await SharedPreferences.getInstance();
    final isDark = preferences.getBool('is_dark') ?? false;
    emit(isDark);
  }

  Future<void> toggleTheme() async {
    final preferences = await SharedPreferences.getInstance();
    final newTheme = !state;
    await preferences.setBool('is_dark', newTheme);
    emit(newTheme);
  }
}