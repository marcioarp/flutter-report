import 'package:flutter/material.dart';

class OutCanvas extends CustomPainter {
  var _rel;
  double _zoom;
  OutCanvas(var rel, double zoom) {
    _rel = rel;
    _zoom = zoom;
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (var obj in _rel) {
      var paint = Paint();

      if (obj['type'] == 'text') {
        //print(obj);

        final textStyle =
            TextStyle(color: Colors.black, fontSize: obj["height"] * _zoom);
        final textSpan = TextSpan(
          text: obj["text"],
          style: textStyle,
        );
        final textPainter = TextPainter(
          text: textSpan,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout(minWidth: 0, maxWidth: size.width * _zoom);
        final offset = Offset(
            obj["left"].toDouble() * _zoom, obj["top"].toDouble() * _zoom);
        textPainter.paint(canvas, offset);
      }

      if (obj['type'] == 'line') {
        var path = Path();
        paint.color = Color.fromRGBO(
            obj['colorRGB'][0], obj['colorRGB'][1], obj['colorRGB'][2], 1);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1;

        path.moveTo(obj["from"]["x"] * _zoom, obj["from"]["y"] * _zoom);

        path.lineTo(obj["to"]["x"] * _zoom, obj["to"]["y"] * _zoom);
        canvas.drawPath(path, paint);
      }

      if (obj['type'] == 'rect') {
        //print(obj);
        if (obj["fill"]) {
          paint.color = Color.fromRGBO(obj['fillColorRGB'][0],
              obj['fillColorRGB'][1], obj['fillColorRGB'][2], 1);
          paint.style = PaintingStyle.fill;
          var rect = Rect.fromLTRB(
              obj["from"]["x"] * _zoom,
              obj["from"]["y"] * _zoom,
              obj["to"]["x"] * _zoom,
              obj["to"]["y"] * _zoom);

          canvas.drawRect(rect, paint);
        }
        if (obj["borderWidth"] > 0) {
          paint.color = Color.fromRGBO(obj['borderColorRGB'][0],
              obj['borderColorRGB'][1], obj['borderColorRGB'][2], 1);
          paint.style = PaintingStyle.stroke;
          var rect = Rect.fromLTRB(
              obj["from"]["x"] * _zoom,
              obj["from"]["y"] * _zoom,
              obj["to"]["x"] * _zoom,
              obj["to"]["y"] * _zoom);

          paint.strokeWidth = obj['borderWidth'].toDouble();
          canvas.drawRect(rect, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
