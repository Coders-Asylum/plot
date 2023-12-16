import 'package:meta/meta.dart' show immutable;

/// Point class for representing 2D coordinates.
@immutable
class Point {
  const Point(this.x, this.y);
  final double x;
  final double y;

  /// The distance from origin
  double get magnitude {
    return distanceTo(const Point(0, 0));
  }

  /// The distance between current and [other] points.
  double distanceTo(Point other) {
    return (x - other.x).abs() + (y - other.y).abs();
  }

  /// The midpoint between current and [other] points.
  Point midpoint(Point other) {
    return Point((x + other.x) / 2, (y + other.y) / 2);
  }

  /// A new point with the same coordinates.
  Point copy() {
    return Point(x, y);
  }
}
