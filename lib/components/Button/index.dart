import "package:flutter/material.dart";

import '../../colors.dart';
import '../../utils/typography.dart';

class DefaultButton extends StatelessWidget {
  final String? title;
  final onPress;
  final color;
  bool? loading;
  final isDialog;

  DefaultButton({
    Key? key,
    this.title,
    this.onPress,
    this.color,
    this.loading,
    this.isDialog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStore textStore = new TextStore(context);

    return InkWell(
      onTap: onPress,
      child: Container(
        child: Padding(
            padding: EdgeInsets.all(isDialog == true ? 10 : 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title.toString(),
                    textAlign: TextAlign.center,
                    style: textStore.Body16SemiBold(color: WHITE).copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: isDialog == true ? 12 : 18)),
                SizedBox(
                  width: 5,
                ),
                loading == true
                    ? Image.asset(
                        'assets/gif/spinner.gif',
                        height: 20,
                      )
                    : SizedBox.shrink()
              ],
            )),
        decoration: BoxDecoration(
            color: color ?? PRIMARY40, borderRadius: BorderRadius.circular(28)),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    this.onTap,
    this.title = '',
    this.actionWidget,
    this.allowBack = true,
  }) : super(key: key);
  final bool allowBack;
  final String title;
  final actionWidget;
  final onTap;

  @override
  Widget build(BuildContext context) {
    TextStore textStore = new TextStore(context);

    return Padding(
      padding: EdgeInsets.fromLTRB(
          18,
          allowBack || actionWidget != null ? 0 : 10,
          18,
          actionWidget != null ? 0 : 10),
      child: Row(
        children: [
          allowBack
              ? CustomBackButton(
                  onTap: onTap ?? () => Navigator.pop(context),
                )
              : const SizedBox(width: 50),
          Expanded(
              child: Text(
            title ?? '',
            textAlign: TextAlign.center,
            style: textStore.Body16SemiBold(color: PRIMARY40),
          )),
          actionWidget ?? const SizedBox(width: 60),
        ],
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key, this.onTap}) : super(key: key);
  final onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => Navigator.pop(context),
      child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              color: WHITE,
              border: Border.all(color: GREY3)),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 0, bottom: 0, left: 7, right: 7),
            child: Image.asset('assets/images/arrow_left.png', width: 25),
          )),
    );
  }
}
