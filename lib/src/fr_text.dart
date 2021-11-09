import 'package:flutter/cupertino.dart';

import 'fr_object.dart';
//import 'package:meta/meta.dart';

class FRText extends FRObject {
  String _text;
  double fontSize;
  TextAlign textAlign = TextAlign.left;
  bool _calculated = false;

  FRText(
      {margin,
      padding,
      backgroundColorRGB,
      fillBackground,
      border,
      top,
      left,
      width,
      height,
      this.textAlign,
      @required text,
      @required this.fontSize})
      : super(
          margin: margin,
          padding: padding,
          backgroundColorRGB: backgroundColorRGB,
          fillBackground: fillBackground,
          border: border,
          top: top,
          left: left,
          width: width,
          height: height,
        ) {
    this.type = 'FRText';
    this.text = text;
    this.height = 5;
  }

  set text(String text) {
    this._text = text;
    this._calculated = text.contains('[');
  }

  get text {
    return this._text;
  }

  bool isCalculated() {
    return this._calculated;
  }

  dynamic process(
      double incTop, double incLeft, dynamic data, int currData, bool devMode) {
    var ret = [];
    ret.addAll(processBorder(incTop, incLeft));
    var map = this.toMap();
    //print('aqui2');
    //print(ret);
    map['top'] += incTop;
    map['left'] += incLeft;
    map['fontSize'] = pixelToMM(map["fontSize"].toDouble());
    ret.add(map);
    return ret;
  }

  @override
  Map<String, dynamic> toMap() {
    var ret = super.toMap();
    String align = 'left';
    if (this.textAlign == TextAlign.center)
      align = 'center';
    else if (this.textAlign == TextAlign.justify)
      align = 'justify';
    else if (this.textAlign == TextAlign.right) align = 'right';
    //print(align);

    ret.addAll({
      "text": this.text,
      "type": "text",
      "fontSize": this.fontSize,
      "align": align
    });
    //print(ret);
    return ret;
  }
}
