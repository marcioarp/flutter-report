class Report {
  var _layout;
  var _data;
  String _version;
  int _currData = 0;
  setData(var data) {
    _data = data;
  }

  setLayout(var layout) {
    _layout = layout;
  }

  dynamic prepare() {
    var ret = [];
    double incTop = 0;
    double incLeft = 0;

    if (_layout.length > 1) {
    } else {
      for (var pg in _layout) {
        _version = pg['version'];
        incTop = pg['margin']['top'].toDouble();
        incLeft = pg['margin']['left'].toDouble();
        ret.addAll(_processBorder(
          pg["border"],
          pg["backgroundRGB"],
          pg["fillBackground"],
          incTop,
          incLeft,
          (pg["width"] - pg["margin"]["left"] - pg["margin"]["right"])
              .toDouble(),
          (pg["height"] - pg["margin"]["top"] - pg["margin"]["bottom"])
              .toDouble(),
        ));

        for (var bd in pg["bands"]) {
          incTop +=
              bd['margin']['top'].toDouble() + pg["padding"]["top"].toDouble();
          incLeft += bd['margin']['left'].toDouble() +
              pg["padding"]["left"].toDouble();

          if (bd["type"] == "data") {
            for (var dt in _data) {
              ret.addAll(_processBorder(
                bd["border"],
                bd["backgroundRGB"],
                bd["fillBackground"],
                incTop,
                incLeft,
                (pg["width"] -
                        pg["margin"]["left"] -
                        pg["margin"]["right"] -
                        bd["margin"]["left"] -
                        bd["margin"]["right"] -
                        pg["padding"]["left"] -
                        pg["padding"]["right"])
                    .toDouble(),
                (bd["height"]).toDouble(),
              ));

              ret.addAll(_processOBJs(bd["children"], incTop, incLeft, dt));
              _currData++;
              incTop += bd["height"].toDouble();
            }
          } else {
            ret.addAll(_processBorder(
              bd["border"],
              bd["backgroundRGB"],
              bd["fillBackground"],
              incTop,
              incLeft,
              (pg["width"] -
                      pg["margin"]["left"] -
                      pg["margin"]["right"] -
                      bd["margin"]["left"] -
                      bd["margin"]["right"] -
                      pg["padding"]["left"] -
                      pg["padding"]["right"])
                  .toDouble(),
              (bd["height"]).toDouble(),
            ));

            ret.addAll(_processOBJs(
                bd["children"], incTop, incLeft, _data[_currData]));
            incTop +=
                bd["height"].toDouble() + bd['margin']["bottom"].toDouble();
          }
          //decrease to not affect the next band
          incLeft -= bd['margin']['left'].toDouble() -
              pg["padding"]["left"].toDouble();
        }
      }
    }
    return ret;
  }

  dynamic _processBorder(var border, var colorRGB, bool fillBackground,
      double incTop, double incLeft, double width, double height) {
    var ret = [];
    //if (border == null) return ret;
    bool box = _borderIsRegularBox(border);

    if (fillBackground) {
      if (box) {
        ret.add({
          "type": "rect",
          "borderStyle": border["style"],
          "borderColorRGB": border["colorRGB"],
          "fill": true,
          "fillColorRGB": colorRGB,
          "borderWidth": border["top"],
          "from": {"x": incLeft, "y": incTop},
          "to": {"x": incLeft + width, "y": incTop + height},
          "rounded": border["roundend"]
        });
        //print(ret);
        return ret;
      } else {
        ret.add({
          "type": "rect",
          "borderStyle": border["style"],
          "borderColorRGB": [0, 0, 0],
          "fill": true,
          "fillColorRGB": colorRGB,
          "borderWidth": 0,
          "from": {"x": incLeft, "y": incTop},
          "to": {"x": incLeft + width, "y": incTop + height},
          "rounded": border["roundend"]
        });
      }
      //print(ret);
    }

    if (box) {
      ret.add({
        "type": "rect",
        "borderStyle": border["style"],
        "borderColorRGB": border["colorRGB"],
        "fill": false,
        "fillColorRGB": [0, 0, 0],
        "borderWidth": border["top"],
        "from": {"x": incLeft, "y": incTop},
        "to": {"x": incLeft + width, "y": incTop + height},
        "rounded": border["roundend"]
      });
    } else {
      if (border["top"] > 0) {
        ret.add({
          "type": "line",
          "style": border["style"],
          "width": border["top"],
          "colorRGB": border["colorRGB"],
          "from": {"x": incLeft, "y": incTop},
          "to": {"x": incLeft + width, "y": incTop},
        });
      }
      if (border["bottom"] > 0) {
        ret.add({
          "type": "line",
          "style": border["style"],
          "colorRGB": border["colorRGB"],
          "width": border["bottom"],
          "from": {"x": incLeft, "y": incTop + height},
          "to": {"x": incLeft + width, "y": incTop + height},
        });
      }
      if (border["left"] > 0) {
        ret.add({
          "type": "line",
          "style": border["style"],
          "colorRGB": border["colorRGB"],
          "width": border["left"],
          "from": {"x": incLeft, "y": incTop},
          "to": {"x": incLeft, "y": incTop + height},
        });
      }
      if (border["right"] > 0) {
        ret.add({
          "type": "line",
          "style": border["style"],
          "width": border["right"],
          "colorRGB": border["colorRGB"],
          "from": {"x": incLeft + width, "y": incTop},
          "to": {"x": incLeft + width, "y": incTop + height},
        });
      }
    }
    //print(ret);
    return ret;
  }

  /**
   * Check if border is a regular box, with all sides same width.
   */
  bool _borderIsRegularBox(var border) {
    if (border["top"] <= 0) return false;
    bool ret = (border["top"] == border["left"]) ==
        (border["bottom"] == border["right"]);

    return ret;
  }

  List _processOBJs(var objs, double incTop, double incLeft, var data) {
    List ret = [];
    if (objs == null) return ret;
    for (var obj in objs) {
      if (obj['type'] == 'panel') {
        //print(obj['width']);

        var objTemp = _processBorder(
            obj['border'],
            obj['backgroundRGB'],
            obj['fillBackground'],
            incTop + (obj['margin']['top']).toDouble(),
            incLeft + (obj['margin']['left']).toDouble(),
            (obj['width']).toDouble(),
            (obj['height']).toDouble());

        //print(objTemp);
        ret.addAll(objTemp);
        //print("aqui");
        ret.addAll(_processOBJs(
            obj["children"],
            incTop + obj["margin"]["top"] + obj["padding"]["top"] + obj["top"],
            incLeft +
                obj["margin"]["left"] +
                obj["padding"]["left"] +
                obj["left"],
            data));
      }
      if (obj['type'] == 'text') {
        var objRet = new Map.from(obj);
        objRet['text'] = _processText(obj["text"], data);
        objRet['top'] += incTop;
        objRet['left'] += incLeft;
        objRet["height"] = _pixelToMM(objRet["height"].toDouble());
        //print(objRet);

        ret.add(objRet);
      }
      //print(ret);
      return ret;
    }
  }

  String _processText(String txt, var data) {
    //print(txt);
    txt = txt.trim();
    if (txt.substring(0, 1) == '[') {
      //value of field
      var field = txt.substring(1, (txt.length - 1));
      return data[field];
    } else {
      if (txt.indexOf('[') > 0) {
        String ret = txt;
        data.map((k, v) {
          if (k != null) ret = ret.replaceAll("[$k]", v);
          return MapEntry(k, v);
        });
        return ret;
      } else {
        return txt;
      }
    }
  }

  double _pixelToMM(double px) {
    return px * 0.2645833;
  }

  double _mmToPixel(double mm) {
    return mm / 0.2645833;
  }
}
