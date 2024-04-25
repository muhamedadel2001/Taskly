import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_asks/core/utilts/colors.dart';
import 'package:my_asks/core/utilts/helper_functions.dart';
import 'package:my_asks/core/utilts/my_cache.dart';
import 'package:my_asks/core/utilts/my_cache_keys.dart';
import 'package:my_asks/core/widget/button_bottom_sheet.dart';
import 'package:my_asks/features/home_screen/manager/home_cubit.dart';

import '../../../../add_task_screen/data/tasks_models.dart';

class TaskItem extends StatelessWidget {
  final TasksModels models;
  const TaskItem({super.key, required this.models});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(Container(

          padding: const EdgeInsets.only(top: 4),
          height: models.isCompleted == 1
              ? MediaQuery.of(context).size.height * 0.24
              : MediaQuery.of(context).size.height * 0.32,
          color: MyCache.getBool(key: MyCacheKeys.isDark) == true
              ? darkGreyClr
              : Colors.white,
          child: Column(
            children: [
              Container(
                height: 6,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyCache.getBool(key: MyCacheKeys.isDark) == true
                        ? Colors.grey[600]
                        : Colors.grey[300]),
              ),
              const Spacer(),
              models.isCompleted == 1
                  ? Container()
                  : ButtonBottomSheet(
                      label: 'Task Completed',
                      onTAP: () {
                        models.isCompleted = 1;
                        models.save();
                        HomeCubit.get(context).getTasks();
                        Get.back();
                      },
                      color: primaryClr),

              ButtonBottomSheet(
                  label: 'Delete Task',
                  onTAP: () {
                    models.delete();
                    HomeCubit.get(context).getTasks();
                    Get.back();
                  },
                  color: Colors.red[300]!),
              const SizedBox(
                height: 20,
              ),
              ButtonBottomSheet(
                isClose: true,
                  label: 'Close ',
                  onTAP: () {
                    Get.back();
                  },
                  color: Colors.red[300]!),
              const SizedBox(height: 10,)
            ],
          ),
        ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: 12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: HelperFunctions.getCol(models.color )),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    models.title,
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: Colors.grey[200],
                        size: 18,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "${models.startTime} - ${models.endTime}",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 13, color: Colors.grey[100])),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    models.note,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[200],
                    )),
                  )
                ],
              )),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 60,
                width: 0.5,
                color: Colors.grey[200]!.withOpacity(0.7),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Text(models.isCompleted == 1 ? "Completed" : "TODO"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
