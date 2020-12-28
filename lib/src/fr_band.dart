import 'fr_collection.dart';

class FRBand extends FRColletion {
  bool visible = true;
  static const type = 'interface';

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
    if (this.visible == null) this.visible = true;
  }
  @override
  Map<String, dynamic> toMap() {
    var ret = super.toMap();
    print(parent);
    if (parent != null) {
      ret['width'] = parent.boundBox.right - parent.boundBox.left;
      ret.addAll({"visible": this.visible});
    }

    return ret;
  }
}

class FRBandStart extends FRBand {
  static const type = 'startPage';
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
            height: height);

  @override
  Map<String, dynamic> toMap() {
    var ret = super.toMap();
    ret.addAll({"type": "startPage"});

    return ret;
  }
}

class FRBandPageHeader extends FRBand {
  static const type = 'pageHeader';
  FRBandPageHeader(
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
    ret.addAll({"type": 'pageHeader'});

    return ret;
  }
}

class FRBandGroupHeader extends FRBand {
  static const type = 'groupHeader';
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
            height: height);
  @override
  Map<String, dynamic> toMap() {
    var ret = super.toMap();
    ret.addAll({"type": 'groupHeader'});

    return ret;
  }
}

class FRBandData extends FRBand {
  static const type = 'data';

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
            height: height);
  @override
  Map<String, dynamic> toMap() {
    var ret = super.toMap();
    ret.addAll({"type": "data"});

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

class FRBandPageFooter extends FRBand {
  static const type = 'pageFooter';

  FRBandPageFooter(
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
  static const type = 'endPage';

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
