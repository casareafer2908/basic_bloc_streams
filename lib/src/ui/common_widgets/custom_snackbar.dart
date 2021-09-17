import 'package:basic_bloc_streams/src/localization/locale_keys.g.dart';
import 'package:basic_bloc_streams/src/ui/common_widgets/custom_information_dialog.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomWidgets {
  CustomWidgets._();

  static buildRandomNumberPageSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Random Number Page'),
        action: SnackBarAction(
          label: 'More Info',
          onPressed: () => showDialog(
            context: context,
            builder: (context) => InformationDialog(
              contentText: LocaleKeys.randomNumberServiceBrief.tr(),
            ),
          ),
        ),
      ),
    );
  }
}