import "package:flutter/material.dart";

import "../colors.dart";

class GradientContainer extends StatefulWidget {
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BoxDecoration? decoration;
  final Widget child;
  final List gradients;
  final Matrix4? transform;

  GradientContainer(
      {Key? key,
      this.width,
      this.height,
      this.margin,
      this.padding,
      this.decoration,
      required this.child,
      required this.gradients,
      this.transform})
      : super(key: key);

  @override
  _GradientContainerState createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer> {
  Widget _renderGradientContainer(int index) {
    if (index < widget.gradients.length) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: widget.decoration!.borderRadius,
            shape: widget.decoration!.shape,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: (widget.gradients[index] is List)
                  ? widget.gradients[index]
                  : [widget.gradients[index]],
            ),
            image: widget.decoration!.image),
        child: _renderGradientContainer(index + 1),
      );
    } else {
      return Container(
        padding: widget.padding ?? EdgeInsets.zero,
        child: widget.child,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? null,
      height: widget.height ?? null,
      margin: widget.margin ?? EdgeInsets.zero,
      transform: widget.transform ?? null,
      decoration: BoxDecoration(
          color: widget.decoration!.color,
          image: widget.decoration!.image,
          borderRadius: widget.decoration!.borderRadius,
          boxShadow: widget.decoration!.boxShadow),
      child: _renderGradientContainer(0),
    );
  }
}

Container GradientSecondContainer(Size size) {
  return Container(
    width: size.width,
    height: size.width,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0)),
        gradient: SweepGradient(
          colors: [
            PRIMARY40,
            PRIMARY40,
            PRIMARY40,
            PRIMARY40,
            PRIMARY40,
          ],
          stops: <double>[0.2, 0.0, 0.2, 0.0, 3.0],
          tileMode: TileMode.decal,
        )),
  );
}
