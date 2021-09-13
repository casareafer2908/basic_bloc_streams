import 'dart:math';

abstract class RandomNumberServiceBase {
  randomNumberService();
}

class RandomNumberService implements RandomNumberServiceBase {
  int value = 0;

  @override
  int randomNumberService() {
    return _responseGenerator();
  }

  int _responseGenerator() {
    Random randomNumberGenerator = Random();
    value = randomNumberGenerator.nextInt(11);
    return value;
  }
}
