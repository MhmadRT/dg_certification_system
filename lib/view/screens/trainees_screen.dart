import 'package:dg_certification_system/controller/course_controller.dart';
import 'package:dg_certification_system/controller/trainees_controller.dart';
import 'package:dg_certification_system/utils/constants.dart';
import 'package:dg_certification_system/view/widgets/add_trainee.dart';
import 'package:dg_certification_system/view/widgets/available_course_list.dart';
import 'package:dg_certification_system/view/widgets/header_widget.dart';
import 'package:dg_certification_system/view/widgets/trainees_list_widget.dart';
import 'package:flutter/material.dart';

import '../../responsive.dart';

class TraineesScreen extends StatefulWidget {
  const TraineesScreen({Key? key, required this.courseId}) : super(key: key);
  final int courseId;

  @override
  State<TraineesScreen> createState() => _TraineesScreenState();
}

class _TraineesScreenState extends State<TraineesScreen> {
  TraineesCourseController? _traineesCourseController;

  @override
  void initState() {
    _traineesCourseController=TraineesCourseController(context, widget.courseId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder<dynamic>(
        future: _traineesCourseController!.getData(widget.courseId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return   _traineesCourseController!.loading
              ? Center(
            child: CircularProgressIndicator(),
          )
              :Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(

                children: [
                  const HeaderWidget(isBack: true,),
                  Expanded(

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Expanded(
                          flex: 3,
                          child: TraineesListWidget(trainees:_traineesCourseController!.trainees),
                        ),
                        if (!Responsive.isMobile(context))
                          const SizedBox(width: defaultPadding),
                        // On Mobile means if the screen is less than 850 we dont want to show it
                        if (!Responsive.isMobile(context))
                          const Expanded(
                            flex: 2,
                            child: AddTraineeWidget(),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        }
      ),
    );
  }
}
