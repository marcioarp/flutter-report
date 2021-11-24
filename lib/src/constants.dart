import 'package:flutter/material.dart';

class FRRGBColor {
  int r;
  int g;
  int b;

  FRRGBColor(this.r, this.g, this.b);

  List<int?> toMap() {
    return [r, g, b];
  }
}

class FRMargin {
  double top = 0;
  double left = 0;
  double right = 0;
  double bottom = 0;

  FRMargin({top, left, right, bottom}) {
    if (top != null) this.top = top;
    if (left != null) this.left = left;
    if (right != null) this.right = right;
    if (bottom != null) this.bottom = bottom;
  }

  Map<String, double?> toMap() {
    return {"top": top, "left": left, "right": right, "bottom": bottom};
  }
}

class FRBorderStyle {
  FRBorderStyle._();
  static const none = 'none';
  static const solid = 'solid';
  static const dashed = 'dashed';
}

class FRGenerateOn {
  FRGenerateOn._();
  static const allData = 'allData';
  static const firstData = 'firstData';
  static const lastData = 'lastData';
}

class FRPaperSize {
  FRPaperSize._();
  static const a0 = [841, 1189];
  static const a1 = [594, 841];
  static const a2 = [420, 594];
  static const a3 = [297, 420];
  static const a4 = [210, 297];
  static const a5 = [148, 210];
  static const a6 = [105, 148];
  static const a7 = [74, 105];
  static const continuous80mm = [80, double.infinity];
  static const continuous58mm = [58, double.infinity];
  static const continuous110mm = [110, double.infinity];
}

class FRBoundBox {
  double top = 0;
  double left = 0;
  double right = 0;
  double bottom = 0;

  FRBoundBox({top, left, right, bottom}) {
    if (top != null) this.top = top;
    if (left != null) this.left = left;
    if (right != null) this.right = right;
    if (bottom != null) this.bottom = bottom;
  }

  Map<String, double?> toMap() {
    return {"top": top, "left": left, "right": right, "bottom": bottom};
  }
}

class FRPadding {
  double top = 0;
  double left = 0;
  double right = 0;
  double bottom = 0;

  FRPadding({top, left, right, bottom}) {
    if (top != null) this.top = top;
    if (left != null) this.left = left;
    if (right != null) this.right = right;
    if (bottom != null) this.bottom = bottom;
  }

  Map<String, double?> toMap() {
    return {"top": top, "left": left, "right": right, "bottom": bottom};
  }
}

class FRBorder {
  bool rounded = false;
  String style = 'solid';
  Color color = Colors.white;
  double top = 0;
  double left = 0;
  double right = 0;
  double bottom = 0;

  FRBorder(Border? b) {
    if (b != null) {
      this.fromBorder(b);
    }
  }

  fromBorder(Border b) {
    //return false;
    try {
      String style = 'none';
      Color cl = Colors.white;
      if (b.top.width > 0) {
        style = 'solid';
        cl = b.top.color;
      }
      if (b.left.width > 0) {
        style = 'solid';
        cl = b.left.color;
      }
      if (b.right.width > 0) {
        style = 'solid';
        cl = b.right.color;
      }
      if (b.bottom.width > 0) {
        style = 'solid';
        cl = b.bottom.color;
      }

      this.top = b.top.width;
      this.left = b.left.width;
      this.right = b.right.width;
      this.bottom = b.bottom.width;
      this.color = cl;
      this.style = style;
    } on Exception catch (e) {
      print(e);
    }
  }

  Map<String, dynamic> toMap() {
    return {
      "top": top,
      "left": left,
      "right": right,
      "bottom": bottom,
      "colorRGB": [color.red, color.green, color.blue],
      "style": style
    };
  }
}
