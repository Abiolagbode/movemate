import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mccounting_text/mccounting_text.dart';
import 'package:movemate/constants.dart';

import '../../colors.dart';
import '../../components/Button/index.dart';
import '../../utils/typography.dart';
import '../home/index.dart';

class AmountCalculate extends StatefulWidget {
  bool? isback;
  AmountCalculate({this.isback});
  @override
  State<AmountCalculate> createState() => _AmountCalculateState();
}

class _AmountCalculateState extends State<AmountCalculate>
    with TickerProviderStateMixin {
  int? typeIndex;
  double _price = 1460;

  @override
  Widget build(BuildContext context) {
    TextStore textStore = new TextStore(context);

    return Scaffold(
        backgroundColor: WHITE,
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: BODY_PADDING, vertical: 20),
          child: ListView(
            children: [
              verticalSpace(context, 0.1),
              Container(
                  height: 50,
                  width: 50,
                  child: Image.asset('assets/images/movematelogo.png')),
              verticalSpace(context, 0.1),
              Container(
                      height: 180,
                      width: 180,
                      child: Image.asset('assets/images/otherdice2.png'))
                  .animate()
                  .fade(duration: 1000.ms)
                  .slide(curve: Curves.ease),
              verticalSpace(context, 0.05),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total Estimated Amount',
                    style: textStore.HeadingFontLarge(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '\$',
                        style: textStore.BigHeading1(color: SUCCESS),
                      ),
                      McCountingText(
                        begin: 1123,
                        end: _price.toDouble(),
                        duration: Duration(seconds: 3),
                        style: textStore.BigHeading1(color: SUCCESS),
                        curve: Curves.decelerate,
                      ),
                      // ),
                      Text(
                        ' USD',
                        style: textStore.BigHeading1(color: SUCCESS),
                      ),
                    ],
                  ),
                  Text(
                    'This amount is estimated this will vary\nif you change your location or weight',
                    style: textStore.ArticleFontMedium(color: GREY7),
                  ),
                  mediumSpace(),
                ],
              ).animate().fade(duration: 1000.ms).slide(begin: Offset(0, 1.5)),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: DefaultButton(
                    color: Color(0xffF48527),
                    title: 'Back to home',
                    onPress: () {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                        return DashboardEntry();
                      }), (Route<dynamic> route) => false);
                    }
                    // }
                    ),
              ).animate().fade(duration: 1000.ms).slide(begin: Offset(0, 1.5)),
            ],
          ),
        ));
  }
}
