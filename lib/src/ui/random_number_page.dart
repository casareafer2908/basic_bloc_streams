import 'package:basic_bloc_streams/src/core/blocs/random_number_bloc.dart';
import 'package:basic_bloc_streams/src/core/services/random_number_service.dart';
import 'package:basic_bloc_streams/src/localization/locale_keys.g.dart';
import 'package:basic_bloc_streams/src/ui/common_widgets/custom_elevated_button.dart';
import 'package:basic_bloc_streams/src/ui/common_widgets/custom_information_dialog.dart';
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

  StreamBuilder<String> textLabel() {
    return StreamBuilder<String>(
        stream: bloc.labelTextStream,
        initialData: LocaleKeys.pushTheButton.tr(),
        builder: (context, snapshot) {
          String _labelText = snapshot.data!;
          return Center(
            child: Text(
              _labelText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        });
  }

  StreamBuilder<bool> imageEnabled() {
    return StreamBuilder<bool>(
        stream: bloc.imageIsEnabled,
        initialData: false,
        builder: (context, snapshot) {
          bool? imageEnabled = snapshot.data;
          return Visibility(
            visible: imageEnabled!,
            maintainState: true,
            maintainAnimation: true,
            maintainSize: true,
            child: Image.asset('assets/images/geeksquad.jpg'),
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
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => InformationDialog(
          contentText: LocaleKeys.randomNumberServiceBrief.tr(),
        ),
      );
    });
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Flexible(
            child: FractionallySizedBox(
              heightFactor: 1,
              widthFactor: 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: imageEnabled(),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: FractionallySizedBox(
              heightFactor: 0.4,
              widthFactor: 0.8,
              child: Row(
                children: [
                  Flexible(
                    child: textLabel(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          CustomElevatedButton(
              child: const Text(LocaleKeys.generateRandomNumberButton).tr(),
              color: Colors.blue,
              onPressed: _randomNumberService)
        ],
      ),
    );
  }

  _back(BuildContext context) {
    Navigator.pop(context);
  }
}
