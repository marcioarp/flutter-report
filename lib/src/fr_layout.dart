import 'fr_object.dart';
import 'fr_band.dart';
import 'constants.dart';

class FRLayout extends FRObject {
  FRBandStart _bdStart = FRBandStart();
  FRBandPageHeader _bdPageHeader = FRBandPageHeader();
  FRBandGroupHeader _bdGroupHeader = FRBandGroupHeader();
  FRBandData _bdData = FRBandData();
  FRBandGroupFooter _bdGroupFooter = FRBandGroupFooter();
  FRBandPageFooter _bdPageFooter = FRBandPageFooter();
  FRBandEnd _bdEnd = FRBandEnd();
  FRObject parent;

  FRBandEnd get bdEnd => _bdEnd;
  set bdEnd(FRBandEnd bdEnd) {
    _bdEnd = bdEnd;
  }

  FRBandPageFooter get bandPageFooter => _bdPageFooter;
  set bandPageFooter(FRBandPageFooter bandPageFooter) {
    _bdPageFooter = bandPageFooter;
  }

  FRBandGroupFooter get bandGroupFooter => _bdGroupFooter;
  set bandGroupFooter(FRBandGroupFooter bandGroupFooter) {
    _bdGroupFooter = bandGroupFooter;
  }

  FRBandData get bdData => _bdData;
  set bdData(FRBandData bdData) {
    _bdData = bdData;
  }

  FRBandGroupHeader get bdGroupHeader => _bdGroupHeader;
  set bdGroupHeader(FRBandGroupHeader bdGroupHeader) {
    _bdGroupHeader = bdGroupHeader;
  }

  FRBandPageHeader get bdPageHeader => _bdPageHeader;
  set bdPageHeader(FRBandPageHeader bdPageHeader) {
    _bdPageHeader = bdPageHeader;
  }

  FRBandStart get bdStart => _bdStart;
  set bdStart(FRBandStart bdStart) {
    _bdStart = bdStart;
  }

  @override
  Map<String, dynamic> toMap() {
    var ret = super.toMap();
    //print(ret);
    List<dynamic> bands = List();
    if (_bdStart.visible) bands.add(_bdStart.toMap());

    if (_bdPageHeader.visible) bands.add(_bdPageHeader.toMap());

    if (_bdGroupHeader.visible) bands.add(_bdGroupHeader.toMap());

    if (_bdData.visible) bands.add(_bdData.toMap());

    if (_bdGroupFooter.visible) bands.add(_bdGroupFooter.toMap());

    if (_bdPageFooter.visible) bands.add(_bdPageFooter.toMap());

    if (_bdEnd.visible) bands.add(_bdEnd.toMap());
    //print(ret);
    //ret.addAll({});
    ret.addAll({"bands": bands});
    return ret;
  }
}
