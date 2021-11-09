import 'package:flutter/material.dart';

class OutCanvas extends CustomPainter {
  var rel;
  double zoom;
  OutCanvas(this.rel, this.zoom) {
    //print(this.rel);
  }

  @override
  void paint(Canvas canvas, Size size) {
    TextAlign align;
    print(rel);
    for (var obj in rel) {
      //print('aqui');
      var paint = Paint();
      //print(obj['type']);
      if (obj['type'] == 'text') {
        //print(obj['padding']);
        //print(zoom);
        final textStyle =
            TextStyle(color: Colors.black, fontSize: obj["fontSize"] * zoom);
        final textSpan = TextSpan(
          text: obj["text"],
          style: textStyle,
        );
        align = TextAlign.left;
        if (obj['align'] == 'right')
          align = TextAlign.right;
        else if (obj['align'] == 'center') align = TextAlign.center;
        final textPainter = TextPainter(
            text: textSpan, textDirection: TextDirection.ltr, textAlign: align);
        textPainter.layout(
            minWidth: (obj['width'].toDouble() -
                    obj['padding']["left"].toDouble() -
                    obj['padding']["right"].toDouble()) *
                zoom,
            maxWidth: (obj['width'].toDouble() -
                    obj['padding']["left"].toDouble() -
                    obj['padding']["right"].toDouble()) *
                zoom);
        final offset = Offset(
          obj["left"].toDouble() * zoom,
          obj["top"].toDouble() * zoom,
        );
        textPainter.paint(canvas, offset);
      }
      //continue;

      if (obj['type'] == 'line') {
        var path = Path();
        paint.color = Color.fromRGBO(
            obj['colorRGB'][0], obj['colorRGB'][1], obj['colorRGB'][2], 1);
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 1;

        path.moveTo(obj["from"]["x"] * zoom, obj["from"]["y"] * zoom);

        path.lineTo(obj["to"]["x"] * zoom, obj["to"]["y"] * zoom);
        canvas.drawPath(path, paint);
      }

      if (obj['type'] == 'rect') {
        //print(obj);
        if (obj["fill"]) {
          paint.color = Color.fromRGBO(obj['fillColorRGB'][0],
              obj['fillColorRGB'][1], obj['fillColorRGB'][2], 1);
          paint.style = PaintingStyle.fill;
          var rect = Rect.fromLTRB(
              obj["from"]["x"] * zoom,
              obj["from"]["y"] * zoom,
              obj["to"]["x"] * zoom,
              obj["to"]["y"] * zoom);

          canvas.drawRect(rect, paint);
        }
        if (obj["borderWidth"] > 0) {
          if (!(obj['borderColorRGB'] == null)) {
            paint.color = Color.fromRGBO(obj['borderColorRGB'][0],
                obj['borderColorRGB'][1], obj['borderColorRGB'][2], 1);
            paint.style = PaintingStyle.stroke;
            var rect = Rect.fromLTRB(
                obj["from"]["x"] * zoom,
                obj["from"]["y"] * zoom,
                obj["to"]["x"] * zoom,
                obj["to"]["y"] * zoom);

            paint.strokeWidth = obj['borderWidth'].toDouble();
            canvas.drawRect(rect, paint);
          }
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
