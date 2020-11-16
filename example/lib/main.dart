import 'package:flutter/material.dart';
import 'package:report/report.dart';
import 'package:report/generate_canvas.dart';

var pages = [
  {
    "reportVersion": "1.0",
    "paper": "A4",
    "orientation": "P",
    "width": 210,
    "height": 297,
    "generateOn": "allData", //"allData","firstData","lastDate"
    "margin": {"left": 5, "right": 5, "top": 5, "bottom": 5},
    "padding": {"left": 0, "right": 0, "top": 0, "bottom": 0},
    "backgroundRGB": [255, 255, 255],
    "fillBackground": false,
    "border": {
      "colorRGB": [0, 0, 255],
      "style": "dashed",
      "left": 1,
      "right": 1,
      "top": 1,
      "bottom": 1,
      "rounded": 0
    },
    "bands": [
      {
        "type": "startPage", //band generated only on first data
        "margin": {"left": 5, "right": 5, "top": 5, "bottom": 5},
        "padding": {"left": 0, "right": 0, "top": 0, "bottom": 0},
        "height": 30,
        "backgroundRGB": [255, 255, 255],
        "fillBackground": false,
        "border": {
          "colorRGB": [255, 0, 0],
          "style": "dashed",
          "left": 1,
          "right": 1,
          "top": 1,
          "bottom": 1,
          "rounded": 0
        },
        "children": [
          {
            "type": "panel",
            "align": "center",
            "top": 0,
            "left": 0,
            "width": double.infinity,
            "height": double.infinity,
            "margin": {"left": 5, "right": 5, "top": 5, "bottom": 5},
            "padding": {"left": 0, "right": 0, "top": 0, "bottom": 0},
            "backgroundRGB": [255, 255, 255],
            "fillBackground": false,
            "border": {
              "colorRGB": [255, 0, 0],
              "style": "none",
              "left": 1,
              "right": 1,
              "top": 1,
              "bottom": 1,
              "rounded": 0
            },
            "boundbox": {"left": 0, "right": 0, "top": 0, "bottom": 0},
            "children": [
              {
                "type": "text",
                "align": "center",
                "text": "Welcome Report",
                "top": 0,
                "left": 0,
                "width": double.infinity,
                "height": 12,
                "margin": {"left": 5, "right": 5, "top": 5, "bottom": 5},
                "padding": {"left": 0, "right": 0, "top": 0, "bottom": 0},
                "backgroundRGB": [255, 255, 255],
                "fillBackground": false,
                "border": {
                  "colorRGB": [255, 0, 0],
                  "style": "solid",
                  "left": 0,
                  "right": 0,
                  "top": 0,
                  "bottom": 0,
                  "rounded": 0
                },
                "boundbox": {"left": 0, "right": 0, "top": 0, "bottom": 0},
              }
            ]
          },
        ]
      },
      {
        "type": "data", //band generated on all data
        "margin": {"left": 5, "right": 5, "top": 5, "bottom": 5},
        "padding": {"left": 0, "right": 0, "top": 0, "bottom": 0},
        "height": 30,
        "backgroundRGB": [200, 200, 255],
        "fillBackground": true,
        "border": {
          "colorRGB": [255, 0, 0],
          "style": "none",
          "left": 0,
          "right": 0,
          "top": 0,
          "bottom": 1,
          "rounded": 0
        },

        "children": [
          {
            "type": "panel",
            "align": "center",
            "top": 0,
            "left": 0,
            "width": double.infinity,
            "height": double.infinity,
            "margin": {"left": 5, "right": 5, "top": 5, "bottom": 5},
            "padding": {"left": 0, "right": 0, "top": 0, "bottom": 0},
            "backgroundRGB": [0, 255, 0],
            "fillBackground": true,
            "border": {
              "colorRGB": [255, 0, 0],
              "style": "none",
              "left": 0,
              "right": 0,
              "top": 0,
              "bottom": 0,
              "rounded": 0
            },
            "boundbox": {"left": 0, "right": 0, "top": 0, "bottom": 0},
            "children": [
              {
                "type": "text",
                "align": "center",
                "text": "The name is [name].",
                "top": 0,
                "left": 0,
                "width": double.infinity,
                "height": 12,
                "margin": {"left": 5, "right": 5, "top": 5, "bottom": 5},
                "padding": {"left": 0, "right": 0, "top": 0, "bottom": 0},
                "backgroundRGB": [255, 255, 255],
                "fillBackground": false,
                "border": {
                  "colorRGB": [255, 0, 0],
                  "style": "none",
                  "left": 0,
                  "right": 0,
                  "top": 0,
                  "bottom": 0,
                  "rounded": 0
                },
                "boundbox": {"left": 0, "right": 0, "top": 0, "bottom": 0},
              }
            ]
          },
        ],
        "boundbox": {"left": 0, "right": 0, "top": 0, "bottom": 0},
      }
    ]
  }
];

var data = [
  {"name": "John"},
  {"name": "Mary"},
  {"name": "Jack"},
  {"name": "Jane"},
];

var rel;
void main() {
  Report r = Report();
  r.setData(data);
  r.setLayout(pages);
  rel = r.prepare();
  //print(rel);
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
            painter: GenerateCanvas(rel, 2.7),
          ),
        ));
  }
}
