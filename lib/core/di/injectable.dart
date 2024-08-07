import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fluttercon/core/di/injectable.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'initGetIt',
  generateForDir: ['lib'],
)
Future<void> configureDependencies() async {
  getIt.initGetIt();
  await getIt.allReady();
}

@module
abstract class RegisterModule {}

dynamic _parseAndDecode(String response) => jsonDecode(response);

dynamic parseJson(String text) =>
    compute<String, dynamic>(_parseAndDecode, text);
