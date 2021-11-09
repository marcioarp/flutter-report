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
  String type;

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
    this.type = 'Object';
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
          style: FRBorderStyle.dashed,
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

  dynamic process(
      double incTop, double incLeft, dynamic data, int currData, bool devMode) {
    print('process não implementado');
    return [];
  }

  dynamic processBorder(double incTop, double incLeft) {
    //print(this.type);
    //if (this.type == 'startPage') return [];
    var ret = [];
    //return ret;
    //if (border == null) return ret;
    bool box = _borderIsRegularBox(border);

    if (fillBackground) {
      if (box) {
        ret.add({
          "type": "rect",
          "borderStyle": border.style,
          "borderColorRGB": border.colorRGB.toMap(),
          "fill": true,
          "fillColorRGB": backgroundColorRGB.toMap(),
          "borderWidth": border.top,
          "from": {
            "x": incLeft + this.left + this.margin.left,
            "y": incTop + this.top
          },
          "to": {
            "x": incLeft + width + this.margin.left + this.left,
            "y": incTop + height + this.top
          },
          "rounded": border.rounded
        });
        print(ret);
        return ret;
      } else {
        ret.add({
          "type": "rect",
          "borderStyle": border.style,
          "borderColorRGB": [0, 0, 0],
          "fill": true,
          "fillColorRGB": backgroundColorRGB.toMap(),
          "borderWidth": 0,
          "from": {
            "x": incLeft + this.margin.left + this.left,
            "y": incTop + this.top
          },
          "to": {
            "x": incLeft + width + this.margin.left + this.left,
            "y": incTop + height + this.top
          },
          "rounded": border.rounded
        });
      }
      //print(ret);
    }

    if (box) {
      //print('box');
      ret.add({
        "type": "rect",
        "borderStyle": border.style,
        "borderColorRGB": border.colorRGB.toMap(),
        "fill": false,
        "fillColorRGB": [0, 0, 0],
        "borderWidth": border.top,
        "from": {"x": incLeft + this.margin.left, "y": incTop},
        "to": {
          "x": incLeft + this.width + this.margin.left,
          "y": incTop + this.height
        },
        "rounded": border.rounded
      });
      //print(this.width);
    } else {
      if (border.top > 0) {
        ret.add({
          "type": "line",
          "style": border.style,
          "width": border.top,
          "colorRGB": border.colorRGB,
          "from": {"x": incLeft + this.margin.left, "y": incTop},
          "to": {"x": incLeft + width + this.margin.left, "y": incTop},
        });
      }
      if (border.bottom > 0) {
        ret.add({
          "type": "line",
          "style": border.style,
          "colorRGB": border.colorRGB,
          "width": border.bottom,
          "from": {"x": incLeft + this.margin.left, "y": incTop + height},
          "to": {"x": incLeft + width + this.margin.left, "y": incTop + height},
        });
      }
      if (border.left > 0) {
        ret.add({
          "type": "line",
          "style": border.style,
          "colorRGB": border.colorRGB.toMap(),
          "width": border.left,
          "from": {"x": incLeft + this.margin.left, "y": incTop},
          "to": {"x": incLeft + this.margin.left, "y": incTop + height},
        });
      }
      if (border.right > 0) {
        ret.add({
          "type": "line",
          "style": border.style,
          "width": border.right,
          "colorRGB": border.colorRGB.toMap(),
          "from": {"x": incLeft + width + this.margin.left, "y": incTop},
          "to": {"x": incLeft + width + this.margin.left, "y": incTop + height},
        });
      }
    }
    //print(ret);
    //print('aqui rect');
    return ret;
  }

  ///
  /// Check if border have an width
  /// and all have sides same width.
  ///
  bool _borderIsRegularBox(FRBorder border) {
    if (border.top <= 0) return false;
    bool ret = (border.top == border.left) == (border.bottom == border.right);

    return ret;
  }

  double pixelToMM(double px) {
    return px * 0.377777;
  }

  double mmToPixel(double mm) {
    return mm / 0.377777;
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

    if (this.style == null) this.style = FRBorderStyle.none;

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
