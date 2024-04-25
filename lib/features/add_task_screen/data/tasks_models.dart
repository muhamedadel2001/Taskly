import 'package:hive/hive.dart';
part 'tasks_models.g.dart';

@HiveType(typeId: 0)
class TasksModels extends HiveObject {
  @HiveField(0)
  String note;
  @HiveField(1)
  String title;
  @HiveField(2)
  int isCompleted;
  @HiveField(3)
  String date;
  @HiveField(4)
  String startTime;
  @HiveField(5)
  String endTime;
  @HiveField(6)
  int color;
  @HiveField(7)
  int remind;
  @HiveField(8)
  String repeat;
  TasksModels(
      {required this.note,
      required this.title,
      required this.isCompleted,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.color,
      required this.remind,
      required this.repeat});
}
