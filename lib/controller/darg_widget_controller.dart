import 'package:dg_certification_system/controller/state_control.dart';

import '../model/item_model.dart';

class DragWidgetController extends StateControl {
  final int countInStack;
  final double high;
  final double width;
  ItemModel itemModel;
  double x1Prev = 50.0, y1Prev = 50.0;

  DragWidgetController(
      {required this.countInStack,
      required this.itemModel,
      required this.high,
      required this.width}) {
    init();
  }

  @override
  void init() {
    // TODO: implement initState
    itemModel.y *= countInStack;
    if (itemModel.y > (high)) {
      itemModel.y = high;
      itemModel.x *= countInStack;
    }
    super.init();
  }
}
