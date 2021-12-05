import 'package:dg_certification_system/utils/constants.dart';
import 'package:dg_certification_system/view/widgets/add_course.dart';
import 'package:dg_certification_system/view/widgets/courses_list_screen.dart';
import 'package:flutter/material.dart';


import '../../responsive.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                if (Responsive.isMobile(context))
                  const SizedBox(height: defaultPadding),
                const CoursesListWidget(),
                if (Responsive.isMobile(context))
                  const SizedBox(height: defaultPadding),
                if (Responsive.isMobile(context))  AddCourse(),
              ],
            ),
          ),
          if (!Responsive.isMobile(context))
            const SizedBox(width: defaultPadding),
          // On Mobile means if the screen is less than 850 we dont want to show it
          if (!Responsive.isMobile(context))
             Expanded(
              flex: 3,
              child: AddCourse(),
            ),
        ],
      ),
    );
  }
}
