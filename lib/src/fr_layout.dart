import 'fr_object.dart';
import 'fr_band.dart';

class FRLayout extends FRObject {
  List<dynamic> data;
  List<FRBand> bands;
  //int _currData = 0;
  //double _incTop = 0;
  //double _incLeft = 0;
  //bool _devMode = false;
  FRLayout(
      {bands,
      margin,
      padding,
      backgroundColorRGB,
      fillBackground,
      border,
      data})
      : super(
            margin: margin,
            padding: padding,
            backgroundColorRGB: backgroundColorRGB,
            fillBackground: fillBackground,
            border: border) {
    if (bands != null) {
      //print(bands);
      this.bands = bands;
      for (FRBand bd in this.bands) {
        //print(bd.parent);
        bd.parent = this;
      }
    }
    this.data = data;
    //print(this.data);
  }

  @override
  Map<String, dynamic> toMap() {
    var ret = super.toMap();
    //print(ret);
    List<dynamic> bands = [];
    for (FRBand bd in this.bands) {
      bands.add(bd.toMap());
    }
    ret.addAll({"bands": bands});
    return ret;
  }

  dynamic process(
      double incTop, double incLeft, dynamic data, int currData, bool devMode) {
    //print(this.data);
    //var pg = this.toMap();
    var ret = [];

    /*
    incTop = pg['margin']['top'].toDouble();
    incLeft = pg['margin']['left'].toDouble();
    */
    incTop = incTop + this.margin.top;
    incLeft = incLeft + this.margin.left;
    ret.addAll(this.processBorder(incTop, incLeft));
    incTop = incTop + this.padding.top;
    incLeft = incLeft + this.padding.left;

    if (this.bands != null) {
      //print(this.bands);
      for (FRBand bd in this.bands) {
        var listTemp = bd.process(incTop, incLeft, data, currData, devMode);
        // this._processBand(bd);
        //print('aqui');
        if (listTemp != null) ret.addAll(listTemp);
      }
    }

    return ret;
  }
  /*
  dynamic _processBand(FRBand bd) {
    var ret = [];
    for (FRBand bd in this.bands) {
      //print('aqui band');
      //print(bd.type);
      this._incTop += bd.margin.top + this.margin.top;
      this._incLeft += bd.margin.top + this.padding.left;

      if (this._devMode) {
        var objRet = new Map.from(FRText(
                text: bd.type,
                fontSize: 6.00,
                textAlign: TextAlign.right,
                width: 100.00)
            .toMap());
        objRet['top'] += this._incTop + bd.height - 8.00;
        objRet['left'] += bd.width - 100.00 - bd.margin.right;

        objRet["fontSize"] = _pixelToMM(objRet["fontSize"].toDouble());
        //print(objRet);
        ret.addAll([objRet]);
      }

      if (bd.type == "data") {
        for (var dt in this.data) {
          //print(dt);
          ret.addAll(bd.processBorder(this._incTop, this._incLeft));

          ret.addAll(
              _processOBJs(bd.children, this._incTop, this._incLeft, dt));
          _currData++;
          this._incTop += bd.height;
          if (this._devMode) {
            _currData = this.data.length - 1;
            break;
          }
        }
      } else {
        ret.addAll(bd.processBorder(
          this._incTop,
          this._incLeft,
        ));

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
      }

      //decrease to not affect the next band
      this._incLeft -= (bd.margin.left + this.padding.left);
    }
    return ret;
  }

  List _processOBJs(
      List<FRObject> objs, double incTop, double incLeft, var data) {
    List ret = [];
    //print(objs);
    if (objs == null) return ret;
    FRObject obj;
    for (obj in objs) {
      var objTemp = this.processBorder(
        incTop + (obj.margin.top + obj.top),
        incLeft + obj.margin.left + obj.left,
      );

      //print(objTemp);
      ret.addAll(objTemp);

      if (obj.type == 'FRPanel') {
        ret.addAll(_processOBJs(
            (obj as FRPanel).children,
            incTop +
                (obj as FRPanel).margin.top +
                (obj as FRPanel).padding.top +
                (obj as FRPanel).top,
            incLeft +
                (obj as FRPanel).margin.left +
                (obj as FRPanel).padding.left +
                (obj as FRPanel).left,
            data));
      } else if (obj.type == 'FRText') {
        var objRet = obj.toMap();
        objRet['text'] = _processText((obj as FRText).text, data);
        objRet['top'] +=
            incTop + (obj as FRText).margin.top + (obj as FRText).padding.top;
        objRet['left'] += incLeft +
            (obj as FRText).margin.left +
            (obj as FRText).padding.left;
        objRet["fontSize"] = _pixelToMM(objRet["fontSize"].toDouble());
        //print(objRet);

        ret.add(objRet);
      } else if (obj.type == 'FRLayout') {
        //ret.addAll((obj as FRLayout).process(incTop, incLeft));
        //print(ret);
      } else {
        ///print("Objeto não implementado: " + obj.type);
        //print(obj);
      }
    }
    return ret;
  }

  String _processText(String txt, var data) {
    if (this._devMode) return txt;

    //print(txt);
    txt = txt.trim();
    if (txt.length < 1) {
      return txt;
    }
    if (txt.substring(0, 1) == '[') {
      //value of field
      var field = txt.substring(1, (txt.length - 1));
      return data[field];
    } else {
      if (txt.indexOf('[') > 0) {
        String ret = txt;
        data.map((k, v) {
          var strK = k.toString();
          var strV = v.toString();
          if (k != null) ret = ret.replaceAll("[$strK]", strV);
          return MapEntry(k, v);
        });
        return ret;
      } else {
        return txt;
      }
    }
  }
  */

}
