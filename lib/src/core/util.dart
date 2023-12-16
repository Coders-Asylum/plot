/// Utility functions
class Utils {
  /// Calculates the sum of all data points.
  static double sum(Iterable<double> data) {
    return data.fold(0, (double sum, double value) => sum + value);
  }

  /// Calculates the mean of all data points.
  static double mean(Iterable<double> data) {
    return sum(data) / data.length;
  }
}
