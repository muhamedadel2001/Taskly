// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TasksModelsAdapter extends TypeAdapter<TasksModels> {
  @override
  final int typeId = 0;

  @override
  TasksModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TasksModels(
      note: fields[0] as String,
      title: fields[1] as String,
      isCompleted: fields[2] as int,
      date: fields[3] as String,
      startTime: fields[4] as String,
      endTime: fields[5] as String,
      color: fields[6] as int,
      remind: fields[7] as int,
      repeat: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TasksModels obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.note)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.isCompleted)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.startTime)
      ..writeByte(5)
      ..write(obj.endTime)
      ..writeByte(6)
      ..write(obj.color)
      ..writeByte(7)
      ..write(obj.remind)
      ..writeByte(8)
      ..write(obj.repeat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TasksModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
