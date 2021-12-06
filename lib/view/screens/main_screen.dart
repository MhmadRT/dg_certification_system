import 'package:dg_certification_system/controller/home_controller.dart';
import 'package:dg_certification_system/main.dart';
import 'package:dg_certification_system/view/widgets/menu_tap.dart';
import 'package:flutter/material.dart';

import '../../responsive.dart';

HomeController? homeController;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    homeController = HomeController(context: context, index: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return homeController == null
        ? const CircularProgressIndicator()
        : StreamBuilder<dynamic>(
            stream: homeController!.streamController.stream,
            builder: (context, snapshot) {
              return Scaffold(
                appBar: Responsive.isMobile(context)
                    ? AppBar(
                        iconTheme: IconThemeData(
                            color: Theme.of(context).primaryColor),
                      )
                    : null,
                drawer: Responsive.isMobile(context)
                    ? Drawer(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'images/logo.png',
                                  width: 100,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: homeController!.taps!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MenuTap(
                                          menuTapModel:
                                              homeController!.taps![index],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : null,
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!Responsive.isMobile(context))
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 6,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'images/logo.png',
                                    width: 100,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: homeController!.taps!.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return MenuTap(
                                          menuTapModel:
                                              homeController!.taps![index],
                                        );
                                      },
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/images/logo_white_text.png',
                                    color: Theme.of(context).accentColor,
                                    width: 100,
                                  )
                                ],
                              ),
                            ),
                          ),
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: appLang == 'ar'
                                        ? Radius.circular(20)
                                        : Radius.circular(0),
                                    topLeft: appLang == 'ar'
                                        ? Radius.circular(20)
                                        : Radius.circular(0),
                                    bottomRight: appLang == 'ar'
                                        ? Radius.circular(0)
                                        : Radius.circular(20),
                                    topRight: appLang == 'ar'
                                        ? Radius.circular(0)
                                        : Radius.circular(20)),
                                color: Color(0xffF3F5F8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(28.0),
                                child: homeController!
                                    .screen[homeController!.index],
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
  }
}
