import 'package:report/flutter_report.dart';

import 'fr_collection.dart';
import 'fr_text.dart';
import 'package:flutter/cupertino.dart';
import '../globals.dart' as g;

class FRBand extends FRColletion {
  bool visible = true;

  FRBand(
      {height,
      margin,
      padding,
      backgroundColor,
      border,
      parent,
      boundBox,
      required children,
      visible})
      : super(
            margin: margin,
            padding: padding,
            backgroundColor: backgroundColor,
            border: border,
            children: children,
            height: height) {
    this.type = 'FRBand';
    if (visible != null) this.visible = true;
    this.width = 0;
    this.top = 0;
    this.left = 0;
  }
  @override
  set width(double width) {
    super.width = width;

    //this.parent.boundBox.right - this.parent.boundBox.left;
  }

  dynamic process(dynamic data, int level) {
    //print(this.parent);
    dynamic ret = [];
    this.width = this.parent!.utilWidth() - margin.left - margin.right;
    //print(this.width);
    ret.addAll(this.processBorder());

    //startTop += this.padding.top;
    //startLeft += this.padding.left;
    if (g.devMode) {
      //show text on baseboard of band
      //print('aqui');
      var objRet = new Map.from(FRText(
              text: "Band: " + this.type,
              fontSize: 7.00,
              textAlign: TextAlign.right,
              width: 99.00)
          .toMap());
      objRet['top'] +=
          startTop + this.height - 8.7 - this.padding.top + this.margin.top;
      objRet['left'] += startLeft +
          this.width -
          100.00 -
          this.margin.right -
          this.parent!.padding.right -
          (this.padding.left *
              2) - //multiply by 2 to decrease the inc left made before if
          this.margin.left;

      objRet["fontSize"] = this.pixelToMM(objRet["fontSize"].toDouble());
      //print(objRet);
      ret.addAll([objRet]);
    }

    if (data != null) {
      ret.addAll(this.processOBJs(data, level + 1));
    }

    return ret;
  }

  void newPage(dynamic objsTemp) {
    (parent as FRLayout).newPage(objsTemp);
  }
}

class FRBandStart extends FRBand {
  String type = 'start';
  FRBandStart(
      {margin,
      padding,
      backgroundColor,
      border,
      parent,
      boundBox,
      required children,
      visible,
      height})
      : super(
            margin: margin,
            padding: padding,
            backgroundColor: backgroundColor,
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
      backgroundColor,
      border,
      parent,
      boundBox,
      required children,
      visible,
      height})
      : super(
            margin: margin,
            padding: padding,
            backgroundColor: backgroundColor,
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
      backgroundColor,
      border,
      parent,
      boundBox,
      required children,
      visible,
      height})
      : super(
            margin: margin,
            padding: padding,
            backgroundColor: backgroundColor,
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
      backgroundColor,
      border,
      parent,
      boundBox,
      required children,
      visible,
      height})
      : super(
            margin: margin,
            padding: padding,
            backgroundColor: backgroundColor,
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
      backgroundColor,
      border,
      parent,
      boundBox,
      required children,
      visible,
      height})
      : super(
            margin: margin,
            padding: padding,
            backgroundColor: backgroundColor,
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
