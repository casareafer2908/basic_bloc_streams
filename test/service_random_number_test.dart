import 'package:basic_bloc_streams/src/core/services/random_number_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Random Number Service returns an interger', () {
    //arrange
    final randomNumberService = RandomNumberService();
    //act
    randomNumberService.randomNumberService();
    //assert
    expect(randomNumberService.value is int, true);
  });
  test('Random Number Service returns an integer >= 0 && >= 10', () {
    //arrange
    final randomNumberService = RandomNumberService();
    //act
    randomNumberService.randomNumberService();
    //assert
    expect(randomNumberService.value >= 0 && randomNumberService.value <= 10,
        true);
  });
}
