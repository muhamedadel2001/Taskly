import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_asks/core/utilts/constants.dart';
import 'package:my_asks/core/utilts/my_cache_keys.dart';
import 'package:my_asks/core/utilts/themes.dart';
import 'package:my_asks/features/home_screen/manager/home_cubit.dart';
import 'package:my_asks/features/home_screen/presentation/views/home_screen.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/utilts/bloc_observer.dart';
import 'core/utilts/my_cache.dart';
import 'features/add_task_screen/data/tasks_models.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TasksModelsAdapter());
  await Hive.openBox<TasksModels>(kTasks);
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await MyCache.initCache();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: Themes.light,
              darkTheme: Themes.dark,
              themeMode: MyCache.getBool(key: MyCacheKeys.isDark)!
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: const HomeScreen());
        },
      ),
    );
  }
}
