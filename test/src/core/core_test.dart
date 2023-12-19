import 'dart:ffi';

import 'package:plot/core.dart' show Dataset, NumDataset, Point, Series, Utils;
import 'package:test/test.dart';

void main() {
  group('NumDataset', () {
    /// sequential int test data
    const List<int> intData1 = <int>[1, 2, 3, 4, 5];

    /// non sequential int test data with even length and negative values.
    const List<int> intData2 = <int>[4443, 98789, 32, 123421, 0, -1, -987656789, 1];

    /// sequential double test data
    const List<double> doubleData1 = <double>[1.0, 2.0, 3.0, 4.0, 5.0];

    /// non sequential  double test data with even length
    const List<double> doubleData2 = <double>[6.0, 7.0, 8.0, 9.0, 10.0, 11.0];

    group('class initialisation', () {
      test('should initialise without error.', () {
        expect(() => const NumDataset(intData1), returnsNormally);
        expect(() => const NumDataset(doubleData1), returnsNormally);
        expect(() => const NumDataset(doubleData2), returnsNormally);
        expect(() => const NumDataset(intData2), returnsNormally);
      });
    });

    group('function:', () {
      // length()
      test('length() should return correct array length.', () {
        expect(const NumDataset(intData1).length, equals(intData1.length));
        expect(const NumDataset(intData2).length, equals(intData2.length));
        expect(const NumDataset(doubleData1).length, equals(doubleData1.length));
        expect(const NumDataset(doubleData2).length, equals(doubleData2.length));
      });

      // mean()
      test('mean() should return correct mean for input data.', () {
        final double intData1Mean = intData1.reduce((int v, int e) => v + e) / intData1.length;
        final double intData2Mean = intData2.reduce((int v, int e) => v + e) / intData2.length;
        final double doubleData1Mean = doubleData1.reduce((double v, double e) => v + e) / doubleData1.length;
        final double doubleData2Mean = doubleData2.reduce((double v, double e) => v + e) / doubleData2.length;

        expect(const NumDataset(intData1).mean, equals(intData1Mean));
        expect(const NumDataset(doubleData1).mean, equals(doubleData1Mean));
        expect(const NumDataset(intData2).mean, equals(intData2Mean));
        expect(const NumDataset(doubleData2).mean, equals(doubleData2Mean));
      });
    });
  });
}
