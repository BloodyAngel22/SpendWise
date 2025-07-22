import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

class Log {
  static Talker init() {
    final talker = TalkerFlutter.init();

    Bloc.observer = TalkerBlocObserver(talker: talker);

    return talker;
  }
}
