import 'fr_collection.dart';

class FRPanel extends FRColletion {
  FRPanel(
      {margin,
      padding,
      backgroundColorRGB,
      fillBackground,
      border,
      parent,
      boundBox,
      children})
      : super(
            margin: margin,
            padding: padding,
            backgroundColorRGB: backgroundColorRGB,
            fillBackground: fillBackground,
            border: border,
            children: children) {
    this.type = 'FRPanel';
  }
}
