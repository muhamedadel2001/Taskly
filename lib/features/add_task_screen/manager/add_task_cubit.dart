import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../../../core/utilts/constants.dart';
import '../data/tasks_models.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());
  DateTime selectedDate = DateTime.now();
  late String format = DateFormat.yMd().format(selectedDate);
  TextEditingController noteController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  String startTime = DateFormat("h:m a").format(DateTime.now()).toString();
  String endTime = '9:30 PM';
  int selectRemindTime = 5;
  List<int> selectRemindTimes = [5, 10, 15, 20, 25, 30];
  String selectRepeatTime = 'None';
  List<String> selectRepeatedTimes = ['None', 'Daily'];
  int selectColor = 0;

  static AddTaskCubit get(context) => BlocProvider.of<AddTaskCubit>(context);
  getDateFromUser(BuildContext context) async {
    DateTime? pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2025),
    );
    selectedDate = pickerDate!;
    format = DateFormat.yMd().format(selectedDate);
    emit(SelectDateUpdate());
    return pickerDate;
  }

  getTimeFromUser(
      {required BuildContext context, required bool startedTime}) async {
    var timePicker = await showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: const TimeOfDay(
            hour: 6,
            minute: 30));
    if (timePicker == null) {
      if (kDebugMode) {
        print('time canceld');
      }
    } else {
      String formatTime = timePicker.format(context);
      if (startedTime == true) {
        startTime = formatTime;
      } else if (startedTime == false) {
        endTime = formatTime;
      }
      emit(TimeChanged());
    }
  }

  addTaskModel(TasksModels tasks) {
    try {
      var taskBox = Hive.box<TasksModels>(kTasks);
      taskBox.add(tasks);
      emit(AddTaskSuccess());
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(AddTaskFailed());
    }
  }
}
