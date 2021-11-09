import 'package:report/flutter_report.dart';

import 'fr_collection.dart';
import 'fr_text.dart';
import 'package:flutter/cupertino.dart';

class FRBand extends FRColletion {
  bool visible = true;

  FRBand(
      {height,
      margin,
      padding,
      backgroundColorRGB,
      fillBackground,
      border,
      parent,
      boundBox,
      children,
      this.visible})
      : super(
            margin: margin,
            padding: padding,
            backgroundColorRGB: backgroundColorRGB,
            fillBackground: fillBackground,
            border: border,
            children: children,
            height: height) {
    this.type = 'FRBand';
    if (this.visible == null) this.visible = true;
    this.width = 0;
  }
  @override
  set width(double width) {
    super.width = width;
    //this.parent.boundBox.right - this.parent.boundBox.left;
  }

  dynamic process(
      double incTop, double incLeft, dynamic data, int currData, bool devMode) {
    //print(this.parent);
    incTop += this.margin.top + this.parent.padding.top;
    incLeft += this.padding.left + this.parent.padding.left;
    dynamic ret = [];
    this.width = parent.width -
        parent.margin.left -
        parent.margin.right -
        parent.padding.left -
        parent.padding.right -
        margin.left -
        margin.right;

    //print(this.width);

    if (devMode) {
      //show text on baseboard of band
      //print('aqui');
      var objRet = new Map.from(FRText(
              text: "Band: " + this.type,
              fontSize: 7.00,
              textAlign: TextAlign.right,
              width: 99.00)
          .toMap());
      objRet['top'] += incTop + this.height - 9.00;
      objRet['left'] += incLeft +
          this.width -
          100.00 -
          this.margin.right -
          this.parent.padding.right;

      objRet["fontSize"] = this.pixelToMM(objRet["fontSize"].toDouble());
      //print(objRet);
      ret.addAll([objRet]);
    }
    ret.addAll(this.processBorder(incTop, incLeft));
    ret.addAll(this.processOBJs(incTop, incLeft, data, currData, devMode));

    //decrease to not affect the next band
    incLeft -= (this.margin.left + this.padding.left);

    return ret;
  }

  dynamic processOBJs(
      double incTop, double incLeft, dynamic data, int currData, bool devMode) {
    dynamic ret = [];
    //print('aqui9');
    if (this.children == null) return ret;
    FRObject obj;
    for (obj in this.children) {
      if (obj != null) {
        //print('aqui');
        ret.addAll(obj.process(incTop, incLeft, data, currData, devMode));
      } else {
        print('obj is null');
        print(obj);
      }
    }
    return ret;
  }

  /*
  @override
  Map<String, dynamic> toMap() {
    var ret = super.toMap();
    //print(parent);
    if (parent != null) {
      ret['width'] = parent.boundBox.right - parent.boundBox.left;
      ret.addAll({"visible": this.visible});
    }

    return ret;
  }
  */
}

class FRBandStart extends FRBand {
  String type = 'start';
  FRBandStart(
      {margin,
      padding,
      backgroundColorRGB,
      border,
      parent,
      boundBox,
      children,
      visible,
      height})
      : super(
            margin: margin,
            padding: padding,
            backgroundColorRGB: backgroundColorRGB,
            border: border,
            children: children,
            visible: visible,
            height: height) {
    this.type = 'start';
  }

  @override
  Map<String, dynamic> toMap() {
    var ret = super.toMap();
    //ret.addAll({"type": "startPage"});

    return ret;
  }
}

class FRBandHeader extends FRBand {
  String type = 'header';
  FRBandHeader(
      {margin,
      padding,
      backgroundColorRGB,
      border,
      parent,
      boundBox,
      children,
      visible,
      height})
      : super(
            margin: margin,
            padding: padding,
            backgroundColorRGB: backgroundColorRGB,
            border: border,
            children: children,
            visible: visible,
            height: height) {
    this.type = 'header';
  }
  @override
  Map<String, dynamic> toMap() {
    var ret = super.toMap();
    //ret.addAll({"type": 'pageHeader'});

    return ret;
  }
}

class FRBandData extends FRBand {
  String type = 'data';

  FRBandData(
      {margin,
      padding,
      backgroundColorRGB,
      border,
      parent,
      boundBox,
      children,
      visible,
      height})
      : super(
            margin: margin,
            padding: padding,
            backgroundColorRGB: backgroundColorRGB,
            border: border,
            children: children,
            visible: visible,
            height: height) {
    this.type = 'data';
  }
  @override
  Map<String, dynamic> toMap() {
    var ret = super.toMap();
    //ret.addAll({"type": "data"});

    return ret;
  }
}

class FRBandFooter extends FRBand {
  String type = 'footer';

  FRBandFooter(
      {margin,
      padding,
      backgroundColorRGB,
      border,
      parent,
      boundBox,
      children,
      visible,
      height})
      : super(
            margin: margin,
            padding: padding,
            backgroundColorRGB: backgroundColorRGB,
            border: border,
            children: children,
            visible: visible,
            height: height);
  @override
  Map<String, dynamic> toMap() {
    var ret = super.toMap();
    ret.addAll({"type": "footer"});

    return ret;
  }
}

class FRBandEnd extends FRBand {
  String type = 'end';

  FRBandEnd(
      {margin,
      padding,
      backgroundColorRGB,
      border,
      parent,
      boundBox,
      children,
      visible,
      height})
      : super(
            margin: margin,
            padding: padding,
            backgroundColorRGB: backgroundColorRGB,
            border: border,
            children: children,
            visible: visible,
            height: height);
  @override
  Map<String, dynamic> toMap() {
    var ret = super.toMap();
    ret.addAll({"type": "end"});

    return ret;
  }
}
