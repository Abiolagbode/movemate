import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:movemate/constants.dart';
import 'package:movemate/views/calculate/amountcalculator.dart';

import '../../colors.dart';
import '../../components/Button/index.dart';
import '../../components/TextInput.dart';
import '../../utils/typography.dart';
import '../home/index.dart';

class Calculate extends StatefulWidget {
  bool? isback;
  Calculate({this.isback});
  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  int? typeIndex;
  String specialRequest = "";

  @override
  Widget build(BuildContext context) {
    TextStore textStore = new TextStore(context);

    return Scaffold(
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
            "Calculate",
            style: textStore.Body16SemiBold(color: WHITE),
          ),
          backgroundColor: PRIMARY40,
          surfaceTintColor: WHITE,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: BODY_PADDING, vertical: 20),
          child: ListView(
            children: [
              Text(
                'Destination',
                style: textStore.Body16SemiBold(),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: WHITE,
                ),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        newTextWidget('Send location', Icons.file_upload),
                        newTextWidget('Receiver location', Icons.download),
                        newTextWidget('Approx wight', Icons.sync),
                      ],
                    )),
              ),
              smallSpace(),
              Text(
                'Packaging',
                style: textStore.Body16SemiBold(),
              ),
              Text(
                'What are you sending?',
                style: textStore.ArticleFontMedium(color: GREY7),
              ),
              smallSpace(),
              newTextWidgetDropdown(context),
              smallSpace(),
              Text(
                'Categories',
                style: textStore.Body16SemiBold(),
              ),
              Text(
                'What are you sending?',
                style: textStore.ArticleFontMedium(color: GREY7),
              ),
              smallSpace(),
              _buildBody(textStore),
              mediumSpace(),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: DefaultButton(
                    color: Color(0xffF48527),
                    title: 'Calculate',
                    onPress: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AmountCalculate();
                      }));
                    }
                    // }
                    ).animate().shake(),
              ),
            ],
          ),
        ).animate().fade(duration: 500.ms).slide(begin: Offset(0, 1.5)));
  }

  Widget _buildBody(TextStore textStore) {
    return Wrap(
      direction: Axis.horizontal,
      children: categoryList.map((item) {
        return InkWell(
          onTap: () {
            setState(() {
              print('what it is:: ${item['type']}');
              specialRequest = item['type'];
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 10, bottom: 12, top: 2),
                  child: Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 0.3,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: BLACK),
                            color:
                                specialRequest == item['type'] ? BLACK : WHITE),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 12, bottom: 12, right: 15, left: 10),
                          child: Row(
                            children: [
                              if (specialRequest == item['type'])
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Icon(
                                    Icons.done,
                                    color: WHITE,
                                  ),
                                ),
                              Text(
                                item['type'],
                                style: textStore.Body16Regular(
                                  color: specialRequest == item['type']
                                      ? WHITE
                                      : BLACK,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )))
            ],
          ),
        );
      }).toList(),
    );
  }
}
