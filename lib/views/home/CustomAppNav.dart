import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movemate/colors.dart';
import 'package:movemate/controller/global_controller.dart';
import 'package:movemate/views/home/HomeScreen.dart';
import 'package:movemate/views/settings/profile/profile.dart';
import 'package:movemate/views/shipment/shipmenthistory.dart';

import '../calculate/calculatescreen.dart';

class CustomAppBarNav extends StatefulWidget {
  int setPage;
  CustomAppBarNav({this.setPage = 0});
  @override
  State<CustomAppBarNav> createState() => _CustomAppBarNavState();
}

class _CustomAppBarNavState extends State<CustomAppBarNav>
    with TickerProviderStateMixin {
  final GlobalController globalController = Get.find<GlobalController>();
  TabController? tabController;

  int currentTab = 0;

  final List<Widget> screen = [
    MyHomePage(),
    Calculate(),
    ShipmentHistory(),
    ProfileScreen(isback: false),
  ];

  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);

    currentTab = widget.setPage;
  }

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = MyHomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screen.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(
        selectedColor: PRIMARY40,
        unSelectedColor: Colors.black54,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        unselectedIconSize: 25,
        selectedIconSize: 25,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        enableLineIndicator: true,
        lineIndicatorWidth: 5,
        indicatorType: IndicatorType.Top,
        customBottomBarItems: [
          CustomBottomBarItems(
            label: 'Home',
            icon: Icons.home_outlined,
          ),
          CustomBottomBarItems(
            label: 'Calculate',
            icon: Icons.calculate_outlined,
          ),
          CustomBottomBarItems(
              label: 'Shipment', icon: Icons.autorenew_outlined),
          CustomBottomBarItems(
            label: 'Profile',
            icon: Icons.person_2_outlined,
          ),
        ],
      ),
    );
  }
}
