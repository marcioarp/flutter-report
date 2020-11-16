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
  setData(var data) {
    _data = data;
  }

  setLayout(var layout) {
    _layout = layout;
  }

  dynamic generate() {
    print("aqrui gen");
    for (var pg in _layout) {
      for (var bd in pg.bands) {
        print(bd);
      }
    }
  }
}
