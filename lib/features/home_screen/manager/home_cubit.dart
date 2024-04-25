import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_asks/core/utilts/constants.dart';
import 'package:my_asks/core/utilts/my_cache.dart';
import 'package:my_asks/core/utilts/my_cache_keys.dart';
import 'package:my_asks/features/add_task_screen/data/tasks_models.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);
  bool isDark = false;
  List<TasksModels>tasks=[];
  DateTime selectedDate = DateTime.now();
  late String format=DateFormat.yMd().format(selectedDate);
  ThemeMode changeTheme() {
    isDark = !MyCache.getBool(key: MyCacheKeys.isDark)!;
    MyCache.setBool(key: MyCacheKeys.isDark, value: isDark);
    if (isDark) {
      emit(HomeChangeDarkTheme());
      return ThemeMode.dark;
    } else {
      emit(HomeChangeLightTheme());
      return ThemeMode.light;
    }
  }

  void slectedDate(DateTime dateTime) {
    selectedDate = dateTime;
     format = DateFormat.yMd().format(selectedDate);
    emit(SelectedDateSuccess());
  }
  getTasks(){
    var taskBox = Hive.box<TasksModels>(kTasks);
    tasks= taskBox.values.toList();
    emit(GetTasksSuccess());

  }

}
