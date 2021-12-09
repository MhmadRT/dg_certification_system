import 'package:dg_certification_system/controller/courses_by_category_controller.dart';
import 'package:dg_certification_system/model/category_model.dart';
import 'package:dg_certification_system/responsive.dart';
import 'package:dg_certification_system/view/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  final CategoryData categoryData;

  const CategoryScreen({Key? key, required this.categoryData})
      : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  CoursesByCategoryController? coursesByCategoryController;

  @override
  void initState() {
    // TODO: implement initState
    coursesByCategoryController = CoursesByCategoryController(
        context: context, categoryData: widget.categoryData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color(0xfff3f5f8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const HeaderWidget(),
                    ],
                  ),
                  StreamBuilder<dynamic>(
                      stream: coursesByCategoryController!.streamController.stream,
                      builder: (context, snapshot) {
                        return coursesByCategoryController!.loading?
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                  child: GridView.builder(
                                    padding: const EdgeInsets.symmetric(vertical: 20),
                                    itemCount: 10,
                                    shrinkWrap: true,
                                    gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                      Responsive.isMobile(context) ? 2 : 3,
                                      childAspectRatio: 1.5,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                    ),
                                    itemBuilder: (BuildContext context, int index) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                          'assets/images/loading.gif',
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                  )),
                            ],
                          ),
                        ):
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                  child: GridView.builder(
                                    padding: const EdgeInsets.symmetric(vertical: 20),
                                    itemCount: coursesByCategoryController!
                                        .courses!.data.length,
                                    shrinkWrap: true,
                                    gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                      Responsive.isMobile(context) ? 2 : 4,
                                      childAspectRatio: 1.5,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                    ),
                                    itemBuilder: (BuildContext context, int index) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                          'https://images.unsplash.com/photo-1501504905252-473c47e087f8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y291cnNlfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                  )),
                            ],
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
