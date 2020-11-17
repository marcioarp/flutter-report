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
          "left": 10,
          "right": 10,
          "top": 10,
          "bottom": 10,
          "rounded": 0
        },
        "children": [
          {
            "type": "panel",
            "align": "center",
            "top": 0,
            "left": 0,
            "width": 100,
            "height": 20,
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
                "height": 72,
                "margin": {"left": 5, "right": 5, "top": 5, "bottom": 5},
                "padding": {"left": 0, "right": 0, "top": 0, "bottom": 0},
                "backgroundRGB": [155, 255, 255],
                "fillBackground": true,
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
            "width": 100,
            "height": 20,
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
                "height": 72,
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
