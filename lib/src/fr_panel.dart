import 'fr_collection.dart';

class FRPanel extends FRColletion {
  FRPanel(
      {margin,
      padding,
      backgroundColor,
      border,
      parent,
      boundBox,
      autoHeight,
      required children})
      : super(
            margin: margin,
            padding: padding,
            backgroundColor: backgroundColor,
            border: border,
            children: children,
            autoHeight: autoHeight) {
    this.type = 'panel';
  }
}
