import 'package:flutter/cupertino.dart';

import 'fr_object.dart';
import '../globals.dart' as g;

class FRText extends FRObject {
  String _text = '';
  double fontSize;
  TextAlign? textAlign = TextAlign.left;
  bool _calculated = false;

  FRText(
      {margin,
      padding,
      backgroundColor,
      border,
      top,
      left,
      width,
      height,
      autoHeight,
      this.textAlign,
      required text,
      required this.fontSize})
      : super(
          margin: margin,
          padding: padding,
          backgroundColor: backgroundColor,
          border: border,
          top: top,
          left: left,
          width: width,
          height: height,
          autoHeight: autoHeight,
        ) {
    this.type = 'text';
    this.text = text;
    this.height = 5;
  }

  set text(String text) {
    this._text = text;
    this._calculated = text.contains('[');
  }

  String get text {
    return _text;
  }

  bool isCalculated() {
    return this._calculated;
  }

  String _processText(dynamic data, String text) {
    //print(data);
    if (data is Map) {
      for (var key in data.keys) {
        text = text.replaceAll('[' + key + ']', data[key].toString());
      }
    }
    return text;
  }

  dynamic process(dynamic data) {
    dynamic ret = {"continue": false, "index_continue": 0, "objs": []};
    ret["objs"].addAll(processBorder());
    var map = this.toMap();
    //print('aqui2');
    //print(ret);
    map['top'] += startTop;
    map['left'] += startLeft;
    map['fontSize'] = pixelToMM(map["fontSize"].toDouble());
    if (this._calculated && !g.devMode) {
      map['text'] = _processText(data, this.text);
    }
    ret["objs"].add(map);
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
