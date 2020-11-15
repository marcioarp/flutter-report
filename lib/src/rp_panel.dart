import 'rp_object.dart';

class RPPanel extends RPObject {
  late RPObject _parent;
  late List<RPObject> children;

  RPPanel(RPObject parent) {
    _parent = parent;
  }
}
