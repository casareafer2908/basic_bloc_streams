import 'package:basic_bloc_streams/src/localization/locale_keys.g.dart';
import 'package:basic_bloc_streams/src/navigation/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'common_widgets/custom_elevated_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) => HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LocaleKeys.homepage).tr(),
      ),
      body: _buildContent(context),
    );
  }

  _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text(
            LocaleKeys.homepageRoutesLabel,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ).tr(),
          const SizedBox(
            height: 40,
          ),
          CustomElevatedButton(
            key: const ValueKey('firstPage'),
            onPressed: () => Navigator.pushNamed(context, Routes.firstPage),
            child: const Text(LocaleKeys.firstPage).tr(),
            color: Colors.blue,
          ),
          const SizedBox(
            height: 8,
          ),
          CustomElevatedButton(
            key: const ValueKey('secondPage'),
            onPressed: () => Navigator.pushNamed(context, Routes.secondPage),
            child: const Text(
              LocaleKeys.secondPage,
            ).tr(),
            color: Colors.red,
          ),
          const SizedBox(
            height: 8,
          ),
          CustomElevatedButton(
            key: const ValueKey('thirdPage'),
            onPressed: () => Navigator.pushNamed(context, Routes.thirdPage),
            child: const Text(
              LocaleKeys.thirdPage,
            ).tr(),
            color: Colors.pink,
          ),
        ],
      ),
    );
  }
}
