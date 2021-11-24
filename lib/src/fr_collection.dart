import 'fr_object.dart';
import '../globals.dart' as g;
//import 'package:meta/meta.dart';

class FRColletion extends FRObject {
  List<FRObject> children;

  FRColletion(
      {height,
      width,
      top,
      left,
      margin,
      padding,
      backgroundColor,
      border,
      fillBackground,
      required this.children})
      : super(
            margin: margin,
            padding: padding,
            backgroundColor: backgroundColor,
            border: border,
            height: height,
            width: width,
            top: top,
            left: left) {
    this.type = 'colletion';
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

  dynamic processOBJs(dynamic data, int level) {
    dynamic ret = [];
    FRObject obj;
    for (obj in this.children) {
      obj.startLeft = startLeft + this.padding.left + this.margin.left;
      obj.startTop = startTop + this.padding.top + this.margin.top;
      ret.addAll(obj.process(data, level + 1));
    }

    return ret;
  }
}
