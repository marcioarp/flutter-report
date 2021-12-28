import 'fr_object.dart';
import 'fr_page.dart';
import 'fr_layout.dart';
import '../globals.dart' as g;
//import 'package:meta/meta.dart';

class FRColletion extends FRObject {
  List<FRObject> children;
  double extendHeight = 0;
  bool continuePage = false;

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
      autoHeight,
      required this.children})
      : super(
            margin: margin,
            padding: padding,
            backgroundColor: backgroundColor,
            border: border,
            height: height,
            width: width,
            top: top,
            left: left,
            autoHeight: autoHeight) {
    this.type = 'colletion';
    for (FRObject obj in children) {
      obj.parent = this;
      if (obj.autoHeight) {
        //print('aqui ');
        this.autoHeight = true;
      }
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

  dynamic processOBJs(dynamic data) {
    dynamic ret = {
      "continue": false,
      "extendHeight": 0,
      "levels": [],
      "objs": []
    };
    continuePage = false;
    dynamic retTemp;
    FRObject obj;
    String fieldName;
    for (obj in this.children) {
      /*
      if (obj.type == 'layout') {
        if (!incluveSubLevels) {
          continue;
        }
      }
      */
      obj.startLeft = startLeft + this.padding.left + this.margin.left;
      obj.startTop = startTop + this.padding.top + this.margin.top;

      obj.extendHeight = 0;
      if (obj.type == 'layout') {
        fieldName = (obj as FRLayout).dataFieldName;
        //fieldName = (obj as FRLayout).dataFieldName;
        retTemp = obj.process(data[fieldName]);
        if (!continuePage) {
          continuePage = obj.continuePage;
          //print(continuePage);
        }
      } else {
        retTemp = obj.process(data);
      }
      if (obj.extendHeight > this.extendHeight) {
        this.extendHeight = obj.extendHeight;
        //print(obj.extendHeight);
      }
      //print(retTemp);
      ret["objs"].addAll(retTemp["objs"]);
    }

    return ret;
  }
}
