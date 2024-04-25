import 'package:flutter/material.dart';

import '../../../../../core/utilts/colors.dart';
import '../../../../../core/utilts/fonts.dart';
import '../../../manager/add_task_cubit.dart';

class ColorPallete extends StatefulWidget {
  const ColorPallete({super.key});

  @override
  State<ColorPallete> createState() => _ColorPalleteState();
}

class _ColorPalleteState extends State<ColorPallete> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: MyFonts.titleStyle,
        ),
        const SizedBox(
          height: 8,
        ),
        Wrap(
            children: List<Widget>.generate(
              3,
                  (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      AddTaskCubit.get(context).selectColor = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: index == 0
                          ? primaryClr
                          : index == 1
                          ? pinkClr
                          : yellowClr,
                      child:
                      AddTaskCubit.get(context).selectColor == index
                          ? const Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 16,
                      )
                          : const SizedBox.shrink(),
                    ),
                  ),
                );
              },
            ))
      ],
    );
  }
}
