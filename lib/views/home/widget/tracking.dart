import 'package:flutter/material.dart';

import '../../../colors.dart';
import '../../../constants.dart';
import '../../../utils/typography.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  bool close = false;
  @override
  Widget build(BuildContext context) {
    TextStore textStore = new TextStore(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Tracking',
          style: textStore.Subitle19SemiBold(color: DEEPBLACKCOLOR),
        ),
        tinySpace(),
        Card(
          elevation: 0.8,
          surfaceTintColor: WHITE,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shipment Number',
                            style: textStore.Body13Regular(color: GREY),
                          ),
                          Text(
                            'NEJ20089934122231',
                            style: textStore.Body13SemiBold().copyWith(
                                fontWeight: FontWeight.w800, fontSize: 16),
                          ),
                        ],
                      ),
                      Container(
                          height: 80,
                          width: 80,
                          child: Image.asset('assets/images/heavyduties.png'))
                    ],
                  ),
                  tiny5Space(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: GREY4,
                    height: 1,
                  ),
                  tinySpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      listStyleBox('Sender', 'Atlanta, 5243',
                          'assets/images/shipping.png'),
                      listStyleBox('Time', '2 day -3 days', null),
                    ],
                  ),
                  tinySpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      listStyleBox('Reciever', 'Chicago, 6342',
                          'assets/images/shippingoff.jpeg'),
                      listStyleBox('Status', 'Waiting to collect', null),
                    ],
                  ),
                  tiny5Space(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: GREY4,
                    height: 1,
                  ),
                  tinySpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.orange,
                      ),
                      Text(
                        'Add Stop',
                        style: textStore.Subitle19SemiBold(
                          color: Colors.orange,
                        ).copyWith(fontSize: 17),
                      ),
                    ],
                  ),
                  tinySpace(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  listStyleBox(
    String title,
    String subtitle,
    String? image,
  ) {
    TextStore textStore = new TextStore(context);
    return Expanded(
      child: ListTile(
        title: Text(
          title,
          style: textStore.Capture11Regular(color: GREY7),
        ),
        subtitle: subtitle.contains('day')
            ? FittedBox(
                child: Row(
                  children: [
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: GREEN),
                    ),
                    tiny5HorSpace(),
                    Text(
                      subtitle,
                      style: textStore.Body13Regular(color: BLACK),
                    ),
                  ],
                ),
              )
            : FittedBox(
                child: Text(
                subtitle,
                style: textStore.Body13Regular(color: BLACK),
              )),
        leading: image != null
            ? Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: title.contains('Reciever')
                        ? Colors.green
                        : Color(0xffFDE6D6)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(image!),
                ))
            : SizedBox.shrink(),
      ),
    );
  }
}
