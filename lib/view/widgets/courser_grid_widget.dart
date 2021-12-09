import 'package:dg_certification_system/model/courses.dart';
import 'package:dg_certification_system/responsive.dart';
import 'package:dg_certification_system/utils/constants.dart';
import 'package:dg_certification_system/view/screens/trainees_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoursesGridWidget extends StatelessWidget {
  const CoursesGridWidget({Key? key, required this.courses}) : super(key: key);
  final Courses courses;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: ScrollController(),
      shrinkWrap: true,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: !Responsive.isMobile(context)?6:3,

      ),
      itemBuilder: (_, index) => InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => TraineesScreen(courseId: courses.data[index].cnum),));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              color: Colors.white,
              child: Image.network(
                'https://www.pikpng.com/pngl/b/180-1809582_share-this-article-certificate-transparent-background-clipart-png.png',
                fit: BoxFit.cover,
                color: primaryColor,
              ),
            ),
          ),
        ),
      ),
      itemCount: courses.data.length,
    );
  }
}
