import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_asks/features/add_task_screen/manager/add_task_cubit.dart';
import 'package:my_asks/features/add_task_screen/presentation/views/view/add_task_body_screen.dart';

import '../../../../core/utilts/my_cache.dart';
import '../../../../core/utilts/my_cache_keys.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AddTaskCubit(),
  child: Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: MyCache.getBool(key: MyCacheKeys.isDark)!
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
      body: const AddTaskBodyScreen(),
    ),
);
  }
}
