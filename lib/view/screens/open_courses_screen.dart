import 'package:dg_certification_system/controller/course_controller.dart';

import 'package:dg_certification_system/view/widgets/courser_grid_widget.dart';
import 'package:dg_certification_system/view/widgets/header_widget.dart';
import 'package:flutter/material.dart';

import '../../responsive.dart';

class OpenCourserScreen extends StatefulWidget {
  const OpenCourserScreen({Key? key}) : super(key: key);

  @override
  State<OpenCourserScreen> createState() => _OpenCourserScreenState();
}

class _OpenCourserScreenState extends State<OpenCourserScreen> {
  CourseController? _coursesController;

  @override
  void initState() {
    _coursesController ??= CourseController(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderWidget(),
        FutureBuilder<dynamic>(
            future: _coursesController!.getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done)
                return _coursesController!.loading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(child: CoursesGridWidget(courses: _coursesController!.courses!,));
              else
                return Center(
                  child: CircularProgressIndicator(),
                );
            }),
      ],
    );
  }
}
