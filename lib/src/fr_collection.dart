import 'fr_object.dart';

class FRColletion extends FRObject {
  List<FRObject> _children;

  FRColletion() {
    _children = List();
  }
  add(FRObject obj) {
    _children.add(obj);
    obj.parent = this;
  }

  get children => _children;

  set children(children) {
    _children = children;
  }

  @override
  Map<String, dynamic> toMap() {
    var ret = super.toMap();
    Map<String, dynamic> __children;
    __children = Map();
    for (FRObject obj in children) {
      __children.addAll(obj.toMap());
    }
    ret.addAll({"children": __children});

    return ret;
  }
}
