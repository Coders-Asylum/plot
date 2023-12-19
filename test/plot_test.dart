import 'package:flutter_test/flutter_test.dart';
import 'package:plot/plot.dart' show Calculator;

void main() {
  test('adds one to input values', () {
    final Calculator claculator = Calculator();
    expect(claculator.addOne(2), 3);
  });
}
