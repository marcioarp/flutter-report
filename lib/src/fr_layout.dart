import 'fr_object.dart';
import 'fr_band.dart';

class FRLayout extends FRObject {
  FRBandStart _bandStart;

  FRBandStart get bandStart => _bandStart;
  set bandStart(FRBandStart bandStart) {
    _bandStart = bandStart;
    _bandStart.parent = this;
  }

  FRBandPageHeader _bandPageHeader;

  FRBandPageHeader get bandPageHeader => _bandPageHeader;

  set bandPageHeader(FRBandPageHeader bandPageHeader) {
    _bandPageHeader = bandPageHeader;
    _bandPageHeader.parent = this;
  }

  FRBandGroupHeader _bandGroupHeader;

  FRBandGroupHeader get bandGroupHeader => _bandGroupHeader;

  set bandGroupHeader(FRBandGroupHeader bandGroupHeader) {
    _bandGroupHeader = bandGroupHeader;
    _bandGroupHeader.parent = this;
  }

  FRBandData _bandData;

  FRBandData get bandData => _bandData;

  set bandData(FRBandData bandData) {
    _bandData = bandData;
    _bandData.parent = this;
  }

  FRBandGroupFooter _bandGroupFooter;

  FRBandGroupFooter get bandGroupFooter => _bandGroupFooter;

  set bandGroupFooter(FRBandGroupFooter bandGroupFooter) {
    _bandGroupFooter = bandGroupFooter;
    _bandGroupFooter.parent = this;
  }

  FRBandPageFooter _bandPageFooter;

  FRBandPageFooter get bandPageFooter => _bandPageFooter;

  set bandPageFooter(FRBandPageFooter bandPageFooter) {
    _bandPageFooter = bandPageFooter;
    _bandPageFooter.parent = this;
  }

  FRBandEnd _bandEnd;

  FRBandEnd get bandEnd => _bandEnd;

  set bandEnd(FRBandEnd bandEnd) {
    _bandEnd = bandEnd;
    _bandEnd.parent = this;
  }

  FRLayout(
      {bandStart,
      bandPageHeader,
      bandGroupHeader,
      bandData,
      bandGroupFooter,
      bandPageFooter,
      bandEnd,
      margin,
      padding,
      backgroundColorRGB,
      fillBackground,
      border})
      : super(
            margin: margin,
            padding: padding,
            backgroundColorRGB: backgroundColorRGB,
            fillBackground: fillBackground,
            border: border) {
    if (bandStart != null) {
      this.bandStart = bandStart;
    }
    if (bandPageHeader != null) {
      this.bandPageHeader = bandPageHeader;
    }
    if (bandGroupHeader != null) {
      this.bandGroupHeader = bandGroupHeader;
    }
    if (bandData != null) {
      this.bandData = bandData;
    }
    if (bandGroupFooter != null) {
      this.bandGroupFooter = bandGroupFooter;
    }
    if (bandPageFooter != null) {
      this.bandPageFooter = bandPageFooter;
    }
    if (bandEnd != null) {
      this.bandEnd = bandEnd;
    }
  }

  @override
  Map<String, dynamic> toMap() {
    var ret = super.toMap();
    //print(ret);
    List<dynamic> bands = [];
    if (bandStart != null) if (bandStart.visible) bands.add(bandStart.toMap());

    if (bandPageHeader != null) if (bandPageHeader.visible)
      bands.add(bandPageHeader.toMap());

    if (bandGroupHeader != null) if (bandGroupHeader.visible)
      bands.add(bandGroupHeader.toMap());

    if (bandData != null) if (bandData.visible) bands.add(bandData.toMap());

    if (bandGroupFooter != null) if (bandGroupFooter.visible)
      bands.add(bandGroupFooter.toMap());

    if (bandPageFooter != null) if (bandPageFooter.visible)
      bands.add(bandPageFooter.toMap());

    if (bandEnd != null) if (bandEnd.visible) bands.add(bandEnd.toMap());
    //print(ret);
    //ret.addAll({});
    ret.addAll({"bands": bands});
    return ret;
  }
}
