import 'package:dg_certification_system/model/recent_file.dart';
import 'package:dg_certification_system/model/trainee.dart';
import 'package:dg_certification_system/utils/constants.dart';
import 'package:dg_certification_system/view/widgets/search_field_widget.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../responsive.dart';

class TraineesListWidget extends StatelessWidget {
  TraineesListWidget({
    Key? key,
    required this.trainees,
  }) : super(key: key);
  List<TraineesCourseModel>? trainees;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: cardColor,
        border: Border.all(
            width: 0.7, color: const Color(0xff707070).withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.04),
            spreadRadius: 2,
            blurRadius: 50,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: const SizedBox(
                    height: 37,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: SelectableText(
                          "المدربين",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(flex: 3, child: Container()),
                const Expanded(flex: 2, child: SearchField())
              ],
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: const [
                    Expanded(
                        flex: 2,
                        child: SelectableText(
                          "الأسم الكامل",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(width: defaultPadding,),
                    Expanded(
                        flex: 2,
                        child: SelectableText("ألبريد ألألكتروني",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                    SizedBox(width: defaultPadding,),
                    Expanded(
                        flex: 2,
                        child: SelectableText("رقم الهاتف",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: trainees!.length,
              itemBuilder: (context, index) =>
                  recentFileDataRow(trainees![index], context),
            ),
          ],
        ),
      ),
    );
  }
}

Widget recentFileDataRow(TraineesCourseModel fileInfo, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              if (!Responsive.isMobile(context))
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).accentColor),
              ),

                 Expanded(
                   child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                    child: SelectableText(fileInfo.fullName!),
                ),
                 ),
            ],
          ),
        ),
        SizedBox(width: defaultPadding,),
        Expanded(flex: 2, child: SelectableText(fileInfo.email!)),
        SizedBox(width: defaultPadding,),
        Expanded(flex: 2, child: SelectableText(fileInfo.mobile!)),
      ],
    ),
  );
}
