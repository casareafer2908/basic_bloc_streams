import 'dart:math';

abstract class RandomNumberServiceBase {
  randomNumberService();
}

class RandomNumberService implements RandomNumberServiceBase {
  @override
  int randomNumberService() {
    return _responseGenerator();
  }

  int _responseGenerator() {
    Random randomNumberGenerator = Random();
    return randomNumberGenerator.nextInt(10);
  }
}
