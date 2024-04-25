import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_asks/core/utilts/fonts.dart';
import 'package:my_asks/features/add_task_screen/presentation/views/main_add_task_screen.dart';
import 'package:my_asks/features/add_task_screen/presentation/views/view/add_task_body_screen.dart';
import 'package:my_asks/features/home_screen/manager/home_cubit.dart';
import 'package:my_asks/features/home_screen/presentation/views/view/my_button.dart';

class DateAndAddTaskSection extends StatelessWidget {
  const DateAndAddTaskSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat.yMMMMd().format(
                      DateTime.now(),
                    ),
                    style: MyFonts.subHeadingStyle,
                  ),
                  Text(
                    'Today',
                    style: MyFonts.headingStyle,
                  )
                ],
              );
            },
          ),
          MyButton(
            label: "+  Add Task",
            onTap: () {
              Get.to(const AddTaskScreen());
            },
          ),
        ],
      ),
    );
  }
}
