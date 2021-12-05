import 'package:dg_certification_system/model/employeesModel.dart';
import 'package:dg_certification_system/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../responsive.dart';

class EmployeeList extends StatefulWidget {
  int courseId;

  EmployeeList({
    Key? key, required this.courseId
  }) : super(key: key);

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  List<employeesModel> list = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'trnsList',
      child: Scaffold(
        backgroundColor: Colors.black54.withAlpha(10),
        body: Center(
          child: FutureBuilder<dynamic>(
            // future: getData(widget.courseId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                        color: Colors.transparent,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .6,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * .8,
                        child: Column(
                          children: [
                            Align(
                              alignment: const Alignment(-1, 0),
                              child: ElevatedButton.icon(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color(0xFF5D5F6E)),),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(
                                      Icons.clear, color: secondaryColor,
                                      size: 25),
                                  label: const Text("خروج")),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Container(
                                  padding: const EdgeInsets.all(defaultPadding),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .stretch,
                                    children: [
                                      Text(
                                        "قائمة المتدربين",
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                      const SizedBox(
                                        height: defaultPadding,
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                    flex: 1,
                                                    child: SizedBox(
                                                      child: Text(
                                                        "الرقم", style: Theme
                                                          .of(context)
                                                          .textTheme
                                                          .subtitle1,),
                                                    )),
                                                Expanded(
                                                    flex: 3,
                                                    child: SizedBox(
                                                        child: Text(
                                                          "اسم المتدرب",
                                                          style: Theme
                                                              .of(context)
                                                              .textTheme
                                                              .subtitle1,))),
                                                Expanded(
                                                    flex: 2,
                                                    child:
                                                    SizedBox(child: Text(
                                                      "البريد الالكتروني",
                                                      style: Theme
                                                          .of(context)
                                                          .textTheme
                                                          .subtitle1,))),
                                                Expanded(
                                                    flex: 2,
                                                    child: SizedBox(child: Text(
                                                      "رقم الموبايل",
                                                      style: Theme
                                                          .of(context)
                                                          .textTheme
                                                          .subtitle1,))),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: defaultPadding,
                                            ),
                                            const Divider(
                                              thickness: 0.5,
                                            ),
                                            ListView.separated(
                                              shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemCount: list.length,
                                              separatorBuilder:
                                                  (BuildContext context,
                                                  int index) =>
                                              const Divider(
                                                thickness: 0.5,
                                              ),
                                              itemBuilder:
                                                  (BuildContext context,
                                                  int index) {
                                                GlobalKey keyIndex = GlobalKey();
                                                return Row(
                                                  children: [
                                                    Expanded(
                                                        flex: 1,
                                                        child: SizedBox(
                                                          child: Text(
                                                              list[index].id
                                                                  .toString()),
                                                        )),
                                                    Expanded(
                                                      flex: 3,
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            height: 30,
                                                            width: 30,
                                                            decoration: BoxDecoration(
                                                                border: Border
                                                                    .all(
                                                                    color: const Color(
                                                                        0xff545151),
                                                                    width: 2),
                                                                borderRadius: BorderRadius
                                                                    .circular(
                                                                    25.0)
                                                            ),
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius
                                                                  .circular(
                                                                  25.0),
                                                              child: Center(
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .all(2),
                                                                  child:
                                                                  list[index]
                                                                      .image ==
                                                                      '' ? Image
                                                                      .asset(
                                                                      "assets/images/persone.png",
                                                                      height: 38,
                                                                      color: const Color(
                                                                          0xffc8c6c6)
                                                                  ) : Image
                                                                      .network(
                                                                    "https://abaad.jo-schools.com/${list[index]
                                                                        .image}",
                                                                    height: 38,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          if (!Responsive
                                                              .isMobile(
                                                              context))
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal: 8.0),
                                                              child: Text(
                                                                  list[index]
                                                                      .name),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                        flex: 2,
                                                        child: SizedBox(
                                                          child: Text(
                                                              list[index]
                                                                  .email),
                                                        )),
                                                    Expanded(
                                                        flex: 2,
                                                        child: SizedBox(
                                                          child: Text(
                                                              list[index].mobile
                                                                  .toString()),
                                                        )),
                                                  ],
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                  );
                } else {
                  return const CircularProgressIndicator(
                    backgroundColor: primaryColor,);
                }
              }),
        ),
      ),
    );
  }
}
