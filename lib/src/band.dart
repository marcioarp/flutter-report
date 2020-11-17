import 'collection.dart';

class FRBand extends FRColletion {
  bool _visible = true;

  bool get visible => _visible;
  set visible(bool visible) {
    _visible = visible;
  }
}

class FRBandStart extends FRBand {
  String type = 'startPage';
}

class FRBandPageHeader extends FRBand {
  String type = 'pageHeader';
}

class FRBandGroupHeader extends FRBand {
  String type = 'groupHeader';
  String grupRule = '';
}

class FRBandData extends FRBand {
  String type = 'data';
}

class FRBandGroupFooter extends FRBand {
  String type = 'groupFooter';
}

class FRBandPageFooter extends FRBand {
  String type = 'pageFooter';
}

class FRBandEnd extends FRBand {
  String type = 'EndPage';
}
