import 'package:flutter/material.dart';
import 'mapLayout.dart';
import 'package:report/flutter_report.dart';

var data = [
  {"name": "John"},
  {"name": "Mary"},
  {"name": "Jack"},
  {"name": "Jane"},
];

var rel;
void main() {
  FlutterRerpot fr = FlutterRerpot();
  FRPage pg = FRPage();
  pg.bdStart.add(FRObject());
  fr.pages.add(pg);

  print(fr.toMap());
  Report r = Report();
  r.setData(data);
  r.setLayout(fr.toMap());
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
            painter: OutCanvas(rel, 1.5),
          ),
        ));
  }
}
