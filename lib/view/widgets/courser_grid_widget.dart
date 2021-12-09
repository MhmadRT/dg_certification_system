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
      itemBuilder: (BuildContext context,
          int index) {
        return Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                BorderRadius.circular(
                    8),
                child: Image.network(
                  'https://images.unsplash.com/photo-1501504905252-473c47e087f8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y291cnNlfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TraineesScreen(courseId: courses.data[index].cnum),));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(
                              context)
                              .accentColor,
                          borderRadius:
                          BorderRadius
                              .circular(
                              5)),
                      child: const Center(
                        child: Padding(
                          padding:
                          EdgeInsets
                              .all(8),
                          child: Text(
                            'عرض الدورة',
                            style: TextStyle(
                                color: Colors
                                    .white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
      itemCount: courses.data.length,
    );
  }
}
