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
    print(this.width);

    if (devMode) {
      //show text on baseboard of band
      //print('aqui');
      var objRet = new Map.from(FRText(
              text: "Band: " + this.type,
              fontSize: 6.00,
              textAlign: TextAlign.right,
              width: 100.00)
          .toMap());
      objRet['top'] += incTop + this.height - 8.00;
      objRet['left'] += incLeft +
          this.width -
          100.00 -
          this.margin.right -
          this.parent.padding.right;

      objRet["fontSize"] = this.pixelToMM(objRet["fontSize"].toDouble());
      print(objRet);
      ret.addAll([objRet]);
    }

    if (this.type == "data") {
      for (var dt in data) {
        //print(dt);
        ret.addAll(this.processBorder(incTop, incLeft));
        /*
          ret.addAll(
              _processOBJs(bd.children, this._incTop, this._incLeft, dt));
          _currData++;
          this._incTop += bd.height;
          if (this._devMode) {
            _currData = this.data.length - 1;
            break;
          }
          */
      }
    } else {
      ret.addAll(this.processBorder(
        incTop,
        incLeft,
      ));

      /*
        if (bd.children.length > 0) {
          //print(bd.children);
          //print(bd);
          //print(this.data);
          //print(_currData);
          if (_currData < this.data.length) {
            ret.addAll(_processOBJs(bd.children, this._incTop, this._incLeft,
                this.data[_currData]));
            this._incTop += bd.height + bd.margin.bottom;
          }
        }
        */
    }

    //decrease to not affect the next band
    incLeft -= (this.margin.left + this.padding.left);

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
  String type = 'startPage';
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
    this.type = 'startPage';
  }

  @override
  Map<String, dynamic> toMap() {
    var ret = super.toMap();
    //ret.addAll({"type": "startPage"});

    return ret;
  }
}

class FRBandHeader extends FRBand {
  String type = 'pageHeader';
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
    this.type = 'pageHeader';
  }
  @override
  Map<String, dynamic> toMap() {
    var ret = super.toMap();
    //ret.addAll({"type": 'pageHeader'});

    return ret;
  }
}

class FRBandGroupHeader extends FRBand {
  String type = 'groupHeader';
  String groupRule = '';

  FRBandGroupHeader(
      {margin,
      padding,
      backgroundColorRGB,
      border,
      parent,
      boundBox,
      children,
      visible,
      height,
      this.groupRule})
      : super(
            margin: margin,
            padding: padding,
            backgroundColorRGB: backgroundColorRGB,
            border: border,
            children: children,
            visible: visible,
            height: height) {
    this.type = 'groupHeader';
  }
  @override
  Map<String, dynamic> toMap() {
    var ret = super.toMap();
    //ret.addAll({"type": 'groupHeader'});

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

class FRBandGroupFooter extends FRBand {
  FRBandGroupFooter(
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
    ret.addAll({"type": "groupFooter"});

    return ret;
  }
}

class FRBandFooter extends FRBand {
  String type = 'pageFooter';

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
    ret.addAll({"type": "pageFooter"});

    return ret;
  }
}

class FRBandEnd extends FRBand {
  String type = 'endPage';

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
    ret.addAll({"type": "endPage"});

    return ret;
  }
}
