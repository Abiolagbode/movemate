import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../colors.dart';
import '../../../components/GradientContainer.dart';
import '../../../components/TextInput.dart';
import '../../../constants.dart';
import '../../../controller/global_controller.dart';
import '../../../utils/typography.dart';

class SearchFilter extends StatefulWidget {
  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  int? currentIndex;
  ValueNotifier<List<Map>> filtered = ValueNotifier<List<Map>>([]);
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocus = FocusNode();
  bool searching = false;
  bool _visible = true;
  final GlobalController globalController = Get.find<GlobalController>();

  final Duration duration = const Duration(milliseconds: 0);

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
            children: [searches(context, textStore)],
          )),
        ),
      );
    });
  }

  Widget searches(context, TextStore textStore) {
    Size size = MediaQuery.of(context).size;

    return Material(
      animationDuration: duration,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      elevation: 0,
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: ValueListenableBuilder<List>(
            valueListenable: filtered,
            builder: (context, value, _) {
              return Column(children: [
                Stack(
                  children: [
                    Positioned(
                        bottom: 0.h, child: GradientSecondContainer(size)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 6.h),
                              child: FittedBox(
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.arrow_back_ios,
                                          size: 35,
                                          color: WHITE,
                                        ),
                                        onPressed: () {
                                          globalController.isCollapse.value =
                                              !globalController
                                                  .isCollapse.value;
                                          Navigator.pop(context);
                                        },
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            child: TextInputForm(
                                              controller: searchController,
                                              // enabled: false,
                                              autofocus: true,
                                              suffixIcon: Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      color: Colors.orange),
                                                  child: Icon(
                                                    Icons
                                                        .format_indent_increase_outlined,
                                                    color: WHITE,
                                                  )),
                                              prefixIcon:
                                                  new Icon(Icons.search),

                                              keyboardType: TextInputType.text,
                                              validator: (value) {},
                                              onChanged: (text) {
                                                if (text.length > 0) {
                                                  searching = true;
                                                  filtered.value = [];
                                                  searchList
                                                      .forEach((searchList) {
                                                    if (searchList['subtitle']
                                                        .toString()
                                                        .toLowerCase()
                                                        .contains(text
                                                            .toLowerCase())) {
                                                      filtered.value
                                                          .add(searchList);
                                                    }
                                                  });
                                                } else {
                                                  searching = false;
                                                  filtered.value = [];
                                                }
                                              },
                                              hint:
                                                  'Enter the receipt number ...',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            smallSpace(),
                          ]),
                    ),
                  ],
                ).animate().fade(duration: 0.ms).slide(begin: Offset(1.5, 1.5)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Card(
                        elevation: 0.3,
                        surfaceTintColor: WHITE,
                        child: ListView.separated(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            separatorBuilder: (c, i) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Container(
                                    height: 1,
                                    color: GREY4,
                                  ),
                                ),
                            itemCount: searching
                                ? filtered.value.length
                                : searchList.length,
                            itemBuilder: (context, index) {
                              final item = searching
                                  ? filtered.value[index]
                                  : searchList[index];
                              return ListTile(
                                leading: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: PRIMARY40),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                          height: 30,
                                          width: 30,
                                          child: Image.asset(
                                              'assets/images/dice.png')),
                                    )),
                                title: Text(
                                  item['title'],
                                  style: textStore.Body13Regular(color: BLACK)
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                ),
                                subtitle: FittedBox(
                                  child: Row(
                                    children: [
                                      Text(
                                        item['subtitle'],
                                        style: textStore.Body13Regular(
                                            color: LIGHTGREYCOLOR),
                                      ),
                                      tiny5HorSpace(),
                                      Container(
                                        height: 5,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: LIGHTGREYCOLOR),
                                      ),
                                      tiny5HorSpace(),
                                      Text(
                                        item['country'],
                                        style: textStore.Body13Regular(
                                            color: LIGHTGREYCOLOR),
                                      ),
                                      tiny5HorSpace(),
                                      Icon(
                                        Icons.arrow_forward_sharp,
                                        color: LIGHTGREYCOLOR,
                                        size: 12,
                                      ),
                                      tiny5HorSpace(),
                                      Text(
                                        item['state'],
                                        style: textStore.Body13Regular(
                                            color: LIGHTGREYCOLOR),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  )
                      .animate()
                      .fade(duration: 500.ms)
                      .slide(begin: Offset(0, 0.7)),
                ),
              ]);
            }),
      ),
    );
  }
}
