import 'package:dg_certification_system/view/widgets/course_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoursesGridWidget extends StatelessWidget {
  const CoursesGridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return GridView.builder(

        controller: ScrollController(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,

        ),
        itemBuilder: (_, index) => const SizedBox(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: CourseCardWidget(
                image:
                    'https://academy.dimensionsgroup.sa/wp-content/uploads/2020/12/WhatsApp-Image-2020-12-10-at-11.16.49-AM.jpeg'),
          ),
        ),
        itemCount: 4,
      );
  }
}
