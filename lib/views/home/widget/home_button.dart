import 'package:movemate/colors.dart';
import 'package:movemate/components/custom_container.dart';
import 'package:movemate/constants.dart';
import 'package:movemate/utils/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget bottomNavIcon(image, {color, onTap}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(20),
    child: CircularContainer(
        margin: 0,
        padding: 10,
        type: ContainerType.secondary,
        child: SvgPicture.asset(
          image,
          height: 23,
          width: 23,
          color: color,
        )),
  );
}

Widget quickActionButton(TextStore textStore,
    {required String icon,
    required String title,
    required void Function() onTap}) {
  return Column(
    children: [
      bottomNavIcon(icon, color: PRIMARY40, onTap: onTap),
      tinySpace(),
      Text(title,
          style: textStore.ArticleFontExtraSmall(color: GREY)
              .copyWith(fontWeight: FontWeight.w300)),
    ],
  );
}

Expanded topButton(TextStore textStore, title, image,
    {onTap, bool isColor = true}) {
  return Expanded(
      child: InkWell(
    onTap: onTap,
    child: RoundedContainer(
        type: ContainerType.secondary,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(title,
                    style: textStore.ArticleFontExtraSmall(color: PRIMARY40)
                        .copyWith(fontWeight: FontWeight.w300)),
              ),
              tiny5HorSpace(),
              Image.asset(
                image,
                height: 15,
                color: isColor ? PRIMARY40 : null,
              ),
            ],
          ),
        ))),
  ));
}
