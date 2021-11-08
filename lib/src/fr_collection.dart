import 'fr_object.dart';
import 'package:meta/meta.dart';

class FRColletion extends FRObject {
  List<FRObject> children;

  FRColletion(
      {height,
      width,
      top,
      left,
      margin,
      padding,
      backgroundColorRGB,
      border,
      fillBackground,
      @required this.children})
      : super(
            margin: margin,
            padding: padding,
            backgroundColorRGB: backgroundColorRGB,
            fillBackground: fillBackground,
            border: border,
            height: height,
            width: width,
            top: top,
            left: left) {
    for (FRObject obj in children) {
      obj.parent = this;
    }
  }

  add(FRObject obj) {
    children.add(obj);
    obj.parent = this;
  }

  @override
  Map<String, dynamic> toMap() {
    var ret = super.toMap();
    List<Map<String, dynamic>> __children;
    __children = [];
    for (FRObject obj in children) {
      __children.add(obj.toMap());
    }
    ret.addAll({"children": __children});

    return ret;
  }
}
