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
//import 'package:meta/meta.dart';
//import 'package:report/src/report.dart';
import 'globals.dart' as g;

class FlutterReport {
  final List<FRPage> pages;
  dynamic data;
  int currData = 0;

  FlutterReport({required this.pages, required this.data});

  prepare({required bool devMode}) {
    g.devMode = devMode;
    /*
    g.data = this.data;
    
    g.pages = [];
    g.currMasterData = 0;
    */
    //Report r = Report(devMode: devMode);
    //r.setLayout(this.toMap());
    FRPage pg;
    for (pg in pages) {
      //version = pg['version'];
      //print(pg);
      pg.startTop = 5;
      pg.startLeft = 10;
      pg.process(this.data, 0);
      g.pages.add(g.page);
    }
  }

  dynamic result() {
    return g.pages;
  }

  List<dynamic> toMap() {
    List ret = [];
    for (FRPage pg in pages) {
      ret.add(pg.toMap());
    }
    return ret;
  }
}
