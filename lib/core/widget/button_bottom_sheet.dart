import 'package:flutter/material.dart';
import 'package:my_asks/core/utilts/fonts.dart';
import 'package:my_asks/core/utilts/my_cache.dart';
import 'package:my_asks/core/utilts/my_cache_keys.dart';

class ButtonBottomSheet extends StatelessWidget {
  final String label;
  final Function() onTAP;
  final Color color;
  final bool isClose;

  const ButtonBottomSheet(
      {super.key,
      required this.label,
      required this.onTAP,
      required this.color,
      this.isClose = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTAP,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color: isClose == true
                  ? MyCache.getBool(key: MyCacheKeys.isDark) == true
                      ? Colors.grey[600]!
                      : Colors.grey[300]!
                  : color),
          borderRadius: BorderRadius.circular(20),
          color: isClose == true ? Colors.transparent : color,
        ),
        child: Center(
            child: Text(
          label,
          style: isClose == true
              ? MyFonts.titleStyle
              : MyFonts.titleStyle.copyWith(color: Colors.white),
        )),
      ),
    );
  }
}
