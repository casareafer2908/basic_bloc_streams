import 'package:basic_bloc_streams/src/core/blocs/random_number_bloc.dart';
import 'package:basic_bloc_streams/src/core/services/random_number_service.dart';
import 'package:basic_bloc_streams/src/localization/locale_keys.g.dart';
import 'package:basic_bloc_streams/src/ui/common_widgets/custom_elevated_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RandomNumberPage extends StatelessWidget {
  const RandomNumberPage({Key? key, required this.bloc}) : super(key: key);
  final RandomNumberBloc bloc;

  static Widget create(BuildContext context) {
    final randomNumberService =
        Provider.of<RandomNumberServiceBase>(context, listen: false);
    return Provider<RandomNumberBloc>(
      create: (_) => RandomNumberBloc(service: randomNumberService),
      dispose: (_, bloc) => bloc.dispose(),
      child: Consumer<RandomNumberBloc>(
        builder: (_, bloc, __) => RandomNumberPage(bloc: bloc),
      ),
    );
  }

  void _randomNumberService() => bloc.randomNumberService();

  _back(BuildContext context) {
    Navigator.pop(context);
  }

  StreamBuilder<String> textLabel() {
    return StreamBuilder<String>(
        stream: bloc.labelTextStream,
        initialData: 'Push the button',
        builder: (context, snapshot) {
          String _labelText = snapshot.data!;
          return Text(
            _labelText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        leading: IconButton(
          key: const ValueKey('back'),
          icon: const Icon(Icons.arrow_back),
          onPressed: () => _back(context),
        ),
        title: const Text(LocaleKeys.randomNumberPageTitle).tr(),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Flexible(
                child: const Text(
                  LocaleKeys.randomNumberServiceBrief,
                  textAlign: TextAlign.justify,
                ).tr(),
              )
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          textLabel(),
          const SizedBox(
            height: 40,
          ),
          CustomElevatedButton(
              child: const Text('service button'),
              color: Colors.blue,
              onPressed: _randomNumberService)
        ],
      ),
    );
  }
}
