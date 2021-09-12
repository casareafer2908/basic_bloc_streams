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
  "randomNumberPageTitle": "Random Number",
  "secondPage": "Second Page",
  "thirdPage": "Third Page",
  "timesPushedButton": "You've pushed the button this many times:",
  "incrementTooltip": "Increment",
  "randomNumberServiceBrief": "Push the button to get a random number from 0 to 10, if the number is equal or under 5, an image will be displayed, otherwise no images will be shown",
  "numberOverFive": "Image Enabled!\n Your number was:",
  "numberUnderFive": "Image Disabled!\n Your number was:",
  "generateRandomNumberButton": "Get Random Number",
  "info": "Info",
  "ok": "OK",
  "pushTheButton": "Push the button"
};
static const Map<String,dynamic> es = {
  "homepage": "Página Principal",
  "helloWorld": "Rutas",
  "homepageRoutesLabel": "Rutas:",
  "firstPage": "Primera Pagina",
  "randomNumberPageTitle": "Numero Aleatorio",
  "secondPage": "Segunda Pagina",
  "thirdPage": "Tercera Pagina",
  "timesPushedButton": "Has presionado el boton estas veces:",
  "incrementTooltip": "Sumar",
  "randomNumberServiceBrief": "Presiona el boton para generar un numero aleatorio entre 0 y 10, si el numero es igual o menor que 5, una imagen aparecera, de lo contrario no se mostrara ninguna imagen ",
  "numberOverFive": "Imagen Habilitada!\n Tu numero fue:",
  "numberUnderFive": "Imagen Deshabilitada!\n Tu numero fue:",
  "generateRandomNumberButton": "Generar Numero",
  "info": "Info",
  "ok": "OK",
  "pushTheButton": "Presione el boton"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "es": es};
}
