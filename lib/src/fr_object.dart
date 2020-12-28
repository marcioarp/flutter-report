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

  FRObject(
      {this.margin,
      this.padding,
      this.backgroundColorRGB,
      this.border,
      this.fillBackground,
      double top,
      double left,
      double height,
      double width}) {
    if (this.margin == null)
      this.margin = FRMargin(top: 0, left: 0, right: 0, bottom: 0);

    if (this.padding == null)
      padding = FRPadding(top: 0, left: 0, right: 0, bottom: 0);

    if (this.backgroundColorRGB == null) {
      backgroundColorRGB = FRRGBColor(255, 255, 255);
      if (this.fillBackground == null) fillBackground = false;
    } else {
      if (this.fillBackground == null) fillBackground = true;
    }

    if (this.border == null) {
      border = FRBorder(
          top: 1,
          left: 1,
          right: 1,
          bottom: 1,
          style: FRBorderStyle.bsDashed,
          colorRGB: FRRGBColor(220, 220, 220));
    }

    boundBox = FRBoundBox(top: 0, left: 0, right: 0, bottom: 0);

    if (top == null)
      this._top = 5;
    else
      this._top = top;

    if (left == null)
      this._left = 5;
    else
      this._left = left;

    if (height == null)
      this._height = 10;
    else
      this._height = height;

    if (width == null)
      this._width = 100;
    else
      this._width = width;

    _calcBoundBox();
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

  /// Return the top of object relative a paper
  double pageTop() {
    double ret = margin.top + padding.top + top;
    if (parent != null) {
      ret += parent.pageTop();
    }
    return ret;
  }

  /// Return the left of object relative a full page
  double pageLeft() {
    double ret = margin.left + padding.left + left;
    if (parent != null) {
      ret += parent.pageTop();
    }
    return ret;
  }

  void _calcBoundBox() {
    boundBox.top = pageTop();
    boundBox.left = pageLeft();
    boundBox.right = boundBox.left + width;
    boundBox.bottom = boundBox.top + height;
  }

  Map<String, dynamic> toMap() {
    return {
      "margin": margin.toMap(),
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
  int r;
  int g;
  int b;

  FRRGBColor(int r, int g, int b) {
    this.r = r;
    this.g = g;
    this.b = b;
  }

  List<int> toMap() {
    return [r, g, b];
  }
}

class FRMargin {
  double top;
  double left;
  double right;
  double bottom;

  FRMargin({this.top, this.left, this.right, this.bottom}) {
    if (this.top == null) this.top = 0;
    if (this.left == null) this.left = 0;
    if (this.right == null) this.right = 0;
    if (this.bottom == null) this.bottom = 0;
  }

  Map<String, double> toMap() {
    return {"top": top, "left": left, "right": right, "bottom": bottom};
  }
}

class FRBoundBox {
  double top;
  double left;
  double right;
  double bottom;

  FRBoundBox({this.top, this.left, this.right, this.bottom});

  Map<String, double> toMap() {
    return {"top": top, "left": left, "right": right, "bottom": bottom};
  }
}

class FRPadding {
  double top = 0;
  double left = 0;
  double right = 0;
  double bottom = 0;

  FRPadding({this.top, this.left, this.right, this.bottom}) {
    if (this.top == null) this.top = 0;
    if (this.left == null) this.left = 0;
    if (this.right == null) this.right = 0;
    if (this.bottom == null) this.bottom = 0;
  }

  Map<String, double> toMap() {
    return {"top": top, "left": left, "right": right, "bottom": bottom};
  }
}

class FRBorder {
  bool rounded;
  String style;
  FRRGBColor colorRGB;
  double top = 0;
  double left = 0;
  double right = 0;
  double bottom = 0;

  FRBorder(
      {this.top,
      this.left,
      this.right,
      this.bottom,
      this.style,
      this.colorRGB}) {
    if (this.colorRGB == null) this.colorRGB = FRRGBColor(0, 0, 0);

    if (this.style == null) this.style = FRBorderStyle.bsNone;

    if (this.top == null) this.top = 0;
    if (this.left == null) this.left = 0;
    if (this.right == null) this.right = 0;
    if (this.bottom == null) this.bottom = 0;
  }

  Map<String, dynamic> toMap() {
    return {
      "top": top,
      "left": left,
      "right": right,
      "bottom": bottom,
      "colorRGB": colorRGB.toMap(),
      "style": style
    };
  }
}
