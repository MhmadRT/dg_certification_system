import 'package:flutter/material.dart';

import 'drag_and_drop_screen.dart';

class CertificatesThemesList extends StatefulWidget {
  const CertificatesThemesList(Key key);

  @override
  _CertificatesThemesListState createState() => _CertificatesThemesListState();
}

class _CertificatesThemesListState extends State<CertificatesThemesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DragAndDropScreen()));
            },
            child: const Text('اضافة'),
          )
        ],
      ),
    );
  }
}
