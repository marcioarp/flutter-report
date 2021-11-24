import 'package:report/flutter_report.dart';

import 'fr_object.dart';
import 'fr_band.dart';
import '../globals.dart' as g;

class FRLayout extends FRObject {
  List<dynamic> data = [];
  List<FRBand> bands = [];
  String dataFieldName = '';
  double _maxHeight = 0.00;
  int _currData = 0;
  dynamic objs = [];
  dynamic objsBands = [];
  //double _incTop = 0;
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
      devMode})
      : super(
            margin: margin,
            padding: padding,
            backgroundColor: backgroundColor,
            border: border,
            top: top,
            left: left,
            width: width,
            height: height) {
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

  dynamic process(dynamic data, int level) {
    dynamic itemData;
    int itemCurrData;

    if (dataFieldName == '') {
      itemData = data;
      itemCurrData = 0;
    } else {
      //print(data[currData]['itens']);
      itemData = data[dataFieldName];
      itemCurrData = 0;
      //print(itemData);
    }

    //print(itemData);
    double initialTop = startTop;
    startTop += top;
    startLeft += left;

    g.page.addAll(this.processBorder());

    startTop += margin.top + padding.top;
    startLeft += margin.left + padding.left;

    //dynamic retBands = [];
    for (FRBand bd in this.bands) {
      bd.startLeft = startLeft;
      bd.startTop = startTop;
      if ((bd.type == 'start') && (itemCurrData == 0)) {
        objsBands.addAll(bd.process(itemData[0], level + 1));
        startTop += bd.height + bd.margin.top + bd.margin.bottom;
      } else {
        if (itemData != null)
          for (int i = itemCurrData; i < itemData.length; i++) {
            objsBands.addAll(bd.process(itemData[i], level + 1));
            startTop += bd.height + bd.margin.top + bd.margin.bottom;
            bd.startTop = startTop;
            g.page.addAll(objsBands);
            objsBands = [];
            if ((bd.height + bd.startTop) > (initialTop + height)) {
              //overflow
              newPage([]);
              objsBands = [];
              startTop =
                  initialTop + bd.height + bd.margin.top + bd.margin.bottom;
            }
          }
      }

      //g.incTop = bd.nextTop;
    }

    g.page.addAll(objs);
    g.page.addAll(objsBands);
    return [];
    //return ret;
  }

  void newPage(dynamic objsTemp) {
    if (type == 'page') {
      dynamic pgTemp = [...g.page];
      pgTemp.addAll([...objs]);
      pgTemp.addAll([...objsBands]);
      pgTemp.addAll([...objsTemp]);
      g.pages.add(pgTemp);
    } else {
      (parent as FRBand).newPage(objsTemp);
    }

    //
  }

  void processHeader() {}
  void processData() {}
  void processFooter() {
    var ret = [];

    g.page.addAll(ret);

    //print(itemData);
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
