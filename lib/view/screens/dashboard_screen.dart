import 'package:dg_certification_system/utils/constants.dart';
import 'package:dg_certification_system/view/widgets/available_course_list.dart';
import 'package:dg_certification_system/view/widgets/courses_grid_widget.dart';
import 'package:dg_certification_system/view/widgets/header_widget.dart';
import 'package:dg_certification_system/view/widgets/notifications_list_widget.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderWidget(),
        Expanded(
            flex: 4,
            child: Row(
              children:  [
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
                        child:  SizedBox(
                          height: 37,
                          child: Row(
                            children:  const [
                              SizedBox(width: defaultPadding),
                              Icon(Icons.add_circle_outline_rounded,color: Colors.white,),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
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
                      Expanded(child: CoursesGridWidget())
                    ],
                  ),
                ),
              ],
            )),
        const SizedBox(height: defaultPadding),
        Expanded(flex: 2, child: AvailableCourseList()),
      ],
    );
  }
}
