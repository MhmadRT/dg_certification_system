import 'package:dg_certification_system/utils/constants.dart';
import 'package:dg_certification_system/view/widgets/add_course.dart';
import 'package:dg_certification_system/view/widgets/categories_list_screen.dart';
import 'package:dg_certification_system/view/widgets/header_widget.dart';
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
          child: Flex(
            crossAxisAlignment: CrossAxisAlignment.start,
            direction:!Responsive.isMobile(context)?Axis.horizontal: Axis.vertical,
            children: [
              const Expanded(
                flex: 3,
                child: CategoriesListWidget(),
              ),
                const SizedBox(width: defaultPadding,height: defaultPadding,),
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
