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

import 'globals.dart' as g;

class FlutterReport {
  final List<FRPage> pages;
  dynamic data;
  int currData = 0;

  FlutterReport({required this.pages, required this.data});

  prepare({required bool devMode}) {
    g.devMode = devMode;
    dynamic page = [];
    dynamic objs = [];

    FRPage pg;
    for (pg in pages) {
      pg.startTop = 0;
      pg.startLeft = 20;
      objs = pg.process(this.data);
      page.addAll(objs["objs"]);
      g.pages.add(page);
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
