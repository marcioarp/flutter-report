import 'package:report/flutter_report.dart';

import 'fr_object.dart';
import 'fr_band.dart';
import '../globals.dart' as g;

class FRLayout extends FRObject {
  List<dynamic> data = [];
  List<FRBand> bands = [];
  String dataFieldName = '';
  double _maxDataHeight = -1;
  double _incTop = 0;
  bool continuePage = false;
  //int headerPrinted = -1;
  //double _incLeft = 0;
  //bool _devMode = false;
  FRLayout(
      {bands,
      margin,
      padding,
      backgroundColor,
      border,
      data,
      dataFieldName,
      top,
      left,
      width,
      height,
      autoHeight,
      devMode})
      : super(
            margin: margin,
            padding: padding,
            backgroundColor: backgroundColor,
            border: border,
            top: top,
            left: left,
            width: width,
            height: height,
            autoHeight: autoHeight) {
    if (bands != null) {
      //print(bands);
      this.bands = bands;
      for (FRBand bd in this.bands) {
        //print(bd.parent);
        bd.parent = this;
      }
    }
    if (data != null) {
      this.data = data;
    }

    if (dataFieldName != null) {
      this.dataFieldName = dataFieldName;
    }
    this.type = 'layout';
  }
  get maxDataHeight {
    //if (_maxDataHeight <= 0) {
    if (this.type == 'page') {
      _maxDataHeight = this.height - this.padding.bottom - this.margin.bottom;
    } else {
      _maxDataHeight = height - this.padding.top - this.padding.bottom;
    }

    for (FRBand bd in this.bands) {
      if ((bd.type == 'footer') || (bd.type == 'end')) {
        _maxDataHeight -= bd.height;
      }
    }
    //}
    return _maxDataHeight;
  }

  dynamic process(dynamic data) {
    this.data = data;
    _incTop = 0;
    dynamic ret = {
      "continue": false,
      "extendHeight": 0,
      "levels": [],
      "objs": []
    };

    dynamic objs = [];
    dynamic objsBands = [];

    startTop += margin.top + padding.top;
    //startLeft += margin.left + padding.left;

    objsBands.addAll(processHeader(false));
    objsBands.addAll(processData(false));
    objsBands.addAll(processFooter(false));

    ret["objs"].addAll(objs);
    ret["objs"].addAll(objsBands);
    //ret["objs"].addAll(processBorder());

    return ret;
  }

  dynamic processHeader(bool recursive) {
    dynamic ret = [];
    //page will print your own header

    ret.addAll(this.processBorder());
    if (recursive) {
      _incTop = 0;
    }

    for (FRBand bd in this.bands) {
      if (recursive) {
        bd.startTop = 0;
      }
      if ((bd.type == 'start') || (bd.type == 'header')) {
        bd.startLeft = startLeft + this.padding.left + this.left;
        bd.startTop = startTop + this.padding.top + _incTop + this.top;

        ret.addAll(bd.process(data[0])["objs"]);
        //if (recalcTop) _incTop += bd.height + bd.margin.top + bd.margin.bottom;
        _incTop +=
            bd.height + bd.margin.top + bd.margin.bottom + bd.extendHeight;
      }
    }

    if (recursive) {
      if (this.type == 'layout') {
        startTop = 0;
        ret.addAll((parent as FRBand).processHeader(true));
        //ret.addAll(this.process(itemData[itemCurrData], level)["objs"]);
      }
      if (this.type == 'page') {
        return ret;
      }
    }

    return ret;
  }

  dynamic processData(bool recursive) {
    dynamic ret = [];
    dynamic retBands = [];

    //bool bandContinue = false;

    //print(maxDataHeight);
    int currPage = 0;

    for (int i = 0; i < this.data.length; i++) {
      for (FRBand bd in this.bands) {
        if (bd.type == 'data') {
          bd.startLeft = startLeft + this.left + this.padding.left;
          bd.startTop = startTop + this.top + this.padding.top + _incTop;
          bd.extendHeight = 0;
          retBands = bd.process(data[i]);

          if (bd.continuePage) {
            processFooter(false);
            currPage++;
            g.additional_pages.add({
              "config": {"headers": false},
              "objs": []
            });
            bd.startTop = 0;
            g.additional_pages[currPage - 1]["objs"]
                .addAll(this.processHeader(true));
            //print('aqui');
          }
          if (currPage > 0) {
            g.additional_pages[currPage - 1]["objs"].addAll(retBands['objs']);
            //continue;
            //print('aqui');
          } else {
            ret.addAll(retBands["objs"]);
          }

          //ret.addAll(retBands["objs"]);

          _incTop +=
              bd.margin.top + bd.margin.bottom + bd.height + bd.extendHeight;

          /**
           * multiply height for 2 because we have to consider the next band data
           */

          if ((bd.startTop + (bd.height * 2)) > g.heightPageLimite) {
            this.continuePage = true;
            //_incTop = 0;
            //bd.startTop = 0;
            return ret;
          }

          if ((_incTop + bd.height) > maxDataHeight) {
            if (autoHeight) extendHeight = _incTop - maxDataHeight;
          }
        }
      }
      if (g.devMode) break;
    }

    return ret;
  }

  dynamic processFooter(bool recursive) {
    var ret = [];
    return ret;
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
}
