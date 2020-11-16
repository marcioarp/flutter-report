library report;

/**
 * A Box relative a origin of page
 */
class RPBoundBox {
  double top = 0;
  double left = 0;
  double height = 10;
  double width = 10;
}

class RPMargin {
  double top = 2;
  double left = 2;
  double bottom = 2;
  double right = 2;
}

class RPPadding {
  double top = 2;
  double left = 2;
  double bottom = 2;
  double right = 2;
}

class Report {
  var _layout;
  var _data;
  int _currData = 0;
  setData(var data) {
    _data = data;
  }

  setLayout(var layout) {
    _layout = layout;
  }

  dynamic generate() {
    var ret = [];
    double incTop = 0;
    double incLeft = 0;
    if (_layout.length > 1) {
    } else {
      for (var pg in _layout) {
        incTop = pg['margin']['top'].toDouble();
        incLeft = pg['margin']['left'].toDouble();
        ret.addAll(_processBorder(
            pg["border"], pg["backgroundRGB"], pg["fillBackground"]));
        for (var bd in pg["bands"]) {
          incTop += bd['margin']['top'];
          incLeft += bd['margin']['left'];
          ret.addAll(_processBorder(
              bd["border"], bd["backgroundRGB"], bd["fillBackground"]));
          if (bd["type"] == "data") {
            for (var dt in _data) {
              ret.addAll(_processOBJs(
                  bd["children"], incTop, incLeft, _data[_currData]));
              _currData++;
              incTop += bd["height"];
            }
          } else {
            ret.addAll(_processOBJs(
                bd["children"], incTop, incLeft, _data[_currData]));
            incTop += bd["height"];
          }
          //decrease to not affect the next band
          incLeft -= bd['margin']['left'];
        }
      }
    }
    print(ret);
  }

  dynamic _processBorder(var border, var colorRGB, bool fillBackground) {}

  List _processOBJs(var objs, double incTop, double incLeft, var currData) {
    List ret = [];
    if (objs == null) return ret;
    for (var obj in objs) {
      if (obj['type'] == 'panel') {
        ret.addAll(_processOBJs(
            obj["children"],
            incTop + obj["margin"]["top"] + obj["padding"]["top"],
            incLeft + obj["margin"]["left"] + obj["padding"]["left"],
            currData));
      }
      if (obj['type'] == 'text') {
        var objRet = obj;
        objRet['text'] = _processText(obj["text"], currData);

        ret.add(objRet);
      }
      //print(ret);
      return ret;
    }
  }

  String _processText(String txt, var currData) {
    txt = txt.trim();
    if (txt.substring(0, 1) == '[') {
      //value of field
      var field = txt.substring(1, (txt.length - 1));
      return currData[field];
    } else {
      if (txt.indexOf('[') > 0) {
        String ret = txt;
        currData.map((k, v) {
          if (k != null) ret = ret.replaceAll("[$k]", v);
          return MapEntry(k, v);
        });
        return ret;
      } else {
        return txt;
      }
    }
  }
}
