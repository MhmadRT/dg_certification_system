import 'package:flutter/material.dart';


import '../../controller/darg_widget_controller.dart';
import '../../model/item_model.dart';

class DragWidget extends StatelessWidget {
  final int countInStack;
  final double high;
  final double width;
  DragWidgetController? con;
  ItemModel itemModel;

  DragWidget(
      {Key? key,
      required this.itemModel,
      required this.countInStack,
      required this.high,
      required this.width})
      : super(key: key) {
    con = DragWidgetController(
        countInStack: countInStack,
        high: high,
        width: width,
        itemModel: itemModel);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
        stream: con!.streamController.stream,
        builder: (context, snapshot) {
          return Positioned(
            left: con!.itemModel.x,
            top: con!.itemModel.y,
            child: GestureDetector(
              onLongPress: () {
                print('lonngg');
              },
              onPanDown: (d) {
                con!.x1Prev = con!.itemModel.x;
                con!.y1Prev = con!.itemModel.y;
              },
              onPanUpdate: (details) {
                con!.itemModel.x = con!.x1Prev + details.localPosition.dx;
                if (con!.itemModel.x > width - 10) {
                  con!.itemModel.x = width - 10;
                }
                if (con!.itemModel.x < 10) {
                  con!.itemModel.x = 10;
                }
                con!.itemModel.y = con!.y1Prev + details.localPosition.dy;
                if (con!.itemModel.y < 10) {
                  con!.itemModel.y = 10;
                }
                if (con!.itemModel.y > high - 10) {
                  con!.itemModel.y = high - 10;
                }
                con!.notifyListeners();
              },
              child: itemWidget(itemModel),
            ),
          );
        });
  }

    itemWidget(ItemModel itemModel) {
      switch (itemModel.type) {
        case 0:
          return SizedBox(
              width: itemModel.width,
              child: Text(
                itemModel.text,
                textAlign: itemModel.align == 0
                    ? TextAlign.left
                    : itemModel.align == 1
                    ? TextAlign.right
                    : TextAlign.center,
                style: TextStyle(
                  fontSize: itemModel.textSize,
                  color: Color(itemModel.color),
                  fontWeight: itemModel.fontWight == 6
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ));
          case 1:
          return Image.memory(
              itemModel.text,
              height: itemModel.height,
            );
          case 2:
          return Icon(Icons.qr_code_rounded,size: itemModel.width,);
      }
    }

}
