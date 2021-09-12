import 'package:basic_bloc_streams/src/core/services/random_number_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/app.dart';
import 'src/localization/codegen_loader.g.dart';
import 'src/localization/supported_locales.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(Provider<RandomNumberServiceBase>(
    create: (context) => RandomNumberService(),
    child: EasyLocalization(
      supportedLocales: supportedLocales.keys.toList(),
      assetLoader: const CodegenLoader(),
      path: 'assets/translations',
      child: const MyApp(),
    ),
  ));
}
