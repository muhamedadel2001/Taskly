import 'package:flutter/material.dart';
import 'package:my_asks/core/utilts/fonts.dart';
import 'package:my_asks/core/utilts/my_cache.dart';
import 'package:my_asks/core/utilts/my_cache_keys.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final bool readOnly;
  final Widget? widget;

  const InputField(
      {super.key,
      required this.title,
      required this.hintText,
      this.controller,
      this.readOnly = false,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: MyFonts.titleStyle,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.only(left: 14),
            height: 52,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  readOnly: readOnly,
                  autofocus: false,
                  cursorColor: MyCache.getBool(key: MyCacheKeys.isDark)!
                      ? Colors.grey[100]
                      : Colors.grey[700],
                  controller: controller,
                  style: MyFonts.subTitleStyle,
                  decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: MyFonts.subTitleStyle,
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                      border: const UnderlineInputBorder(
                          borderSide: BorderSide.none)),
                )),
                widget == null
                    ? Container()
                    : Container(
                        child: widget,
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
