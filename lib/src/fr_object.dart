import 'constants.dart';
import 'package:flutter/material.dart';
import '../globals.dart' as g;

class FRObject {
  FRMargin margin = FRMargin();
  FRPadding padding = FRPadding();
  //FRRGBColor backgroundColorRGB;
  Color backgroundColor = Colors.transparent;
  bool _fillBackground = false;
  Border border = Border.all(color: Colors.black, width: 1);
  FRObject? parent;
  late FRBoundBox boundBox;
  double _width = 10;
  double _height = 10;
  double _top = 0;
  double _left = 0;
  String type = 'Object';
  double _startTop = 0;
  double _startLeft = 0;
  double extendHeight = 0;

  //double _initialTop = 0;
  //double _initialHeight = 0;

  bool _autoHeight = false;
  //double _totalHeight = 0;

  FRObject(
      {margin,
      padding,
      backgroundColor,
      border,
      top,
      left,
      height,
      width,
      autoHeight}) {
    this.type = 'object';

    if (autoHeight != null) {
      this.autoHeight = autoHeight;
    }

    if (margin != null) {
      this.margin = margin;
    }
    if (padding != null) {
      //print(padding.left);
      this.padding = padding;
    }

    if (backgroundColor == null) {
      this.backgroundColor = Colors.white;
      _fillBackground = false;
    } else {
      this.backgroundColor = backgroundColor;
      _fillBackground = true;
    }

    if (border != null) {
      this.border = border;
    }

    boundBox = FRBoundBox();

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
/*
  double get initialTop => _initialTop;
  set initialTop(double value) {
    _initialTop = value;
  }
*/
  double get startTop => _startTop;
  set startTop(double value) {
    //_initialTop = value;
    _startTop = value;
  }

  double get startLeft => _startLeft;
  set startLeft(double value) {
    _startLeft = value;
  }

  double get width => _width;

  set width(double width) {
    _width = width;
    _calcBoundBox();
  }

  bool get autoHeight => _autoHeight;
  set autoHeight(bool value) {
    _autoHeight = value;
    //print('autoHeight: $value');
    if (this.parent != null) {
      this.parent!.autoHeight = value;
    }
  }

  // double get totalHeight => _totalHeight;

  double get height => _height;

  set height(double height) {
    _height = height;
    //_initialHeight = height;
    _calcBoundBox();
  }

  //double get initialHeight => _initialHeight;

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
      ret += parent!.pageTop();
    }
    return ret;
  }

  /// Return the left of object relative a full page
  double pageLeft() {
    double ret = margin.left + padding.left + left;
    if (parent != null) {
      ret += parent!.pageTop();
    }
    return ret;
  }

  double utilWidth() {
    double ret = width - padding.left - padding.right;
    return ret;
  }

  void _calcBoundBox() {
    boundBox.top = pageTop();
    boundBox.left = pageLeft();
    boundBox.right = boundBox.left + width;
    boundBox.bottom = boundBox.top + height;
  }

  Map<String, dynamic> toMap() {
    FRBorder b = FRBorder(this.border);
    return {
      "margin": margin.toMap(),
      "padding": padding.toMap(),
      "backgroundColorRGB": colorToArray(backgroundColor),
      "fillBackground": _fillBackground,
      "border": b.toMap(),
      "boundBox": boundBox.toMap(),
      "width": _width,
      "height": _height,
      "top": _top,
      "left": _left
    };
  }

  dynamic colorToArray(Color cl) {
    return [cl.red, cl.green, cl.blue];
  }

  dynamic process(dynamic data) {
    print('process not implemented');
    return [];
  }

  dynamic processBorder() {
    //print(this.type);
    //if (this.type == 'startPage') return [];
    var ret = [];
    //return ret;
    //if (border == null) return ret;
    FRBorder b = FRBorder(border);
    bool box = _borderIsRegularBox(b);

    if (_fillBackground) {
      if (box) {
        ret.add({
          "type": "rect",
          "borderStyle": b.style,
          "borderColorRGB": colorToArray(b.color),
          "fill": true,
          "fillColorRGB": colorToArray(backgroundColor),
          "borderWidth": border.top.width,
          "from": {
            "x": startLeft + this.left + this.margin.left,
            "y": startTop + this.top + this.margin.top
          },
          "to": {
            "x": startLeft + width + this.margin.left + this.left,
            "y": startTop +
                height +
                this.top +
                this.margin.top +
                this.extendHeight
          },
          "rounded": b.rounded
        });
        //print(ret);
        return ret;
      } else {
        ret.add({
          "type": "rect",
          "borderStyle": b.style,
          "borderColorRGB": [0, 0, 0],
          "fill": true,
          "fillColorRGB": colorToArray(backgroundColor),
          "borderWidth": 0,
          "from": {
            "x": startLeft + this.margin.left + this.left,
            "y": startTop + this.top + this.margin.top
          },
          "to": {
            "x": startLeft + width + this.margin.left + this.left,
            "y": startTop +
                height +
                this.top +
                this.margin.top +
                this.extendHeight
          },
          "rounded": b.rounded
        });
      }
      //print(ret);
    }

    if (box) {
      //print('box');
      ret.add({
        "type": "rect",
        "borderStyle": b.style,
        "borderColorRGB": colorToArray(b.color),
        "fill": false,
        "fillColorRGB": [0, 0, 0],
        "borderWidth": b.top,
        "from": {
          "x": startLeft + this.margin.left + this.left,
          "y": startTop + this.margin.top + this.top
        },
        "to": {
          "x": startLeft + this.width + this.margin.left + this.left,
          "y":
              startTop + this.height + this.margin.top + this.top + extendHeight
        },
        "rounded": b.rounded
      });
      //print(this.width);
    } else {
      if (b.top > 0) {
        //top line
        ret.add({
          "type": "line",
          "style": b.style,
          "width": b.top,
          "colorRGB": colorToArray(b.color),
          "from": {
            "x": startLeft + this.margin.left + this.left,
            "y": startTop + this.margin.top + this.top
          },
          "to": {
            "x": startLeft + width + this.margin.left + this.left,
            "y": startTop + this.margin.top + this.top + extendHeight
          },
        });
      }
      if (b.bottom > 0) {
        //bottom line
        ret.add({
          "type": "line",
          "style": b.style,
          "colorRGB": colorToArray(b.color),
          "width": b.bottom,
          "from": {
            "x": startLeft + this.margin.left + this.left,
            "y": startTop + height + this.margin.top + this.top
          },
          "to": {
            "x": startLeft + width + this.margin.left + this.left,
            "y": startTop + height + this.margin.top + this.top + extendHeight
          },
        });
      }
      if (b.left > 0) {
        //left line
        ret.add({
          "type": "line",
          "style": b.style,
          "colorRGB": colorToArray(b.color),
          "width": b.left,
          "from": {
            "x": startLeft + this.margin.left + this.left,
            "y": startTop + this.margin.top + this.top
          },
          "to": {
            "x": startLeft + this.margin.left + this.left,
            "y": startTop + height + this.margin.top + this.top + extendHeight
          },
        });
      }
      if (b.right > 0) {
        //right line
        ret.add({
          "type": "line",
          "style": b.style,
          "width": b.right,
          "colorRGB": colorToArray(b.color),
          "from": {
            "x": startLeft + width + this.margin.left + this.left,
            "y": startTop + this.margin.top + this.top
          },
          "to": {
            "x": startLeft + width + this.margin.left + this.left,
            "y": startTop + height + this.margin.top + this.top + extendHeight
          },
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
