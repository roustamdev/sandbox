// ignore_for_file: strict_raw_type

import 'dart:developer' show log;

import 'package:chalkdart/chalk.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      log(name: ' BlocError', '''
${chalk.red.onHex('#7A3E65')('runtimeType : ${bloc.runtimeType}')}
${chalk.red.onHex('#7A3E65')('error       : $error')}
${chalk.red.onHex('#7A3E65')('stackTrace  : $stackTrace')}
''');
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      log(name: 'BlocChange', '''
${chalk.yellow.onHex('#7A3E65')('runtimeType : ${bloc.runtimeType}')}
${chalk.yellow.onHex('#7A3E65')('change      : $change')}
''');
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      log(name: ' BlocTrans', '''
${chalk.blue.onHex('#7A3E65')('runtimeType : ${bloc.runtimeType}')}
${chalk.blue.onHex('#7A3E65')('transition  : $transition')}
''');
    }
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (kDebugMode) {
      log(name: ' BlocClose', '''
${chalk.yellow.onHex('#7A3E65')('runtimeType : ${bloc.runtimeType}')}

''');
    }
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      log(name: 'BlocCreate', '''
${chalk.green.onHex('#7A3E65')('runtimeType : ${bloc.runtimeType}')}
''');
    }
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      log(name: ' BlocEvent', '''
${chalk.blue.onHex('#7A3E65')('runtimeType : ${bloc.runtimeType}')}
${chalk.blue.onHex('#7A3E65')('event       : $event')}
''');
    }
  }
}
