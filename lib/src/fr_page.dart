//import 'package:report/flutter_report.dart';
import 'fr_layout.dart';
import 'constants.dart';
import '../globals.dart' as g;

class FRPage extends FRLayout {
  List<int> paperSize = FRPaperSize.a4;

  FRPage(
      {paperSize,
      bands,
      margin,
      padding,
      backgroundColor,
      border,
      data,
      autoHeight})
      : super(
            margin: margin,
            padding: padding,
            backgroundColor: backgroundColor,
            border: border,
            bands: bands,
            data: data,
            autoHeight: autoHeight) {
    if (paperSize != null) {
      this.paperSize = paperSize;
    }
    //print(padding.left);
    this.width = this.paperSize[0].toDouble();
    this.height = this.paperSize[1].toDouble();
    this.margin.bottom = 0;
    this.margin.top = 0;
    this.margin.left = 0;
    this.margin.right = 0;
    this.top = 0;
    this.left = 0;
    this.type = 'page';
  }

  dynamic process(dynamic data) {
    dynamic ret = {"objs": []};

    dynamic retDev = [];

    this.margin.toZero();

    if (g.devMode) {
      //draw a grid for debugging
      int i = 5;
      while (i < paperSize[0]) {
        retDev.add({
          "type": "line",
          "colorRGB": [220, 220, 220],
          "from": {"x": i + startLeft, "y": 0 + startLeft + this.top},
          "to": {"x": i + startLeft, "y": paperSize[1] + startLeft + this.top}
        });
        i += 5;
      }

      i = 5;
      while (i < paperSize[1]) {
        retDev.add({
          "type": "line",
          "colorRGB": [220, 220, 220],
          "from": {"x": 0 + startLeft, "y": i + startTop + this.top},
          "to": {"x": paperSize[0] + startLeft, "y": i + startTop + this.top}
        });
        i += 5;
      }
    }
    g.heightPageLimite = this.maxDataHeight;
    ret["objs"].addAll(retDev);
    ret["objs"].addAll(super.process(data)["objs"]);

    return ret;
  }
}
