import 'package:dg_certification_system/model/menu_tap_model.dart';
import 'package:dg_certification_system/view/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class MenuTap extends StatefulWidget {
  final MenuTapModel menuTapModel;

  const MenuTap({Key? key, required this.menuTapModel}) : super(key: key);

  @override
  State<MenuTap> createState() => _MenuTapState();
}

class _MenuTapState extends State<MenuTap> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:5.0),
      child: GestureDetector(
        onTap: () {
          homeController!.index = widget.menuTapModel.id;
          homeController!.notifyListeners();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(homeController!.index == widget.menuTapModel.id?12:0),
              color: homeController!.index == widget.menuTapModel.id
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).scaffoldBackgroundColor),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                widget.menuTapModel.title,
                style: TextStyle(
                  color: homeController!.index == widget.menuTapModel.id
                      ? Theme.of(context).cardColor
                      : Theme.of(context).hintColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
