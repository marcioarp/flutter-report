import 'package:flutter/cupertino.dart';

import 'fr_object.dart';
//import 'package:meta/meta.dart';

class FRText extends FRObject {
  String text;
  double fontSize;
  TextAlign textAlign = TextAlign.left;

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
      @required this.text,
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
