import 'package:dg_certification_system/controller/category_controller.dart';
import 'package:dg_certification_system/model/category_model.dart';
import 'package:dg_certification_system/model/recent_file.dart';
import 'package:dg_certification_system/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../main.dart';
import '../../responsive.dart';
import 'package:dg_certification_system/view/widgets/search_field_widget.dart';

import 'loading_widget.dart';

class CategoriesListWidget extends StatefulWidget {
  const CategoriesListWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoriesListWidget> createState() => _CategoriesListWidgetState();
}
CategoryController? controller;

class _CategoriesListWidgetState extends State<CategoriesListWidget> {

  @override
  void initState() {
    // TODO: implement initState
    controller = CategoryController(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: cardColor,
        border: Border.all(
            width: 0.7, color: const Color(0xff707070).withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.04),
            spreadRadius: 2,
            blurRadius: 50,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    height: 37,
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "اقسام الدورات",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(flex: 3, child: Container()),
                const Expanded(
                  flex: 2,
                  child: SearchField(),
                )
              ],
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "الأقسام",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text("",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            StreamBuilder<dynamic>(
              stream: controller!.streamController.stream,
              builder: (context, snapshot) {
                if (controller!.loading) {
                  return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicator()),
                );
                }
                else {
                  return ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller!.categories!.data.length,
                  itemBuilder: (context, index) => categoryWidget(controller!.categories!.data[index], context),
                );
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}

Widget categoryWidget(CategoryData category, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!Responsive.isMobile(context))
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).accentColor),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                child: Text(category.catTitle),
              ),
            ],
          ),

      ],
    ),
  );
}
