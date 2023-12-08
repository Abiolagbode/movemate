import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/instance_manager.dart';
import 'package:movemate/components/scaffold.dart';
import 'package:movemate/constants.dart';
import 'package:movemate/controller/global_controller.dart';
import 'package:movemate/utils/typography.dart';
import 'package:movemate/views/home/widget/availablevehicle.dart';
import 'package:movemate/views/home/widget/searchfilter.dart';
import 'package:movemate/views/home/widget/tracking.dart';
import 'package:sizer/sizer.dart';

import '../../colors.dart';
import '../../components/GradientContainer.dart';
import '../../components/TextInput.dart';

class MyHomePage extends StatefulWidget {
  bool? visibility;

  MyHomePage({this.visibility});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalController globalController = Get.put(GlobalController());

  final Duration duration = const Duration(milliseconds: 0);
  TextEditingController searchQuestions = new TextEditingController();
  TextEditingController searchController = TextEditingController();
  bool _visible = true;

  FocusNode searchFocus = FocusNode();
  bool visible = false;
  @override
  void initState() {
    if (widget.visibility != null) {
      visible = widget.visibility!;
    } else {
      visible = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStore textStore = new TextStore(context);

    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        body: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Container(
              child: Stack(
            children: [dashboard(context, textStore)],
          )),
        ),
      );
    });
  }

  Widget dashboard(context, TextStore textStore) {
    Size size = MediaQuery.of(context).size;

    return Material(
      animationDuration: duration,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      elevation: 0,
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(children: [
          Stack(
            children: [
              Positioned(bottom: 0.h, child: GradientSecondContainer(size)),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 6.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                      height: 55,
                                      width: 55,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.transparent),
                                      child: Image.asset(
                                          'assets/images/Ellipse2.png')),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.near_me_sharp,
                                          color: WHITE.withOpacity(0.9),
                                        ),
                                        tiny5HorSpace(),
                                        Text("Your location",
                                            style: textStore.Body16Regular(
                                                    color:
                                                        WHITE.withOpacity(0.9))
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w300)),
                                      ],
                                    ),
                                    smallHorSpace(),
                                    Row(
                                      children: [
                                        Text(
                                          "Wertheimer, Illinois",
                                          style: textStore.Body16Regular(
                                                  color: WHITE)
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 19),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: WHITE,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: WHITE),
                                  child: Icon(
                                    Icons.notifications_none,
                                    size: 30,
                                  )
                                  // Image.asset(
                                  //     'assets/icons/notificationbtn.png')
                                  ),
                            ),
                          ],
                        ),
                      ),
                      tinySpace(),
                      FittedBox(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              globalController.isCollapse.value =
                                  !globalController.isCollapse.value;
                            });
                            pushRoute(context, SearchFilter());
                          },
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: TextInputForm(
                                      controller: searchQuestions,
                                      enabled: false,
                                      suffixIcon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Colors.orange),
                                          child: Icon(
                                            Icons
                                                .format_indent_increase_outlined,
                                            color: WHITE,
                                          )),
                                      prefixIcon: new Icon(Icons.search),
                                      keyboardType: TextInputType.number,
                                      validator: (value) {},
                                      onChanged: (text) {},
                                      hint: 'Enter the receipt number ...',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      smallSpace(),
                    ]),
              ),
            ],
          ).animate().fade(duration: 1000.ms).slideY(curve: Curves.ease),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                mediumSpace(),
                TrackingScreen(),
                smallSpace(),
                AvailableVehicle(),
              ],
            ),
          ).animate().fade(duration: 1000.ms).slide(begin: Offset(0, 1.5))
        ]),
      ),
    );
  }
}
