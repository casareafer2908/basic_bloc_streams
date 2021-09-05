// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "homepage": "Homepage",
  "helloWorld": "Hello World!",
  "homepageRoutesLabel": "Routes:",
  "firstPage": "First Page",
  "secondPage": "Second Page",
  "thirdPage": "Third Page",
  "timesPushedButton": "You've pushed the button this many times:",
  "incrementTooltip": "Increment"
};
static const Map<String,dynamic> es = {
  "homepage": "Página Principal",
  "helloWorld": "Rutas",
  "homepageRoutesLabel": "Rutas:",
  "firstPage": "Primera Pagina",
  "secondPage": "Segunda Pagina",
  "thirdPage": "Tercera Pagina",
  "timesPushedButton": "Has presionado el boton estas veces:",
  "incrementTooltip": "Sumar"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "es": es};
}
