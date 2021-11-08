//import 'package:report/flutter_report.dart';
import 'fr_layout.dart';
import 'constants.dart';

class FRPage extends FRLayout {
  List<int> paperSize = [0, 0];

  FRPage(
      {this.paperSize,
      bands,
      margin,
      padding,
      backgroundColorRGB,
      fillBackground,
      border,
      data})
      : super(
            margin: margin,
            padding: padding,
            backgroundColorRGB: backgroundColorRGB,
            fillBackground: fillBackground,
            border: border,
            bands: bands,
            data: data) {
    if (this.paperSize == null) {
      this.paperSize = FRPaperSize.a4;
    }
    this.width = this.paperSize[0].toDouble();
    this.height = this.paperSize[1].toDouble();
  }
  /*
  @override
  Map<String, dynamic> toMap() {
    var ret = super.toMap();
    //ret.addAll({"children": __children});

    return ret;
  }
  */
}
