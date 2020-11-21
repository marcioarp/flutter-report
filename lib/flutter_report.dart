library flutter_report;

export 'src/fr_object.dart';
export 'src/fr_panel.dart';
export 'src/fr_band.dart';
export 'src/fr_collection.dart';
export 'src/fr_layout.dart';
export 'src/constants.dart';
export 'src/fr_page.dart';

export 'src/report.dart';

export 'src/out_canvas.dart';

import 'package:report/src/fr_page.dart';

class FlutterRerpot {
  List<FRPage> pages;

  List<dynamic> toMap() {
    List ret = [];
    for (FRPage pg in pages) {
      if (pg == null) continue;
      ret.add(pg.toMap());
    }
    return ret;
  }
}
