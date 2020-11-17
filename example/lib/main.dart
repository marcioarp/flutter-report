import 'package:flutter/material.dart';
import 'package:report/report.dart';
import 'package:report/generate_canvas.dart';
import 'mapLayout.dart';
import 'package:report/src/fr_report.dart';
import 'package:report/src/object.dart';

var data = [
  {"name": "John"},
  {"name": "Mary"},
  {"name": "Jack"},
  {"name": "Jane"},
];

var rel;
void main() {
  FRReport layout = FRReport();
  layout.bdStart.add(FRObject());
  print(layout.toMap());

  Report r = Report();
  r.setData(data);
  r.setLayout(pages);
  rel = r.prepare();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Report Demo',
        home: Container(
          color: Colors.white,
          child: CustomPaint(
            painter: GenerateCanvas(rel, 1.5),
          ),
        ));
  }
}
