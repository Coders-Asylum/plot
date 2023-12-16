import 'package:meta/meta.dart' show mustBeOverridden, protected;

/// Represents a sequence of data points with associated indices.
class Series<T> {
  const Series(this.data, this.indices);
  final List<T> data;
  final List<int> indices;

  /// Returns the length of the series.
  @mustBeOverridden
  int get length => data.length;

  /// Accesses a data point by its index.
  @protected
  T operator [](int index) => data[index];

  /// Sorts the series by the data points.
  ///
  /// **Note: The indices are updated accordingly.**
  @protected
  void sort([int Function(T a, T b)? compare]) {
    final List<T> sortedData = List<T>.from(data);
    sortedData.sort(compare);
    data.clear();
    indices.clear();
    for (int i = 0; i < sortedData.length; i++) {
      data.add(sortedData[i]);
      indices.add(i);
    }
  }
}
