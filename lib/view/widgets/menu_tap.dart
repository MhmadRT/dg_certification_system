import 'package:dg_certification_system/main.dart';
import 'package:dg_certification_system/model/menu_tap_model.dart';
import 'package:dg_certification_system/view/screens/main_screen.dart';
import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: InkWell(
        onTap: () {
          homeController!.index = widget.menuTapModel.id;
          homeController!.notifyListeners();
        },
        child: AnimatedContainer(
          height: 50,
          duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: appLang == 'ar'
                      ? const Radius.circular(12)
                      : const Radius.circular(0),
                  topLeft: appLang == 'ar'
                      ? const Radius.circular(12)
                      : const Radius.circular(0),
                  bottomRight: appLang == 'ar'
                      ? const Radius.circular(0)
                      : const Radius.circular(12),
                  topRight: appLang == 'ar'
                      ? const Radius.circular(0)
                      : const Radius.circular(12)),
              color: homeController!.index == widget.menuTapModel.id
                  ? Theme.of(context).primaryColor.withOpacity(.18)
                  : Theme.of(context).scaffoldBackgroundColor),
          child: Row(
            children: [
              if(homeController!.index == widget.menuTapModel.id)
              Container(
                height: 50,
                width: 12,
                color: Theme.of(context).primaryColor,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  widget.menuTapModel.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
