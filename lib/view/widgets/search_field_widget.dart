import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37,
      child: TextField(
        decoration: InputDecoration(
          hintText: "البحث",
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          fillColor: Theme.of(context).accentColor,
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          hintStyle: const TextStyle(color: Colors.white),
          suffixIcon: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                "assets/svg/Search.svg",
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}