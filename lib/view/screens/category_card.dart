import 'package:dg_certification_system/model/category_model.dart';
import 'package:dg_certification_system/utils/constants.dart';
import 'package:flutter/material.dart';

class CategoryCardWidget extends StatelessWidget {
  final CategoryData categoryData;

  const CategoryCardWidget({Key? key, required this.categoryData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: Theme.of(context).accentColor, width: 0.3),
                image: DecorationImage(
                  image: NetworkImage(
                    categoryData.icon,
                  ),
                  fit: BoxFit.cover,
                )),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
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
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(5)),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'تصفح القسم',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: defaultPadding),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(5)),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'اضف دورة',
                      style: TextStyle(color: Colors.white),
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
