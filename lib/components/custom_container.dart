import 'package:flutter/material.dart';

import '../colors.dart';
import 'ConcaveDecoration.dart';
import 'GradientContainer.dart';

enum ContainerType { primary, secondary }

BoxDecoration depressNeumorph() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(58),
    color: WHITE,
    border: Border.all(width: 2, color: GREY4),
  );
}

BoxDecoration depressNeumorph2() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: SHADECOLOR,
    border: Border.all(width: 2, color: SHADECOLOR),
  );
}

class CircularContainer extends StatelessWidget {
  final double margin;
  final double padding;
  final Widget child;
  final ContainerType type;
  final bool isSelected;

  const CircularContainer(
      {Key? key,
      this.margin = 0.0,
      this.padding = 7.0,
      this.isSelected = false,
      required this.type,
      required this.child})
      : super(key: key);

  Color baseRGBO(double opacity) {
    return PRIMARY40.withOpacity(opacity);
  }

  List _selectGradient() {
    if (type == ContainerType.primary) {
      return [
        [baseRGBO(1), baseRGBO(1)],
        [const Color.fromRGBO(240, 240, 240, 0.2), baseRGBO(0.1)]
      ];
    } else if (type == ContainerType.secondary) {
      return [
        [Colors.white, Colors.white],
        [
          const Color.fromRGBO(0, 0, 0, 0.04),
          const Color.fromRGBO(0, 0, 0, 0.020)
        ]
      ];
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
        margin: EdgeInsets.all(margin),
        gradients: _selectGradient(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          boxShadow: [
            BoxShadow(
              spreadRadius: 0.5,
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(4, 4),
              blurRadius: 6,
            ),
            const BoxShadow(
              spreadRadius: 0.5,
              color: Color.fromRGBO(255, 255, 255, 1),
              offset: Offset(-4, -4),
              blurRadius: 6,
            )
          ],
        ),
        child: isSelected
            ? Container(
                padding: const EdgeInsets.all(10),
                decoration: ConcaveDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    colors: const [Colors.white, Color.fromRGBO(0, 0, 0, 0.16)],
                    depth: 5,
                    opacity: 0.3),
                child: child,
              )
            : Padding(
                padding: EdgeInsets.all(padding),
                child: child,
              ));
  }
}

class RoundedContainer extends StatelessWidget {
  final double margin;
  final double padding;
  final Widget child;
  final bool isSelected;
  final ContainerType type;

  const RoundedContainer(
      {Key? key,
      this.margin = 0.0,
      this.padding = 10.0,
      this.isSelected = false,
      required this.type,
      required this.child})
      : super(key: key);

  Color baseRGBO(double opacity) {
    return PRIMARY40.withOpacity(opacity);
  }

  List _selectGradient() {
    if (type == ContainerType.primary) {
      return [
        [PRIMARY40, PRIMARY40],
        [PRIMARY40, PRIMARY40]
      ];
    } else if (type == ContainerType.secondary) {
      return [
        [Colors.white, Colors.white],
        [Colors.white, Colors.white]
      ];
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
        padding: EdgeInsets.all(isSelected ? 3 : padding),
        margin: EdgeInsets.all(isSelected ? 3 : margin),
        gradients: _selectGradient(),
        decoration: isSelected
            ? depressNeumorph2()
            : BoxDecoration(
                border: Border.all(width: 5, color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    color: SHADECOLOR,
                    blurRadius: 3,
                  ),
                  BoxShadow(
                    color: SHADECOLOR,
                  ),
                  BoxShadow(
                    color: SHADECOLOR,
                  ),
                  const BoxShadow(
                    color: SHADECOLOR,
                  )
                ],
              ),
        child: isSelected
            ? Container(
                padding: const EdgeInsets.all(12),
                decoration: depressNeumorph(),
                child: child,
              )
            : child);
  }
}
