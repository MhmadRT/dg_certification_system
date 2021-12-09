import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:dg_certification_system/utils/constants.dart';
import 'package:dg_certification_system/view/widgets/header_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart'as http;
import 'package:screenshot/screenshot.dart';

import '../../model/item_model.dart';
import '../../responsive.dart';
import '../widgets/dragable_widget.dart';


class DragAndDropScreen extends StatefulWidget {
  const DragAndDropScreen({Key? key}) : super(key: key);

  @override
  _DragAndDropScreenState createState() => _DragAndDropScreenState();
}

class _DragAndDropScreenState extends State<DragAndDropScreen> {
  double height = 646;
  double width = 910;
  TextEditingController content = TextEditingController();
  FontWeight isBold = FontWeight.normal;
  TextAlign textAlign = TextAlign.center;
  List<DragWidget> listWidget = [];
  final ScrollController _horizontalScroll = ScrollController();
  final ScrollController _verticalScroll = ScrollController();
  GlobalKey _globalKey = new GlobalKey();
  ScreenshotController screenshotController = ScreenshotController();
  GlobalKey keyindex = GlobalKey();


  @override
  void dispose() {
    if (mounted) {
      _horizontalScroll.dispose();
      _verticalScroll.dispose();
    }
  }

  Color color = Colors.black;

  double textSize = 20;

  double widthContianer = 50;

  double qrSized = 50;

  String image = '';
  List<String> images = [
    'assets/images/certificate2-01.png',
  ];
  List<ItemModel> items = [];
  int resizeIndex = 0;

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Scrollbar(
        controller: _horizontalScroll,
        isAlwaysShown: true,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _horizontalScroll,
          child: Scrollbar(
            isAlwaysShown: true,
            controller: _verticalScroll,
            child: SingleChildScrollView(
              controller: _verticalScroll,
              child: SizedBox(
                height: screenHeight > 700 ? screenHeight : 1000,
                width: screenWidth > 1200 ? screenWidth : 2000,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xffF3F5F8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            children: [
                              const HeaderWidget(
                                isBack: true,
                              ),
                              const SizedBox(height: defaultPadding),
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.white),
                                child: Flex(
                                  direction: Responsive.isMobile(context)
                                      ? Axis.vertical
                                      : Axis.horizontal,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [add(), Column(
                                    children: [
                                      Screenshot(child: certificateBoundary(),
                                        controller: screenshotController,),
                                      MaterialButton(onPressed: _capturePn,color: Colors.red,)
                                    ],
                                  )],
                                ),
                              )),
                            ],
                          ),
                        )),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<String> finalText = [
    'COURSE_NAME',
    "TRAINEE_NAME",
    "TRAINER_NAME",
    "DATE"
  ];
  bool landScape = false;
  Future<Uint8List?> _capturePn() async {
    try {
      print('inside');
      RenderRepaintBoundary? boundary =
      _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;
      ui.Image image = await boundary!.toImage(pixelRatio: 3.0);
      ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      // print(pngBytes);
      // print(bs64);

      _createPDF(bs64);
      setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);
      return null;
    }
  }
  certificateBoundary() {
    return RepaintBoundary(
      key: _globalKey,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage('$image'),
                onError: (exception, stackTrace) => Container(
                      color: Colors.white,
                    ),
                fit: BoxFit.fill)),
        child: Stack(children: listWidget),
      ),
    );
  }

  add() {
    TextStyle titleStyle = TextStyle(
        fontWeight: FontWeight.bold, color: Theme.of(context).accentColor);
    return Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Row(
                    children: [
                      SelectableText('شكل العرض', style: titleStyle),
                      const SizedBox(
                        width: 10,
                      ),
                      MaterialButton(
                        elevation: 0,
                        onPressed: () {
                          landScape = false;
                          setState(() {});
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: SelectableText(
                            'Portrait',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        color: landScape
                            ? Colors.grey
                            : Theme.of(context).accentColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      MaterialButton(
                        elevation: 0,
                        onPressed: () {
                          landScape = true;
                          setState(() {});
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: SelectableText(
                            'Landscape',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        color: landScape
                            ? Theme.of(context).accentColor
                            : Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      )
                    ],
                  ),
                ),
                TextField(
                    onChanged: (v) {
                      setState(() {});
                    },
                    controller: content,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            content.clear();
                          },
                          icon: const Icon(Icons.clear),
                        ),
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        fillColor: Colors.white,
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.5),
                                width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.5),
                                width: 1)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.5),
                                width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.5),
                                width: 1)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.5),
                                width: 1)),
                        border:
                            OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Theme.of(context).accentColor.withOpacity(0.5), width: 1)),
                        hintText: 'إضافة محتوى',
                        hintStyle: TextStyle(color: Theme.of(context).accentColor.withOpacity(0.5), fontWeight: FontWeight.bold))),
                const SizedBox(
                  height: 10,
                ),
                SelectableText('اضافة الي النص', style: titleStyle),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    itemCount: finalText.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          content.text += " " + finalText[index] + ' ';
                        },
                        child: Card(
                          color: Theme.of(context).accentColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 10),
                            child: Center(
                                child: SelectableText(
                              finalText[index],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12),
                            )),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xffF3F5F8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SelectableText('الخط', style: titleStyle),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isBold = FontWeight.bold;
                                    });
                                    print(isBold.index);
                                  },
                                  child: Card(
                                    elevation: 0,
                                    color: isBold == FontWeight.bold
                                        ? Theme.of(context).accentColor
                                        : Colors.grey,
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 8),
                                      child: SelectableText(
                                        'Bold',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isBold = FontWeight.normal;
                                    });
                                    print(isBold.index);
                                  },
                                  child: Card(
                                    elevation: 0,
                                    color: isBold == FontWeight.normal
                                        ? Theme.of(context).accentColor
                                        : Colors.grey,
                                    child: const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: SelectableText(
                                        'Normal',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                      width: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xffF3F5F8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SelectableText('المحادات', style: titleStyle),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      textAlign = TextAlign.right;
                                    });
                                  },
                                  child: Card(
                                    elevation: 0.0,
                                    color: textAlign == TextAlign.right
                                        ? Theme.of(context).accentColor
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          width: 0.5,
                                          color: Theme.of(context).accentColor),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Icon(
                                          Icons.format_align_right,
                                          color: textAlign == TextAlign.right
                                              ? Colors.white
                                              : Theme.of(context).accentColor,
                                        )),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      textAlign = TextAlign.center;
                                    });
                                  },
                                  child: Card(
                                    elevation: 0.0,
                                    color: textAlign == TextAlign.center
                                        ? Theme.of(context).accentColor
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          width: 0.5,
                                          color: Theme.of(context).accentColor),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Icon(
                                          Icons.format_align_center,
                                          color: textAlign == TextAlign.center
                                              ? Colors.white
                                              : Theme.of(context).accentColor,
                                        )),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      textAlign = TextAlign.left;
                                    });
                                  },
                                  child: Card(
                                    elevation: 0.0,
                                    color: textAlign == TextAlign.left
                                        ? Theme.of(context).accentColor
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          width: 0.5,
                                          color: Theme.of(context).accentColor),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Icon(
                                          Icons.format_align_left,
                                          color: textAlign == TextAlign.left
                                              ? Colors.white
                                              : Theme.of(context).accentColor,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                      width: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xffF3F5F8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SelectableText(
                              'اللون',
                              style: titleStyle,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    color = Colors.black;
                                    setState(() {});
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Card(
                                        color: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3000),
                                        ),
                                        child: const SizedBox(
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                      AnimatedContainer(
                                        width: color == Colors.black ? 5 : 0,
                                        height: color == Colors.black ? 5 : 0,
                                        duration:
                                            const Duration(milliseconds: 200),
                                        decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            shape: BoxShape.circle),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    color = Colors.white;
                                    setState(() {});
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Card(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3000),
                                        ),
                                        child: const SizedBox(
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                      AnimatedContainer(
                                        width: color == Colors.white ? 5 : 0,
                                        height: color == Colors.white ? 5 : 0,
                                        duration:
                                            const Duration(milliseconds: 200),
                                        decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            shape: BoxShape.circle),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    color = Colors.grey;
                                    setState(() {});
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Card(
                                        color: Colors.grey,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3000),
                                        ),
                                        child: const SizedBox(
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                      AnimatedContainer(
                                        width: color == Colors.grey ? 5 : 0,
                                        height: color == Colors.grey ? 5 : 0,
                                        duration:
                                            const Duration(milliseconds: 200),
                                        decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            shape: BoxShape.circle),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    color = Theme.of(context).primaryColor;
                                    setState(() {});
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Card(
                                        color: Theme.of(context).primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3000),
                                        ),
                                        child: const SizedBox(
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                      AnimatedContainer(
                                        width: color ==
                                                Theme.of(context).primaryColor
                                            ? 5
                                            : 0,
                                        height: color ==
                                                Theme.of(context).primaryColor
                                            ? 5
                                            : 0,
                                        duration:
                                            const Duration(milliseconds: 200),
                                        decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            shape: BoxShape.circle),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    color = Theme.of(context).accentColor;
                                    setState(() {});
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Card(
                                        color: Theme.of(context).accentColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3000),
                                        ),
                                        child: const SizedBox(
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                      AnimatedContainer(
                                        width: color ==
                                                Theme.of(context).accentColor
                                            ? 5
                                            : 0,
                                        height: color ==
                                                Theme.of(context).accentColor
                                            ? 5
                                            : 0,
                                        duration:
                                            const Duration(milliseconds: 200),
                                        decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            shape: BoxShape.circle),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              resizeIndex = 0;
                            });
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 15),
                              child: SelectableText('حجم الخط', style: titleStyle),
                            ),
                            decoration: BoxDecoration(
                                border: resizeIndex == 0
                                    ? Border(
                                        bottom: BorderSide(
                                            width: 3,
                                            color:
                                                Theme.of(context).primaryColor),
                                      )
                                    : null),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            height: 25,
                            color: Colors.grey.shade200,
                            width: 1.5,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              resizeIndex = 1;
                            });
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 15),
                              child: SelectableText('محيط الخط', style: titleStyle),
                            ),
                            decoration: BoxDecoration(
                                border: resizeIndex == 1
                                    ? Border(
                                        bottom: BorderSide(
                                            width: 3,
                                            color:
                                                Theme.of(context).primaryColor),
                                      )
                                    : null),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            height: 25,
                            color: Colors.grey.shade200,
                            width: 1.5,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              resizeIndex = 2;
                            });
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 15),
                              child:
                                  SelectableText('حجم المكون الإضافي', style: titleStyle),
                            ),
                            decoration: BoxDecoration(
                                border: resizeIndex == 2
                                    ? Border(
                                        bottom: BorderSide(
                                            width: 3,
                                            color:
                                                Theme.of(context).primaryColor),
                                      )
                                    : null),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    slide(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: widthContianer,
                      color: Colors.black12,
                      child: SelectableText(
                        content.text,
                        textAlign: textAlign,
                        style: TextStyle(
                            fontWeight: isBold,
                            color: color,
                            fontSize: textSize),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText('مكونات اخرى انقر للإضافة', style: titleStyle),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {
                                  listWidget.add(
                                    DragWidget(
                                      itemModel: ItemModel(
                                          width: qrSized,
                                          height: 0,
                                          color: 0,
                                          align: 0,
                                          courseId: 0,
                                          fontWight: 0,
                                          qrCode: 'qr',
                                          text: '',
                                          textSize: 0,
                                          type: 2,
                                          x: 50,
                                          y: 50),
                                      width: width,
                                      high: height,
                                      countInStack: 2,
                                      // child: Icon(
                                      //   Icons.qr_code_rounded,
                                      //   size: qrSized,
                                      // ),
                                    ),
                                  );
                                  setState(() {});
                                },
                                child: SvgPicture.asset(
                                  'assets/svg/upload_photo.svg',
                                  color: Theme.of(context).accentColor,
                                  width: qrSized,
                                  height: qrSized,
                                )),
                            const SelectableText('اضافة صورة')
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                pickFile();
                              },
                              child: SvgPicture.asset(
                                'assets/svg/qr.svg',
                                color: Theme.of(context).accentColor,
                                width: qrSized,
                                height: qrSized,
                              ),
                            ),
                            const SelectableText('QR')
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        if (filesPikerResult != null)
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: const Color(0xffF3F5F8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: InkWell(
                                onTap: () {
                                  listWidget.add(
                                    DragWidget(
                                      itemModel: ItemModel(
                                          height: qrSized,
                                          width: 0,
                                          color: 0,
                                          align: 0,
                                          courseId: 0,
                                          fontWight: 0,
                                          qrCode: '',
                                          text: filesPikerResult!
                                              .files.first.bytes!,
                                          textSize: 0,
                                          type: 1,
                                          x: 50,
                                          y: 50),
                                      countInStack: listWidget.length + 1,
                                      width: width,
                                      high: height,
                                    ),
                                  );
                                  filesPikerResult = null;
                                  setState(() {});
                                },
                                child: Image.memory(
                                  filesPikerResult!.files.first.bytes!,
                                  height: qrSized,
                                ),
                              ),
                            ),
                          ),
                        if (filesPikerResult != null)
                          const SizedBox(
                            width: 10,
                          ),
                        if (filesPikerResult != null)
                          InkWell(
                            onTap: () {
                              filesPikerResult = null;
                              setState(() {});
                            },
                            child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffF3F5F8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.clear,
                                    color: Theme.of(context).accentColor,
                                  ),
                                )),
                          )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  height: 60,
                  onPressed: () {
                    listWidget.add(DragWidget(
                        itemModel: ItemModel(
                            width: widthContianer,
                            height: 0,
                            color: color.value,
                            align: textAlign.index,
                            courseId: 0,
                            fontWight: isBold.index,
                            qrCode: '',
                            text: content.text,
                            textSize: textSize,
                            type: 0,
                            x: 50,
                            y: 50),
                        countInStack: 1,
                        high: height,
                        width: width));
                    print(items);
                    setState(() {});
                  },
                  child: const SelectableText(
                    'إضافة',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                SelectableText(
                  'اختر الخلفية',
                  style: titleStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: (100 / 1.41),
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          image = images[index];
                          setState(() {});
                        },
                        child: Image.asset(
                          images[index],
                          width: 100,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    print("CENTER:${TextAlign.center.index}");
                    print("LEFT:${TextAlign.left.index}");
                    print("RIGHT:${TextAlign.right.index}");
                    print("BLUE:${Colors.blue.value}");
                    print("BOLD:${FontWeight.bold}");
                    print("NORMAL:${FontWeight.normal}");
                    listWidget.clear();
                    items.clear();
                    setState(() {});
                  },
                  child: SelectableText('حذف الكل'),
                ),
              ],
            ),
          ),
        ));
  }

  FilePickerResult? filesPikerResult;

  pickFile() async {
    await FilePicker.platform.pickFiles(allowMultiple: false).then((value) {
      setState(() {
        filesPikerResult = value;
      });
    });
  }

  slide() {
    switch (resizeIndex) {
      case 0:
        return Slider(
            value: textSize,
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Theme.of(context).primaryColor.withOpacity(0.3),
            min: 10,
            max: 100,
            onChanged: (v) {
              textSize = v;
              setState(() {});
            });
      case 1:
        return Slider(
            value: widthContianer,
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Theme.of(context).primaryColor.withOpacity(0.3),
            min: 10,
            max: width,
            onChanged: (v) {
              widthContianer = v;
              setState(() {});
            });
      case 2:
        return Slider(
            value: qrSized,
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Theme.of(context).primaryColor.withOpacity(0.3),
            min: 10,
            max: 150,
            onChanged: (v) {
              qrSized = v;
              setState(() {});
            });
    }
  }
  String imageString='';

  Future<Uint8List?> _capturePng() async {
    var container = Container(
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent,
              width: 5.0),
          color: Colors.redAccent,
        ),
        child: SelectableText(
          "This is an invisible widget",
          style: Theme
              .of(context)
              .textTheme
              .headline6,
        ));
    screenshotController
        .captureFromWidget(
        InheritedTheme.captureAll(
            context, Material(child: certificateBoundary())),
        delay: Duration(seconds: 1))
        .then((capturedImage) async {
      // print( base64.encode(capturedImage));

      _createPDF(base64.encode(capturedImage).toString());
      // Navigator.push(
      //   context,
      //   PageRouteBuilder(
      //     pageBuilder: (c, a1, a2) =>
      //         photoeditor(capturedImage: capturedImage),
      //     transitionsBuilder: (c, anim, a2,
      //         child) =>
      //         FadeTransition(
      //             opacity: anim, child: child),
      //     transitionDuration: Duration(
      //         milliseconds: 1000),
      //   ),
      // );
    }).catchError((onError) {
      print(onError);
    });
  }


  Future<void> _createPDF(String? _imageString) async {
    //Create a PDF document.
    // PdfDocument document = PdfDocument();
    // //Add a page and draw text
    // document.pages.add().graphics.drawImage(PdfBitmap.fromBase64String(_imageString!),Rect.fromLTWH(0, 0, 100, 100));
    var headers = {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    var request = http.Request('GET', Uri.parse('https://training.jo-schools.com/api/pngToPdf.php'));
    request.body = json.encode({
      "image": "$_imageString"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

    //
    // //Save the document
    // List<int> bytes = document.save();
    // final blob = html.Blob([bytes], 'application/pdf');
    // print(document.pages.count);
    // final url = html.Url.createObjectUrlFromBlob(blob);
    // html.window.open(url, "_blank");
    // html.Url.revokeObjectUrl(url);
    // //Dispose the document
    // document.dispose();
  }
}
