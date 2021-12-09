import 'package:dg_certification_system/controller/course_controller.dart';
import 'package:dg_certification_system/main.dart';
import 'package:dg_certification_system/responsive.dart';
import 'package:dg_certification_system/utils/constants.dart';
import 'package:dg_certification_system/view/screens/traine_course_list.dart';
import 'package:dg_certification_system/view/widgets/xls_upload_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvailableCourseList extends StatefulWidget {
  const AvailableCourseList({Key? key}) : super(key: key);

  @override
  State<AvailableCourseList> createState() => _AvailableCourseListState();
}
CourseController? coursesController;
class _AvailableCourseListState extends State<AvailableCourseList> {

  @override
  void initState() {
    super.initState();
    coursesController = CourseController(context);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
        stream: coursesController!.streamController.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active) {
            return const SizedBox(
                height: 30,
                width: 30,
                child: FittedBox(child: CircularProgressIndicator()));
          } else {
            return Container(
              padding: const EdgeInsets.all(defaultPadding),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text('قائمة الدورات المتاحة'),
                    ],
                  ),
                  const SizedBox(height: defaultPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'الرقم',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'اسم الدورة',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (!Responsive.isMobile(context))
                        Expanded(
                          child: Container(),
                        ),
                      if (!Responsive.isMobile(context))
                        const Expanded(
                          flex: 2,
                          child: Text(''),
                        ),
                      if (!Responsive.isMobile(context))
                        Expanded(
                          child: Container(),
                        ),
                      if (!Responsive.isMobile(context))
                        const Expanded(
                          flex: 2,
                          child: Text(''),
                        ),
                      if (Responsive.isMobile(context))
                        const SizedBox(
                          width: defaultPadding,
                        ),
                      if (Responsive.isMobile(context))
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'اجراءات',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )),
                    ],
                  ),
                  const SizedBox(height: defaultPadding),
                    ListView.separated(
                      shrinkWrap: true,
                      controller: ScrollController(),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: coursesController!.courses!.data.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(
                        thickness: 0.5,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {

                          },
                          child: Hero(
                            tag: 'trnsList',
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Color(0xffF3F5F8),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: SizedBox(
                                            child: Text(coursesController!.courses!.data[index].cnum.toString()),
                                          ),
                                        ),
                                      ),
                                    )),
                                Expanded(
                                  child: Container(),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xffF3F5F8),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(coursesController!.courses!.data[index].cname),
                                      ),
                                    ),
                                  ),
                                ),
                                if (!Responsive.isMobile(context))
                                  Expanded(
                                    child: Container(),
                                  ),
                                if (!Responsive.isMobile(context))
                                  Expanded(
                                      flex: 2,
                                      child: SizedBox(
                                          child: ElevatedButton.icon(
                                              icon: const Icon(
                                                Icons
                                                    .add_circle_outline_rounded,
                                                color: Colors.white,
                                              ),
                                              label: const Text("إضافة متدربين"),
                                              style: TextButton.styleFrom(
                                                backgroundColor: secondColor,
                                              ),
                                              onPressed: () {
                                                xlsUpload(0)
                                                    .pickFile();
                                              }))),
                                if (!Responsive.isMobile(context))
                                  Expanded(child: Container()),
                                if (!Responsive.isMobile(context))
                                  Expanded(
                                      flex: 2,
                                      child: SizedBox(
                                          child: ElevatedButton.icon(
                                              icon: const Icon(
                                                Icons
                                                    .add_circle_outline_rounded,
                                                color: Colors.white,
                                              ),
                                              label: const Text("اصدار شهاده"),
                                              style: TextButton.styleFrom(
                                                backgroundColor: secondColor,
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  PageRouteBuilder(
                                                    opaque: false,
                                                    barrierDismissible: true,
                                                    fullscreenDialog: false,
                                                    transitionDuration:
                                                        const Duration(
                                                            milliseconds: 1000),
                                                    pageBuilder: (BuildContext
                                                            context,
                                                        Animation<double>
                                                            animation,
                                                        Animation<double>
                                                            secondaryAnimation) {
                                                      return EmployeeList(
                                                        courseId:
                                                           0,
                                                      );
                                                    },
                                                    transitionsBuilder:
                                                        (BuildContext context,
                                                            Animation<double>
                                                                animation,
                                                            Animation<double>
                                                                secondaryAnimation,
                                                            Widget child) {
                                                      return Align(
                                                        child: FadeTransition(
                                                          opacity: animation,
                                                          child: child,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              }))),
                                if (Responsive.isMobile(context))
                                  if (Responsive.isMobile(context))
                                    const SizedBox(
                                      width: defaultPadding,
                                    ),
                                if (Responsive.isMobile(context))
                                  Expanded(
                                      child: InkWell(
                                        onTap: () {

                                        },
                                        child: SvgPicture.asset(
                                    'assets/svg/options.svg',
                                    height: 20,
                                  ),
                                      )),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                ],
              ),
            );
          }
        });
  }
}
