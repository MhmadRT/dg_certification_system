import 'package:dg_certification_system/controller/category_controller.dart';
import 'package:dg_certification_system/responsive.dart';
import 'package:dg_certification_system/utils/constants.dart';
import 'package:dg_certification_system/view/widgets/available_course_list.dart';
import 'package:dg_certification_system/view/widgets/course_card_widget.dart';
import 'package:dg_certification_system/view/widgets/courses_grid_widget.dart';
import 'package:dg_certification_system/view/widgets/header_widget.dart';
import 'package:dg_certification_system/view/widgets/notifications_list_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/category_card.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ScrollController _scrollController = ScrollController();

  CategoryController? categoryController;

  @override
  void initState() {
    // TODO: implement initState
    categoryController = CategoryController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          const HeaderWidget(),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!Responsive.isMobile(context))
                  const Expanded(
                    flex: 1,
                    child: NotificationsListWidget(),
                  ),
                const SizedBox(width: defaultPadding),

                StreamBuilder<dynamic>(
                    stream: categoryController!.streamController.stream,
                    builder: (context, snapshot) {
                      return Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: SizedBox(
                                height: 37,
                                child: Row(
                                  children: const [
                                    SizedBox(
                                      width: defaultPadding,
                                    ),
                                    Icon(
                                      Icons.add_circle_outline_rounded,
                                      color: Colors.white,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: defaultPadding,
                                      ),
                                      child: Text(
                                        "اضافة قسم جديد",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            categoryController!.loading
                                ? Expanded(
                                    child: GridView.builder(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    itemCount: 10,
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          Responsive.isMobile(context) ? 2 : 3,
                                      childAspectRatio: 0.9,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                    ),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                            'assets/images/loading.gif',fit: BoxFit.cover,),
                                      );
                                    },
                                  ))
                                : Expanded(
                                    child: GridView.builder(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    itemCount: categoryController!
                                        .categories!.data.length,
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          Responsive.isMobile(context) ? 2 : 3,
                                      childAspectRatio: 0.9,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                    ),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return CategoryCardWidget(
                                        categoryData: categoryController!
                                            .categories!.data[index],
                                      );
                                    },
                                  )),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
          const SizedBox(height: defaultPadding),
          const AvailableCourseList(),
        ],
      ),
    );
  }
}
