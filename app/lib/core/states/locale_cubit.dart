import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('en')){
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final preferences = await SharedPreferences.getInstance();
    final locale = preferences.getString('locale') ?? 'en';
    emit(Locale(locale));
  }

  Future<void> changeLocale(String locale) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('locale', locale);
    emit(Locale(locale));
  }
}