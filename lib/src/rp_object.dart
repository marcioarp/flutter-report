import '../report.dart';

/**
 * All Visual object on report must be extends the this ReportObject
 */
class RPObject {
  double _top = 0;
  double _left = 0;
  double _height = 10;
  double _width = 10;
  late RPBoundBox _boundBox;

  ReportObject(int a) {
    _boundBox = RPBoundBox();
  }

  double get top => _top;
  set top(double top) {
    _top = top;
  }

  double get left => _left;
  set left(double left) {
    _left = left;
  }

  double get height => _height;
  set height(double height) {
    _height = height;
  }

  double get width => _width;
  set width(double width) {
    _width = width;
  }

  RPBoundBox get boundBox => _boundBox;
  set boundBox(RPBoundBox boundBox) {
    _boundBox = boundBox;
  }
}
