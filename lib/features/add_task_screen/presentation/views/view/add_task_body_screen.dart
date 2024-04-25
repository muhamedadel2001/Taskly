import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_asks/core/utilts/fonts.dart';
import 'package:my_asks/core/widget/input_field.dart';
import 'package:my_asks/features/add_task_screen/data/tasks_models.dart';
import 'package:my_asks/features/add_task_screen/manager/add_task_cubit.dart';
import 'package:my_asks/features/add_task_screen/presentation/views/view/color_pallete.dart';
import 'package:my_asks/features/home_screen/manager/home_cubit.dart';
import 'package:my_asks/features/home_screen/presentation/views/view/my_button.dart';

class AddTaskBodyScreen extends StatefulWidget {
  const AddTaskBodyScreen({super.key});

  @override
  State<AddTaskBodyScreen> createState() => _AddTaskBodyScreenState();
}

class _AddTaskBodyScreenState extends State<AddTaskBodyScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskCubit, AddTaskState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Task',
                  style: MyFonts.headingStyle,
                ),
                InputField(
                    title: 'Title',
                    hintText: 'Enter Your Title',
                    controller: AddTaskCubit.get(context).titleController),
                InputField(
                  title: 'Note',
                  hintText: 'Enter Your Note',
                  controller: AddTaskCubit.get(context).noteController,
                ),
                InputField(
                  readOnly: true,
                  title: 'Date',
                  hintText: DateFormat.yMd()
                      .format(AddTaskCubit.get(context).selectedDate),
                  widget: IconButton(
                    onPressed: () {
                      AddTaskCubit.get(context).getDateFromUser(context);
                    },
                    icon: const Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: InputField(
                      readOnly: true,
                      title: 'Start Time',
                      hintText: AddTaskCubit.get(context).startTime,
                      widget: IconButton(
                        onPressed: () {
                          AddTaskCubit.get(context).getTimeFromUser(
                              context: context, startedTime: true);
                        },
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: InputField(
                      readOnly: true,
                      title: 'End Time',
                      hintText: AddTaskCubit.get(context).endTime,
                      widget: IconButton(
                        onPressed: () {
                          AddTaskCubit.get(context).getTimeFromUser(
                              context: context, startedTime: false);
                        },
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    )),
                  ],
                ),
                InputField(
                  readOnly: true,
                  title: 'Remind',
                  hintText:
                      "${AddTaskCubit.get(context).selectRemindTime} minutes early",
                  widget: DropdownButton(
                    underline: Container(color: Colors.transparent),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    onChanged: (value) {
                      setState(() {
                        AddTaskCubit.get(context).selectRemindTime =
                            int.parse(value!);
                      });
                    },
                    iconSize: 32,
                    elevation: 4,
                    style: MyFonts.subTitleStyle,
                    items: AddTaskCubit.get(context)
                        .selectRemindTimes
                        .map<DropdownMenuItem<String>>(
                      (int value) {
                        return DropdownMenuItem<String>(
                            value: value.toString(),
                            child: Text(value.toString()));
                      },
                    ).toList(),
                  ),
                ),
                InputField(
                  readOnly: true,
                  title: 'Repeat',
                  hintText: AddTaskCubit.get(context).selectRepeatTime,
                  widget: DropdownButton(
                    underline: Container(color: Colors.transparent),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    onChanged: (value) {
                      setState(() {
                        AddTaskCubit.get(context).selectRepeatTime = value!;
                      });
                    },
                    iconSize: 32,
                    elevation: 4,
                    style: MyFonts.subTitleStyle,
                    items: AddTaskCubit.get(context)
                        .selectRepeatedTimes
                        .map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(color: Colors.grey),
                            ));
                      },
                    ).toList(),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ColorPallete(),
                    MyButton(
                        label: 'Create Task',
                        onTap: () {
                          AddTaskCubit.get(context).addTaskModel(TasksModels(
                              note:
                                  AddTaskCubit.get(context).noteController.text,
                              title: AddTaskCubit.get(context)
                                  .titleController
                                  .text,
                              isCompleted: 0,
                              date: AddTaskCubit.get(context).format == ''
                                  ? AddTaskCubit.get(context)
                                      .selectedDate
                                      .toString()
                                  : AddTaskCubit.get(context).format,
                              startTime: AddTaskCubit.get(context).startTime,
                              endTime: AddTaskCubit.get(context).endTime,
                              color: AddTaskCubit.get(context).selectColor,
                              remind:
                                  AddTaskCubit.get(context).selectRemindTime,
                              repeat:
                                  AddTaskCubit.get(context).selectRepeatTime));
                          Get.back();
                          HomeCubit.get(context).getTasks();
                        })
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
