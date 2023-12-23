import 'dart:math' show pow, sqrt;
import 'package:meta/meta.dart' show mustBeOverridden, protected;

import './util.dart' show Utils;

/// Abstarct Dataset class for custom data types.
abstract class Dataset<T> {
  /// Returns the number of data points.
  @protected
  @mustBeOverridden
  int get length;

  /// Calculates the mean of all data points.
  @protected
  @mustBeOverridden
  double get mean;

  /// Calculates the median of all data points.
  @protected
  @mustBeOverridden
  double get median;

  /// Calculates the standard deviation of all data points.
  @protected
  @mustBeOverridden
  double get standardDeviation;

  /// Calculates the variance of all data points.
  @protected
  @mustBeOverridden
  num get variance;

  /// Returns the range of the data points (max - min).
  @protected
  @mustBeOverridden
  double get range;

  /// Calculates the specified percentile of the data.
  @protected
  @mustBeOverridden
  double percentile(double percentage);
}

/// Represents a collection of data points.
class NumDataset implements Dataset<num> {
  const NumDataset(this.data);
  final List<num> data;

  /// Returns the number of data points.
  @override
  int get length {
    return data.length;
  }

  /// Calculates the mean of all data points.
  @override
  double get mean {
    return Utils.mean(data.map((num e) => e.toDouble()));
  }

  /// Calculates the median of all data points.
  @override
  double get median {
    final List<double> sortedData = List<double>.from(data.whereType<num>().cast<double>())..sort();
    return sortedData.length.isOdd
        ? sortedData[sortedData.length ~/ 2]
        : Utils.mean(sortedData.sublist(sortedData.length ~/ 2 - 1, sortedData.length ~/ 2 + 1));
  }

  /// Calculates the standard deviation of all data points.
  @override
  double get standardDeviation {
    final double mean = this.mean;
    final List<double> variances = data.map((dynamic value) => (value as num) - mean).map((double value) => value * value).toList();
    return sqrt(Utils.sum(variances) / data.length);
  }

  /// Calculates the variance of all data points.
  @override
  num get variance => pow(standardDeviation, 2);

  /// Returns the range of the data points (max - min).
  @override
  double get range {
    final double min = data.reduce((num value, num element) => value < element ? value : element).toDouble();
    final double max = data.reduce((num value, num element) => value > element ? value : element).toDouble();
    return max - min;
  }

  /// Calculates the specified percentile of the data.
  @override
  double percentile(double percentage) {
    if (percentage < 0 || percentage > 100) {
      throw ArgumentError('Percentile must be between 0 and 100');
    }
    final List<double> sortedData = List<double>.from(data.whereType<num>().cast<double>())..sort();
    final int index = (sortedData.length * percentage / 100).floor();
    return sortedData[index];
  }
}
