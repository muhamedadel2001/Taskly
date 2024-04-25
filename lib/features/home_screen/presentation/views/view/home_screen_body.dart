import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:my_asks/features/home_screen/manager/home_cubit.dart';
import 'package:my_asks/features/home_screen/presentation/views/view/date_timeline_screen.dart';
import 'package:my_asks/features/home_screen/presentation/views/view/task_item.dart';

import '../../../../../core/utilts/notifications_services.dart';
import 'date_and_add_task_section.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  late NotificationsServices notifyHelper;
  @override
  void initState() {
    super.initState();
    HomeCubit.get(context).getTasks();
    notifyHelper = NotificationsServices();
    notifyHelper.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DateAndAddTaskSection(),
        const DateTimeLineScreen(),
        const SizedBox(
          height: 10,
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is GetTasksSuccess ||
                state is HomeChangeLightTheme ||
                state is SelectedDateSuccess ||
                state is HomeChangeDarkTheme) {
              return Expanded(
                child: ListView.builder(
                    itemCount: HomeCubit.get(context).tasks.length,
                    itemBuilder: (context, index) {
                      if (HomeCubit.get(context).tasks[index].repeat ==
                          'Daily') {
                        DateTime date2 = DateFormat("hh:mm a").parse(
                            HomeCubit.get(context).tasks[index].startTime);
                        DateTime date3 = date2.subtract(Duration(
                            minutes:
                                HomeCubit.get(context).tasks[index].remind));
                        var myTime = DateFormat("HH:mm").format(date3);
                        notifyHelper.scheduledNotification(
                            hour: int.parse(myTime.toString().split(":")[0]),
                            minuit: int.parse(myTime.toString().split(":")[1]),
                            body: HomeCubit.get(context).tasks[index].note,
                            title: HomeCubit.get(context).tasks[index].title);
                        return AnimationConfiguration.staggeredList(
                            position: index,
                            child: SlideAnimation(
                              child: FadeInAnimation(
                                  child: Row(
                                children: [
                                  TaskItem(
                                      models:
                                          HomeCubit.get(context).tasks[index])
                                ],
                              )),
                            ));
                      }
                      if (HomeCubit.get(context).format ==
                          HomeCubit.get(context).tasks[index].date) {
                        return AnimationConfiguration.staggeredList(
                            position: index,
                            child: SlideAnimation(
                              child: FadeInAnimation(
                                  child: Row(
                                children: [
                                  TaskItem(
                                      models:
                                          HomeCubit.get(context).tasks[index])
                                ],
                              )),
                            ));
                      } else {
                        return const SizedBox.shrink();
                      }

                      // return ;
                    }),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        )
      ],
    );
  }
}
