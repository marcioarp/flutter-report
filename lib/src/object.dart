import 'constants.dart';

class FRObject {
  FRMargin margin;
  FRPadding padding;
  FRRGBColor backgroundColorRGB;
  bool fillBackground = false;
  FRBorder border;
  FRObject parent;
  FRBoundBox boundBox;
  double _width = 10;
  double _height = 10;
  double _top = 0;
  double _left = 0;

  FRObject() {
    margin = FRMargin(2, 2, 2, 2);
    padding = FRPadding(0, 0, 0, 0);
    backgroundColorRGB = FRRGBColor(255, 255, 255);
    fillBackground = false;
    border = FRBorder(1, 1, 1, 1);
    boundBox = FRBoundBox(0, 0, 0, 0);
  }

  double get width => _width;

  set width(double width) {
    _width = width;
    _calcBoundBox();
  }

  double get height => _height;

  set height(double height) {
    _height = height;
    _calcBoundBox();
  }

  double get top => _top;

  set top(double top) {
    _top = top;
    _calcBoundBox();
  }

  double get left => _left;

  set left(double left) {
    _left = left;
    _calcBoundBox();
  }

  double papertTop() {
    double ret = margin.top + padding.top + top;
    if (parent != null) {
      ret += parent.papertTop();
    }
    return ret;
  }

  double papertLeft() {
    double ret = margin.left + padding.left + left;
    if (parent != null) {
      ret += parent.papertTop();
    }
    return ret;
  }

  double _calcBoundBox() {
    boundBox.top = papertTop();
    boundBox.left = papertLeft();
    boundBox.right = boundBox.left + width;
    boundBox.bottom = boundBox.top + height;
  }

  Map<String, dynamic> toMap() {
    return {
      "margim": margin.toMap(),
      "padding": padding.toMap(),
      "backgroundColorRGB": backgroundColorRGB.toMap(),
      "fillBackground": fillBackground,
      "border": border.toMap(),
      "boundBox": boundBox.toMap(),
      "width": _width,
      "height": _height,
      "top": _top,
      "left": _left
    };
  }
}

class FRRGBColor {
  int _r;
  int _g;
  int _b;

  int get r => _r;

  set r(int r) {
    _r = r;
  }

  int get g => _g;

  set g(int g) {
    _g = g;
  }

  int get b => _b;

  set b(int b) {
    _b = b;
  }

  FRRGBColor(int r, int g, int b) {
    _r = r;
    _g = g;
    _b = b;
  }

  List<int> toMap() {
    return [_r, _g, _b];
  }
}

class FRMargin {
  double _top;
  double _left;
  double _right;
  double _bottom;

  double get top => _top;

  set top(double top) {
    _top = top;
  }

  double get left => _left;

  set left(double left) {
    _left = left;
  }

  double get right => _right;

  set right(double right) {
    _right = right;
  }

  double get bottom => _bottom;

  set bottom(double bottom) {
    _bottom = bottom;
  }

  FRMargin(double top, double left, double right, double bottom) {
    _top = top;
    _left = left;
    _right = right;
    _bottom = bottom;
  }

  Map<String, double> toMap() {
    return {"top": _top, "left": _left, "right": _right, "bottom": _bottom};
  }
}

class FRBoundBox {
  double _top;
  double _left;
  double _right;
  double _bottom;

  double get top => _top;

  set top(double top) {
    _top = top;
  }

  double get left => _left;

  set left(double left) {
    _left = left;
  }

  double get right => _right;

  set right(double right) {
    _right = right;
  }

  double get bottom => _bottom;

  set bottom(double bottom) {
    _bottom = bottom;
  }

  FRBoundBox(double top, double left, double right, double bottom) {
    _top = top;
    _left = left;
    _right = right;
    _bottom = bottom;
  }
  Map<String, double> toMap() {
    return {"top": _top, "left": _left, "right": _right, "bottom": _bottom};
  }
}

class FRPadding {
  double _top;
  double _left;
  double _right;
  double _bottom;

  double get top => _top;

  set top(double top) {
    _top = top;
  }

  double get left => _left;

  set left(double left) {
    _left = left;
  }

  double get right => _right;

  set right(double right) {
    _right = right;
  }

  double get bottom => _bottom;

  set bottom(double bottom) {
    _bottom = bottom;
  }

  FRPadding(double top, double left, double right, double bottom) {
    _top = top;
    _left = left;
    _right = right;
    _bottom = bottom;
  }
  Map<String, double> toMap() {
    return {"top": _top, "left": _left, "right": _right, "bottom": _bottom};
  }
}

class FRBorder {
  bool _rounded;
  String _style;
  FRRGBColor _colorRBG;
  double _top;
  double _left;
  double _right;
  double _bottom;

  bool get rounded => _rounded;

  set rounded(bool rounded) {
    _rounded = rounded;
  }

  String get style => _style;

  set style(String style) {
    _style = style;
  }

  FRRGBColor get colorRBG => _colorRBG;

  set colorRBG(FRRGBColor colorRBG) {
    _colorRBG = colorRBG;
  }

  double get top => _top;

  set top(double top) {
    _top = top;
  }

  double get left => _left;

  set left(double left) {
    _left = left;
  }

  double get right => _right;

  set right(double right) {
    _right = right;
  }

  double get bottom => _bottom;

  set bottom(double bottom) {
    _bottom = bottom;
  }

  FRBorder(double top, double left, double right, double bottom) {
    _top = top;
    _left = left;
    _right = right;
    _bottom = bottom;

    _colorRBG = FRRGBColor(0, 0, 0);

    _style = FRBorderStyle.bsNone;
  }

  Map<String, dynamic> toMap() {
    return {
      "top": _top,
      "left": _left,
      "right": _right,
      "bottom": _bottom,
      "colorRBG": _colorRBG.toMap(),
      "style": _style
    };
  }
}
