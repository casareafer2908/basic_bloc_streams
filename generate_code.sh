#!/bin/bash
set -e

flutter clean
flutter pub upgrade
# https://pub.dev/packages/easy_localization
flutter pub run easy_localization:generate -S assets/translations -O lib/src/localization
flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart -O lib/src/localization
# https://flutter.dev/docs/development/data-and-backend/json#generating-code-continuously
flutter pub run build_runner watch --delete-conflicting-outputs
