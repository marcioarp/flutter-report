import 'package:flutter/material.dart';
//import 'mapLayout.dart';
import 'package:report/flutter_report.dart';

var data = [
  {"name": "Jack"},
  {"name": "Jane"},
  {"name": "John"},
  {"name": "Mary"},
  {"name": "Paul"},
  {"name": "Kate"},
];

var rel;
void main() {
  FlutterReport fr = FlutterReport(pages: [
    FRPage(
        paperSize: FRPaperSize.psA4,
        padding: FRPadding(top: 5, left: 5, right: 5, bottom: 5),
        bandStart: FRBandStart(height: 60.00, children: [
          FRText(top: 25.00, text: 'Ola 20', fontSize: 20),
          FRText(
              top: 10.00,
              text: 'Ola 10',
              fontSize: 10,
              padding: FRPadding(left: 10)),
          FRText(top: 40.00, text: 'Ola 30 [name]', fontSize: 30, height: 15.00)
        ]),
        bandData: FRBandData(
            backgroundColorRGB: FRRGBColor(255, 200, 200),
            height: 10.00,
            children: [
              FRText(
                  top: 0.00,
                  backgroundColorRGB: FRRGBColor(255, 120, 120),
                  padding: FRPadding(top: 2, left: 2),
                  text: '[name]',
                  fontSize: 8)
            ]))
  ]);

  //print(fr.toMap());
  Report r = Report();
  r.setData(data);
  r.setLayout(fr.toMap());
  rel = r.prepare();
  runApp(MyScroll());
}

class MyScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Report'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double zoom = 6.00;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        actions: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Icon(Icons.print),
          ),
          FlatButton(
            onPressed: () {},
            child: Icon(Icons.picture_as_pdf),
          ),
          FlatButton(
            onPressed: () {
              setState(() {
                this.zoom -= 1.0;
              });
            },
            child: Icon(Icons.zoom_out),
          ),
          FlatButton(
            onPressed: () {
              setState(() {
                this.zoom += 1.0;
              });
            },
            child: Icon(Icons.zoom_in),
          ),
        ],
      ),
      body: new Center(
        child: new SingleChildScrollView(
          //scrollDirection: Axis.vertical,
          child: new CustomPaint(
            painter: new OutCanvas(rel, this.zoom),
            size: new Size(width, height * 2),
          ),
        ),
      ),
    );
  }
}
