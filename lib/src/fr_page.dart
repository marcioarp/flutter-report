import 'package:report/flutter_report.dart';

class FRPage extends FRLayout {
  List<int> paperSize = [0, 0];

  FRPage(
      {this.paperSize,
      bandStart,
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
            border: border,
            bandStart: bandStart,
            bandPageHeader: bandPageHeader,
            bandGroupHeader: bandGroupHeader,
            bandData: bandData,
            bandGroupFooter: bandGroupFooter,
            bandPageFooter: bandPageFooter,
            bandEnd: bandEnd) {
    if (this.paperSize == null) {
      this.paperSize = FRPaperSize.psA4;
    }
    this.width = this.paperSize[0].toDouble();
    this.height = this.paperSize[1].toDouble();
  }
  @override
  Map<String, dynamic> toMap() {
    var ret = super.toMap();
    //ret.addAll({"children": __children});

    return ret;
  }
}
