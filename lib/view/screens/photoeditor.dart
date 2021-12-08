import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:scribble/scribble.dart';

import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class photoeditor extends StatefulWidget {
 final  Uint8List capturedImage;
  const photoeditor({Key? key, required this.capturedImage}) : super(key: key);
  @override
  _AddTextPageState createState() => _AddTextPageState();
}

class _AddTextPageState extends State<photoeditor> {
  late ScribbleNotifier notifier;
  ImageProvider? target;
  Uint8List? bytes;
  double posx = 100.0;
  double posy = 100.0;
  void  _onDragStart(BuildContext context, DragStartDetails start) {
    RenderBox? getBox = context.findRenderObject() as RenderBox?;
    var local = getBox!.globalToLocal(start.globalPosition);
    setState(() {
      posx = local.dx;
      posy = local.dy;
    });
  }
  void _onDragUpdate(BuildContext context, DragUpdateDetails update) {
    RenderBox? getBox = context.findRenderObject() as RenderBox?;
    var local = getBox!.globalToLocal(update.globalPosition);
    setState(() {
      posx = local.dx;
      posy = local.dy;
    });
  }
  final TextEditingController _controller = TextEditingController(text: '');
  String fontName = '';
  @override
  void initState() {
    notifier = ScribbleNotifier();
    super.initState();
  }
  GlobalKey keyindex = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('add text'),
      ),
      body:AspectRatio(
        key: keyindex,
        aspectRatio: 2/1,
        child: Image.memory(
          widget.capturedImage,
        ),
      ),
    );
  }
  }