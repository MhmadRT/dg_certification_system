import 'package:dg_certification_system/responsive.dart';
import 'package:dg_certification_system/utils/constants.dart';
import 'package:dg_certification_system/view/widgets/available_course_list.dart';
import 'package:dg_certification_system/view/widgets/courses_grid_widget.dart';
import 'package:dg_certification_system/view/widgets/header_widget.dart';
import 'package:dg_certification_system/view/widgets/notifications_list_widget.dart';
import 'package:flutter/material.dart';
class DashboardScreen extends StatelessWidget {
   DashboardScreen({Key? key}) : super(key: key);

  final ScrollController _scrollController=ScrollController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child : Column(
        children: [
          const HeaderWidget(),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Row(
              children: [
                if (!Responsive.isMobile(context))
                  const Expanded(
                    flex: 1,
                    child: NotificationsListWidget(),
                  ),
                const SizedBox(width: defaultPadding),
                Expanded(
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
                                SizedBox(width: defaultPadding),
                                Icon(
                                  Icons.add_circle_outline_rounded,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: defaultPadding),
                                  child: Text(
                                    "اضافة دورة تدريبية",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      const Expanded(child: CoursesGridWidget())
                    ],
                  ),
                ),
               
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
