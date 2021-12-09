import 'package:dg_certification_system/model/category_model.dart';
import 'package:dg_certification_system/utils/constants.dart';
import 'package:dg_certification_system/view/screens/category_screen.dart';
import 'package:flutter/material.dart';

class CategoryCardWidget extends StatelessWidget {
  final CategoryData categoryData;

  const CategoryCardWidget({Key? key, required this.categoryData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border:
                  Border.all(color: Theme.of(context).accentColor, width: 0.3),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9jdXN8ZW58MHx8MHx8&w=1000&q=80',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    categoryData.catTitle,
                    maxLines: 2,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: defaultPadding / 2),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoryScreen(
                                categoryData: categoryData,
                              )));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: SelectableText(
                        'تصفح القسم',
                        style: TextStyle(color: Colors.white),
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
  }
}
