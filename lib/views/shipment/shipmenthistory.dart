import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:movemate/constants.dart';

import '../../colors.dart';
import '../../utils/typography.dart';
import '../home/index.dart';

class ShipmentHistory extends StatefulWidget {
  bool? isback;
  ShipmentHistory({this.isback});
  @override
  State<ShipmentHistory> createState() => _ShipmentHistoryState();
}

class _ShipmentHistoryState extends State<ShipmentHistory>
    with TickerProviderStateMixin {
  int _tabIndex = 0;
  int? selectedItem;
  TabController? tabController;
  List<Map> filteredValue = [];
  List<Map> inProgressValue = [];
  List<Map> pendingValue = [];
  List<Map> cancelValue = [];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this)
      ..addListener(_handleTabSelection);
    callHistory();
  }

  void _handleTabSelection() {
    setState(() {
      _tabIndex = tabController!.index;
    });
  }

  callHistory() {
    shippingHistory.forEach((shippingHistory) {
      setState(() {
        if (shippingHistory['status'].toString().contains('completed')) {
          filteredValue.add(shippingHistory);
        }

        print('I got here');
      });
    });
    shippingHistory.forEach((shippingHistory) {
      setState(() {
        if (shippingHistory['status'].toString().contains('in-progress')) {
          inProgressValue.add(shippingHistory);
        }

        print('I got here');
      });
    });
    shippingHistory.forEach((shippingHistory) {
      setState(() {
        if (shippingHistory['status'].toString().contains('pending')) {
          pendingValue.add(shippingHistory);
        }

        print('I got here');
      });
    });
    shippingHistory.forEach((shippingHistory) {
      setState(() {
        if (shippingHistory['status'].toString().contains('canceled')) {
          cancelValue.add(shippingHistory);
        }

        print('I got here');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStore textStore = new TextStore(context);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: InkWell(
              onTap: () => widget.isback == true
                  ? Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                      return DashboardEntry();
                    }), (Route<dynamic> route) => false)
                  : null,
              child: Container(
                  height: 25,
                  width: 25,
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: WHITE,
                  )),
            ),
          ),
          title: Text(
            "Shipment history",
            style: textStore.Body16SemiBold(color: WHITE),
          ),
          backgroundColor: PRIMARY40,
          surfaceTintColor: WHITE,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: TabBar(
              isScrollable: true,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white.withOpacity(0.7),
              labelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              onTap: (int index) {
                setState(() {
                  selectedItem = index;
                });
              },
              indicatorColor: Colors.orange,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('All'),
                      tiny5HorSpace(),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: selectedItem == 0
                                ? Colors.orange
                                : Colors.deepPurpleAccent.withOpacity(0.6)),
                        child: Center(
                            child: Container(
                                child:
                                    Text(shippingHistory.length.toString()))),
                      )
                    ],
                  ),
                ),
                Tab(
                  child: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Complete'),
                        tiny5HorSpace(),
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: selectedItem == 1
                                  ? Colors.orange
                                  : Colors.deepPurpleAccent.withOpacity(0.6)),
                          child: Center(
                              child: Container(
                                  child:
                                      Text(filteredValue.length.toString()))),
                        )
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('In Progress'),
                        tiny5HorSpace(),
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: selectedItem == 2
                                  ? Colors.orange
                                  : Colors.deepPurpleAccent.withOpacity(0.6)),
                          child: Center(
                              child: Container(
                                  child:
                                      Text(inProgressValue.length.toString()))),
                        )
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Pending'),
                        tiny5HorSpace(),
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: selectedItem == 3
                                  ? Colors.orange
                                  : Colors.deepPurpleAccent.withOpacity(0.6)),
                          child: Center(
                              child: Container(
                                  child: Text(pendingValue.length.toString()))),
                        )
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Cancelled'),
                        tiny5HorSpace(),
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: selectedItem == 4
                                  ? Colors.orange
                                  : Colors.deepPurpleAccent.withOpacity(0.6)),
                          child: Center(
                              child: Container(
                                  child: Text(cancelValue.length.toString()))),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ).animate().fade(duration: 500.ms).slide(begin: Offset(0.2, 0)),
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: BODY_PADDING, vertical: 20),
                      child: Row(
                        children: [
                          Text(
                            'Shipments',
                            style: textStore.Body16SemiBold(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: shippingHistory.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.white),
                                  color: WHITE),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: GREY.withOpacity(0.2),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 3, horizontal: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    shippingHistory[index]
                                                                ['status'] ==
                                                            'loading'
                                                        ? Icons
                                                            .watch_later_outlined
                                                        : shippingHistory[index]
                                                                    [
                                                                    'status'] ==
                                                                'pending'
                                                            ? Icons
                                                                .refresh_rounded
                                                            : shippingHistory[
                                                                            index]
                                                                        [
                                                                        'status'] ==
                                                                    'in-progress'
                                                                ? Icons
                                                                    .flip_camera_android_sharp
                                                                : Icons
                                                                    .download_done_rounded,
                                                    color: shippingHistory[
                                                                    index]
                                                                ['status'] ==
                                                            'loading'
                                                        ? Colors.blue
                                                            .withOpacity(0.8)
                                                        : shippingHistory[index]
                                                                    [
                                                                    'status'] ==
                                                                'pending'
                                                            ? Colors.orange
                                                            : shippingHistory[
                                                                            index]
                                                                        [
                                                                        'status'] ==
                                                                    'in-progress'
                                                                ? Colors.green
                                                                : SUCCESS,
                                                    size: 12,
                                                  ),
                                                  tiny5HorSpace(),
                                                  Text(
                                                    shippingHistory[index]
                                                        ['status'],
                                                    style:
                                                        textStore.Body13Regular(
                                                      color: shippingHistory[
                                                                      index]
                                                                  ['status'] ==
                                                              'loading'
                                                          ? Colors.blue
                                                              .withOpacity(0.8)
                                                          : shippingHistory[
                                                                          index]
                                                                      [
                                                                      'status'] ==
                                                                  'pending'
                                                              ? Colors.orange
                                                              : shippingHistory[
                                                                              index]
                                                                          [
                                                                          'status'] ==
                                                                      'in-progress'
                                                                  ? Colors.green
                                                                  : SUCCESS,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ListTile(
                                      title: Text(
                                        shippingHistory[index]['arrivaltime'],
                                        style: textStore.ArticleFontLarge(
                                                color: BLACK)
                                            .copyWith(
                                                fontWeight: FontWeight.w600),
                                      ),
                                      trailing: Image.asset(
                                          'assets/images/otherdice.png'),
                                      subtitle: Text(
                                        shippingHistory[index]['details'],
                                        style: textStore.Capture11Regular(
                                            color: GREY7),
                                      ),
                                      onTap: () {
                                        setState(() {});
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Row(
                                        children: [
                                          Text(
                                            shippingHistory[index]['amount'],
                                            style: textStore.Body13SemiBold(
                                                color: PRIMARY40),
                                          ),
                                          tinyHorSpace(),
                                          Icon(
                                            Icons.circle,
                                            size: 7,
                                            color: GREY6,
                                          ),
                                          tinyHorSpace(),
                                          Text(
                                            shippingHistory[index]['date'],
                                            style: textStore.Capture11Regular(
                                                color: GREY7),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ).animate().fade(duration: 500.ms).slide(begin: Offset(0, 1.5)),
            ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: BODY_PADDING, vertical: 20),
                      child: Row(
                        children: [
                          Text(
                            'Shipments',
                            style: textStore.Body16SemiBold(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: filteredValue.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.white),
                                  color: WHITE),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: GREY.withOpacity(0.2),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 3, horizontal: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    filteredValue[index]
                                                                ['status'] ==
                                                            'loading'
                                                        ? Icons
                                                            .watch_later_outlined
                                                        : filteredValue[index][
                                                                    'status'] ==
                                                                'pending'
                                                            ? Icons
                                                                .refresh_rounded
                                                            : filteredValue[index]
                                                                        [
                                                                        'status'] ==
                                                                    'in-progress'
                                                                ? Icons
                                                                    .flip_camera_android_sharp
                                                                : Icons
                                                                    .download_done_rounded,
                                                    color: filteredValue[index]
                                                                ['status'] ==
                                                            'loading'
                                                        ? Colors.blue
                                                            .withOpacity(0.8)
                                                        : filteredValue[index][
                                                                    'status'] ==
                                                                'pending'
                                                            ? Colors.orange
                                                            : filteredValue[index]
                                                                        [
                                                                        'status'] ==
                                                                    'in-progress'
                                                                ? Colors.green
                                                                : SUCCESS,
                                                    size: 12,
                                                  ),
                                                  tiny5HorSpace(),
                                                  Text(
                                                    filteredValue[index]
                                                        ['status'],
                                                    style:
                                                        textStore.Body13Regular(
                                                      color: filteredValue[
                                                                      index]
                                                                  ['status'] ==
                                                              'loading'
                                                          ? Colors.blue
                                                              .withOpacity(0.8)
                                                          : filteredValue[index]
                                                                      [
                                                                      'status'] ==
                                                                  'pending'
                                                              ? Colors.orange
                                                              : filteredValue[index]
                                                                          [
                                                                          'status'] ==
                                                                      'in-progress'
                                                                  ? Colors.green
                                                                  : SUCCESS,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ListTile(
                                      title: Text(
                                        filteredValue[index]['arrivaltime'],
                                        style: textStore.ArticleFontLarge(
                                                color: BLACK)
                                            .copyWith(
                                                fontWeight: FontWeight.w600),
                                      ),
                                      trailing: Image.asset(
                                          'assets/images/otherdice.png'),
                                      subtitle: Text(
                                        filteredValue[index]['details'],
                                        style: textStore.Capture11Regular(
                                            color: GREY7),
                                      ),
                                      onTap: () {
                                        setState(() {});
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Row(
                                        children: [
                                          Text(
                                            filteredValue[index]['amount'],
                                            style: textStore.Body13SemiBold(
                                                color: PRIMARY40),
                                          ),
                                          tinyHorSpace(),
                                          Icon(
                                            Icons.circle,
                                            size: 7,
                                            color: GREY6,
                                          ),
                                          tinyHorSpace(),
                                          Text(
                                            filteredValue[index]['date'],
                                            style: textStore.Capture11Regular(
                                                color: GREY7),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ).animate().fade(duration: 500.ms).slide(begin: Offset(0, 1.5)),
            ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: BODY_PADDING, vertical: 20),
                      child: Row(
                        children: [
                          Text(
                            'Shipments',
                            style: textStore.Body16SemiBold(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: inProgressValue.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.white),
                                  color: WHITE),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: GREY.withOpacity(0.2),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 3, horizontal: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    inProgressValue[index]
                                                                ['status'] ==
                                                            'loading'
                                                        ? Icons
                                                            .watch_later_outlined
                                                        : inProgressValue[index]
                                                                    [
                                                                    'status'] ==
                                                                'pending'
                                                            ? Icons
                                                                .refresh_rounded
                                                            : inProgressValue[
                                                                            index]
                                                                        [
                                                                        'status'] ==
                                                                    'in-progress'
                                                                ? Icons
                                                                    .flip_camera_android_sharp
                                                                : Icons
                                                                    .download_done_rounded,
                                                    color: inProgressValue[
                                                                    index]
                                                                ['status'] ==
                                                            'loading'
                                                        ? Colors.blue
                                                            .withOpacity(0.8)
                                                        : inProgressValue[index]
                                                                    [
                                                                    'status'] ==
                                                                'pending'
                                                            ? Colors.orange
                                                            : inProgressValue[
                                                                            index]
                                                                        [
                                                                        'status'] ==
                                                                    'in-progress'
                                                                ? Colors.green
                                                                : SUCCESS,
                                                    size: 12,
                                                  ),
                                                  tiny5HorSpace(),
                                                  Text(
                                                    inProgressValue[index]
                                                        ['status'],
                                                    style:
                                                        textStore.Body13Regular(
                                                      color: inProgressValue[
                                                                      index]
                                                                  ['status'] ==
                                                              'loading'
                                                          ? Colors.blue
                                                              .withOpacity(0.8)
                                                          : inProgressValue[
                                                                          index]
                                                                      [
                                                                      'status'] ==
                                                                  'pending'
                                                              ? Colors.orange
                                                              : inProgressValue[
                                                                              index]
                                                                          [
                                                                          'status'] ==
                                                                      'in-progress'
                                                                  ? Colors.green
                                                                  : SUCCESS,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ListTile(
                                      title: Text(
                                        inProgressValue[index]['arrivaltime'],
                                        style: textStore.ArticleFontLarge(
                                                color: BLACK)
                                            .copyWith(
                                                fontWeight: FontWeight.w600),
                                      ),
                                      trailing: Image.asset(
                                          'assets/images/otherdice.png'),
                                      subtitle: Text(
                                        inProgressValue[index]['details'],
                                        style: textStore.Capture11Regular(
                                            color: GREY7),
                                      ),
                                      onTap: () {
                                        setState(() {});
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Row(
                                        children: [
                                          Text(
                                            inProgressValue[index]['amount'],
                                            style: textStore.Body13SemiBold(
                                                color: PRIMARY40),
                                          ),
                                          tinyHorSpace(),
                                          Icon(
                                            Icons.circle,
                                            size: 7,
                                            color: GREY6,
                                          ),
                                          tinyHorSpace(),
                                          Text(
                                            inProgressValue[index]['date'],
                                            style: textStore.Capture11Regular(
                                                color: GREY7),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ).animate().fade(duration: 500.ms).slide(begin: Offset(0, 1.5)),
            ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: BODY_PADDING, vertical: 20),
                      child: Row(
                        children: [
                          Text(
                            'Shipments',
                            style: textStore.Body16SemiBold(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: pendingValue.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.white),
                                  color: WHITE),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: GREY.withOpacity(0.2),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 3, horizontal: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    pendingValue[index]
                                                                ['status'] ==
                                                            'loading'
                                                        ? Icons
                                                            .watch_later_outlined
                                                        : pendingValue[index][
                                                                    'status'] ==
                                                                'pending'
                                                            ? Icons
                                                                .refresh_rounded
                                                            : pendingValue[index]
                                                                        [
                                                                        'status'] ==
                                                                    'in-progress'
                                                                ? Icons
                                                                    .flip_camera_android_sharp
                                                                : Icons
                                                                    .download_done_rounded,
                                                    color: pendingValue[index]
                                                                ['status'] ==
                                                            'loading'
                                                        ? Colors.blue
                                                            .withOpacity(0.8)
                                                        : pendingValue[index][
                                                                    'status'] ==
                                                                'pending'
                                                            ? Colors.orange
                                                            : pendingValue[index]
                                                                        [
                                                                        'status'] ==
                                                                    'in-progress'
                                                                ? Colors.green
                                                                : SUCCESS,
                                                    size: 12,
                                                  ),
                                                  tiny5HorSpace(),
                                                  Text(
                                                    pendingValue[index]
                                                        ['status'],
                                                    style:
                                                        textStore.Body13Regular(
                                                      color: pendingValue[index]
                                                                  ['status'] ==
                                                              'loading'
                                                          ? Colors.blue
                                                              .withOpacity(0.8)
                                                          : pendingValue[index][
                                                                      'status'] ==
                                                                  'pending'
                                                              ? Colors.orange
                                                              : pendingValue[index]
                                                                          [
                                                                          'status'] ==
                                                                      'in-progress'
                                                                  ? Colors.green
                                                                  : SUCCESS,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ListTile(
                                      title: Text(
                                        pendingValue[index]['arrivaltime'],
                                        style: textStore.ArticleFontLarge(
                                                color: BLACK)
                                            .copyWith(
                                                fontWeight: FontWeight.w600),
                                      ),
                                      trailing: Image.asset(
                                          'assets/images/otherdice.png'),
                                      subtitle: Text(
                                        pendingValue[index]['details'],
                                        style: textStore.Capture11Regular(
                                            color: GREY7),
                                      ),
                                      onTap: () {
                                        setState(() {});
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Row(
                                        children: [
                                          Text(
                                            pendingValue[index]['amount'],
                                            style: textStore.Body13SemiBold(
                                                color: PRIMARY40),
                                          ),
                                          tinyHorSpace(),
                                          Icon(
                                            Icons.circle,
                                            size: 7,
                                            color: GREY6,
                                          ),
                                          tinyHorSpace(),
                                          Text(
                                            pendingValue[index]['date'],
                                            style: textStore.Capture11Regular(
                                                color: GREY7),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ).animate().fade(duration: 500.ms).slide(begin: Offset(0, 1.5)),
            ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: BODY_PADDING, vertical: 20),
                      child: Row(
                        children: [
                          Text(
                            'Shipments',
                            style: textStore.Body16SemiBold(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                      child: cancelValue.isEmpty
                          ? Center(
                              child: Text('No cancled shipment'),
                            )
                          : ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: cancelValue.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: Colors.white),
                                        color: WHITE),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color:
                                                        GREY.withOpacity(0.2),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 3,
                                                            horizontal: 10),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          cancelValue[index][
                                                                      'status'] ==
                                                                  'loading'
                                                              ? Icons
                                                                  .watch_later_outlined
                                                              : cancelValue[index]
                                                                          [
                                                                          'status'] ==
                                                                      'pending'
                                                                  ? Icons
                                                                      .refresh_rounded
                                                                  : cancelValue[index]
                                                                              [
                                                                              'status'] ==
                                                                          'in-progress'
                                                                      ? Icons
                                                                          .flip_camera_android_sharp
                                                                      : Icons
                                                                          .download_done_rounded,
                                                          color: cancelValue[
                                                                          index]
                                                                      [
                                                                      'status'] ==
                                                                  'loading'
                                                              ? Colors.blue
                                                                  .withOpacity(
                                                                      0.8)
                                                              : cancelValue[index]
                                                                          [
                                                                          'status'] ==
                                                                      'pending'
                                                                  ? Colors
                                                                      .orange
                                                                  : cancelValue[index]
                                                                              [
                                                                              'status'] ==
                                                                          'in-progress'
                                                                      ? Colors
                                                                          .green
                                                                      : SUCCESS,
                                                          size: 12,
                                                        ),
                                                        tiny5HorSpace(),
                                                        Text(
                                                          cancelValue[index]
                                                              ['status'],
                                                          style: textStore
                                                              .Body13Regular(
                                                            color: cancelValue[
                                                                            index]
                                                                        [
                                                                        'status'] ==
                                                                    'loading'
                                                                ? Colors.blue
                                                                    .withOpacity(
                                                                        0.8)
                                                                : cancelValue[index]
                                                                            [
                                                                            'status'] ==
                                                                        'pending'
                                                                    ? Colors
                                                                        .orange
                                                                    : cancelValue[index]['status'] ==
                                                                            'in-progress'
                                                                        ? Colors
                                                                            .green
                                                                        : SUCCESS,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          ListTile(
                                            title: Text(
                                              cancelValue[index]['arrivaltime'],
                                              style: textStore.ArticleFontLarge(
                                                      color: BLACK)
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                            trailing: Image.asset(
                                                'assets/images/otherdice.png'),
                                            subtitle: Text(
                                              cancelValue[index]['details'],
                                              style: textStore.Capture11Regular(
                                                  color: GREY7),
                                            ),
                                            onTap: () {
                                              setState(() {});
                                            },
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Row(
                                              children: [
                                                Text(
                                                  cancelValue[index]['amount'],
                                                  style:
                                                      textStore.Body13SemiBold(
                                                          color: PRIMARY40),
                                                ),
                                                tinyHorSpace(),
                                                Icon(
                                                  Icons.circle,
                                                  size: 7,
                                                  color: GREY6,
                                                ),
                                                tinyHorSpace(),
                                                Text(
                                                  cancelValue[index]['date'],
                                                  style: textStore
                                                      .Capture11Regular(
                                                          color: GREY7),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ],
            ).animate().fade(duration: 500.ms).slide(begin: Offset(0, 1.5)),
          ],
        ).animate().fade(duration: 500.ms).slide(begin: Offset(0, 1.5)),
      ),
    );
  }
}
