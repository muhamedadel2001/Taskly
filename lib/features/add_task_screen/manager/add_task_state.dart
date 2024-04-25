part of 'add_task_cubit.dart';

@immutable
abstract class AddTaskState {}

class AddTaskInitial extends AddTaskState {}
class SelectDateUpdate extends AddTaskState {}
class TimeChanged extends AddTaskState {}
class AddTaskSuccess extends AddTaskState {}
class AddTaskFailed extends AddTaskState {}


