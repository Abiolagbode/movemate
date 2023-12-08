import 'package:flutter/material.dart';
import 'package:movemate/utils/typography.dart';

import '../colors.dart';
import '../constants.dart';
import 'GradientContainer.dart';
import 'custom_container.dart';

class TextInputForm extends StatelessWidget {
  const TextInputForm({
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.obscure = false,
    this.onChanged,
    this.onSubmit,
    this.enabled = true,
    this.editable = true,
    this.controller,
    this.label,
    this.hint,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.keyboardType,
    this.maxLength,
    this.inputFormatters,
    this.autofocus = false,
    this.prefixText,
  });

  final suffixIcon;
  final editable;
  final prefixIcon;
  final onChanged;
  final autofocus;
  final onSubmit;
  final validator;
  final enabled;
  final controller;
  final obscure;
  final label;
  final prefixText;
  final hint;
  final textCapitalization;
  final keyboardType;
  final inputFormatters;
  final maxLines;
  final maxLength;

  @override
  Widget build(BuildContext context) {
    TextStore textStore = new TextStore(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(55),
          border: Border.all(color: WHITE)),
      child: GradientContainer(
        gradients: [
          [WHITE, WHITE],
          [WHITE, WHITE],
          [WHITE, WHITE]
        ],
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(55)),
        child: Container(
          padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
          decoration: depressNeumorph()
              .copyWith(color: editable == true ? null : Color(0xFFE5E8E7)),
          child: TextFormField(
            buildCounter: (context,
                    {required currentLength, required isFocused, maxLength}) =>
                null,
            inputFormatters: inputFormatters,
            enabled: enabled,
            controller: controller,
            keyboardType: keyboardType,
            style: textStore.Body16Regular(color: GREY7),
            textCapitalization: textCapitalization,
            validator: validator,
            onChanged: onChanged,
            onFieldSubmitted: onSubmit,
            obscureText: obscure,
            obscuringCharacter: '*',
            maxLines: maxLines,
            maxLength: maxLength,
            autofocus: autofocus,
            decoration: InputDecoration(
              filled: false,
              border: InputBorder.none,
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: WHITE, width: 0.1),
                  borderRadius: BorderRadius.all(Radius.circular(58))),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: WHITE, width: 0.1),
                  borderRadius: BorderRadius.all(Radius.circular(58))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: WHITE, width: 0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(58))),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(58.0),
                  borderSide:
                      const BorderSide(color: Colors.redAccent, width: 0.1)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(58.0),
                  borderSide: const BorderSide(color: WHITE, width: 0.1)),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              labelText: label,
              hintText: hint,
              prefixText: prefixText,
              labelStyle: textStore.Body13Regular(color: GREY5),
              hintStyle: const TextStyle(fontSize: 16, color: GREY),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
            ),
          ),
        ),
      ),
    );
  }
}

Widget newTextWidget(hint, IconData icon) {
  var iconPrefix = Container(
      decoration: new BoxDecoration(
        color: Colors.transparent,
        border: Border(
          right: BorderSide(width: 0.5, color: Colors.grey),
        ),
      ),
      height: 45.0,
      margin: const EdgeInsets.symmetric(horizontal: 5),
//width: 300.0,
      child: Icon(
        icon,
        color: GREY,
      ));
  return Container(
    width: double.infinity,
    margin: new EdgeInsets.only(top: 15.0, bottom: 10.0, right: 5.0, left: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), color: GREY.withOpacity(0.1)),
    child: new TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return hint;
        }
      },
      keyboardType: TextInputType.text,
      decoration: new InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: GREY, width: 0.1),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: GREY, width: 0.1),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: GREY, width: 0.1),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: Colors.redAccent, width: 0.1)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: GREY, width: 0.1)),

        contentPadding: const EdgeInsets.all(15.0),
        border: new OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: new BorderSide(color: Colors.grey, width: 0.1)),
        fillColor: Colors.grey,
        prefixIcon: iconPrefix,
        hintText: hint,

        // labelText: 'Send location'
      ),
    ),
  );
}

Widget newTextWidgetDropdown(context) {
  final item = TextEditingController();

  var iconPrefix = Container(
      decoration: new BoxDecoration(
        color: Colors.transparent,
        border: Border(
          right: BorderSide(width: 0.5, color: Colors.grey),
        ),
      ),
      height: 45.0,
      margin: const EdgeInsets.symmetric(horizontal: 5),
//width: 300.0,
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Container(
            height: 44,
            width: 44,
            child: Image.asset('assets/images/otherdice.png')),
      ));
  return InkWell(
    onTap: () {
      pickItem(context, itemSendingList, 'Select Package', onSelect: (value) {
        Navigator.pop(context);
        item.text = value['Name'];
      });
    },
    child: Container(
      width: double.infinity,
      margin: new EdgeInsets.only(top: 15.0, bottom: 10.0, right: 5.0, left: 5),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(12), color: WHITE),
      child: new TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Select Item';
          }
        },
        keyboardType: TextInputType.number,
        controller: item,
        decoration: new InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: WHITE, width: 0.1),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: WHITE, width: 0.1),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: WHITE, width: 0.1),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide:
                  const BorderSide(color: Colors.redAccent, width: 0.1)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: WHITE, width: 0.1)),

          contentPadding: const EdgeInsets.all(15.0),
          border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: new BorderSide(color: Colors.grey, width: 0.1)),
          fillColor: Colors.black,
          prefixIcon: iconPrefix,
          suffixIcon: Icon(Icons.keyboard_arrow_down),
          hintText: 'Box',
          hintStyle:
              TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          labelStyle:
              TextStyle(fontWeight: FontWeight.w600, color: Colors.black),

          enabled: false,

          // labelText: 'Send location'
        ),
      ),
    ),
  );
}

void pickItem(context, list, title, {onSelect}) {
  ;
  print(list);
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
          ),
          height: MediaQuery.of(context).size.height * 0.65,
          padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Container(
                    height: 3,
                    decoration: BoxDecoration(
                        color: GREY, borderRadius: BorderRadius.circular(10)),
                    width: 90,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text('$title',
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16))),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      children: List.generate(
                          list.length,
                          (i) => ListTile(
                                title: Text('${list[i]['Name']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16)),
                                onTap: () => onSelect(list[i]),
                              ))),
                ),
              ),
            ],
          )));
}
