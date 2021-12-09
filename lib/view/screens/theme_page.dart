import 'package:dg_certification_system/model/item_model.dart';
import 'package:dg_certification_system/model/themes.dart';
import 'package:dg_certification_system/repositories/theme_repository.dart';
import 'package:dg_certification_system/view/widgets/dragable_widget.dart';
import 'package:flutter/material.dart';

class ThemeScreen extends StatefulWidget {
  ThemeModel themeData;

  ThemeScreen({Key? key, required this.themeData}) : super(key: key);

  @override
  _ThemeScreenState createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  ThemeModel? themeModel;
  bool loading = true;

  getThemeData(int id) async {
    print('Start');
    await ThemeRepository().getThemeById(context, id);
    print('end');
    loading = false;
    setState(() {});
  }

  List<DragWidget> list = [];

  @override
  void initState() {
    // TODO: implement initState
    getThemeData(int.parse(widget.themeData.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(!loading) {
      for (Item element in themeModel!.items) {
      list.add(DragWidget(
          itemModel: element,
          countInStack: 0,
          high: double.parse(themeModel!.themeHeight),
          width: double.parse(themeModel!.themeWidth)));
    }
    }
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: double.parse(widget.themeData.themeHeight),
            width: double.parse(widget.themeData.themeWidth),
            decoration: BoxDecoration(
                color: Theme.of(context).hintColor,
                image: DecorationImage(
                    image: NetworkImage(
                  widget.themeData.backImge,
                ))),
            child: Stack(
              children: list,
            ),
          ),
        ],
      ),
    );
  }
}
