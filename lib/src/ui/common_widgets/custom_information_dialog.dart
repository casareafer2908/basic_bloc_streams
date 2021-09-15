import 'package:flutter/material.dart';
import 'package:basic_bloc_streams/src/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class InformationDialog extends StatelessWidget {
  const InformationDialog({
    Key? key,
    required this.contentText,
  }) : super(key: key);

  final String contentText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: const ValueKey('infoOkButton'),
      title: const Text(
        LocaleKeys.info,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ).tr(),
      content: Text(
        contentText,
        textAlign: TextAlign.justify,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            LocaleKeys.ok,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ).tr(),
        )
      ],
    );
  }
}
