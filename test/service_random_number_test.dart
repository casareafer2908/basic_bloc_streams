import 'package:basic_bloc_streams/src/core/services/random_number_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Random Number Service returns an interger', () {
    final randomNumberService = RandomNumberService();
    randomNumberService.randomNumberService();
    expect(randomNumberService.value is int, true);
  });
  test('Random Number Service returns an interger >= 0 && >= 10', () {
    final randomNumberService = RandomNumberService();
    randomNumberService.randomNumberService();
    expect(randomNumberService.value >= 0 && randomNumberService.value <= 10,
        true);
  });
}

/*
*

import 'package:test/test.dart';
import 'package:counter_app/counter.dart';

void main() {
  test('Counter value should be incremented', () {
    final counter = Counter();

    counter.increment();

    expect(counter.value, 1);
  });
}

*
* */
