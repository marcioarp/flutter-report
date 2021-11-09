library flutter_report;

export 'src/fr_object.dart';
export 'src/fr_panel.dart';
export 'src/fr_band.dart';
export 'src/fr_collection.dart';
export 'src/fr_layout.dart';
export 'src/constants.dart';
export 'src/fr_page.dart';
export 'src/fr_text.dart';

export 'src/out_canvas.dart';

import 'package:report/src/fr_page.dart';
import 'package:meta/meta.dart';
//import 'package:report/src/report.dart';

class FlutterReport {
  final List<FRPage> pages;
  dynamic data;
  dynamic result;
  int currData = 0;

  FlutterReport({@required this.pages, @required this.data});

  List<dynamic> toMap() {
    List ret = [];
    for (FRPage pg in pages) {
      if (pg == null) continue;
      ret.add(pg.toMap());
    }
    return ret;
  }

  prepare({@required bool devMode}) {
    //Report r = Report(devMode: devMode);
    //r.setLayout(this.toMap());
    this.result = [];
    FRPage pg;
    for (pg in pages) {
      //version = pg['version'];
      //print(pg);
      this.result.addAll(pg.process(0, 0, this.data, this.currData, devMode));
    }
  }
}
