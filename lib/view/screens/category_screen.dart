import 'package:dg_certification_system/view/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color(0xfff3f5f8),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: const [
                HeaderWidget(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
