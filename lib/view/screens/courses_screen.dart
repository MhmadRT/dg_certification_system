import 'package:dg_certification_system/controller/category_controller.dart';
import 'package:dg_certification_system/utils/constants.dart';
import 'package:dg_certification_system/view/widgets/add_course.dart';
import 'package:dg_certification_system/view/widgets/courses_list_screen.dart';
import 'package:dg_certification_system/view/widgets/header_widget.dart';
import 'package:dg_certification_system/view/widgets/search_field_widget.dart';
import 'package:dg_certification_system/view/widgets/user_card_widget.dart';
import 'package:flutter/material.dart';

import '../../responsive.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderWidget(),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 3,
                child: CoursesListWidget(),
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
        ),
      ],
    );
  }
}
