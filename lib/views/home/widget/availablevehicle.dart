import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../colors.dart';
import '../../../constants.dart';
import '../../../utils/typography.dart';

class AvailableVehicle extends StatefulWidget {
  const AvailableVehicle({Key? key}) : super(key: key);

  @override
  State<AvailableVehicle> createState() => _AvailableVehicleState();
}

class _AvailableVehicleState extends State<AvailableVehicle> {
  bool close = false;
  @override
  Widget build(BuildContext context) {
    TextStore textStore = new TextStore(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Available vehicles',
          style: textStore.Subitle19SemiBold(color: DEEPBLACKCOLOR),
        ),
        tiny5Space(),
        SizedBox(
          width: double.infinity,
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              availableVehicles(
                'Ocean freight',
                'International',
                'assets/images/oceanfreight.png',
              ),
              tiny5HorSpace(),
              availableVehicles(
                'Cargo freight',
                'Reliable',
                'assets/images/reliabletruck.png',
              ),
              tiny5HorSpace(),
              availableVehicles(
                'Air freight',
                'International',
                'assets/images/airplane-delivery.jpeg',
              ),
              tiny5HorSpace(),
            ],
          ),
        )
      ],
    );
  }

  availableVehicles(title, subtitle, image) {
    TextStore textStore = new TextStore(context);
    return Card(
      elevation: 0.3,
      surfaceTintColor: WHITE,
      borderOnForeground: false,
      child: Container(
        margin: const EdgeInsets.only(left: 15, top: 15),
        width: 200,
        height: 250,
        color: Colors.white,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: textStore.Body16Regular(
                        color: GREY8,
                      ).copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      subtitle,
                      style: textStore.Body13Regular(color: GREY6),
                    ),
                  ],
                ),
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ).animate().fade(duration: 2000.ms).slide(begin: Offset(0.2, 0))
              ]),
        ).animate().fade(duration: 1500.ms).slide(begin: Offset(0.2, 0)),
      ),
    );
  }
}
