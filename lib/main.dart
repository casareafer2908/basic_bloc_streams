import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';
import 'src/localization/codegen_loader.g.dart';
import 'src/localization/supported_locales.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: supportedLocales.keys.toList(),
    assetLoader: const CodegenLoader(),
    path: 'assets/translations',
    child: const MyApp(),
  ));
}
