import 'dart:async';

import 'package:basic_bloc_streams/src/core/services/random_number_service.dart';

class RandomNumberBloc {
  RandomNumberBloc({required this.service});

  final RandomNumberServiceBase service;

  // final StreamController<bool> _imageIsEnabledController =
  //     StreamController<bool>.broadcast();
  final StreamController<String> _labelTextController =
      StreamController<String>.broadcast();

  //Stream<bool> get imageIsEnabled => _imageIsEnabledController.stream;

  Stream<String> get labelTextStream => _labelTextController.stream;

  // void _setImageIsEnabled(bool imageIsEnabled) =>
  //     _imageIsEnabledController.add(imageIsEnabled);

  setLabelText(String labelText) => _labelTextController.add(labelText);

  void dispose() {
    //  _imageIsEnabledController.close();
    _labelTextController.close();
  }

  randomNumberService() => _responseHandler();

  _responseHandler() {
    var serviceNumber = service.randomNumberService();
    if (serviceNumber >= 5 ? false : true) {
      //_setImageIsEnabled(true);
      setLabelText('Congrats! service enabled ~ Lucky Number $serviceNumber');
    } else {
      //_setImageIsEnabled(false);
      setLabelText('Service disabled ~ Unlucky Number $serviceNumber');
    }
  }
}
