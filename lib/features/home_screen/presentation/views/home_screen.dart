import 'package:flutter/material.dart';
import 'package:my_asks/core/utilts/my_cache.dart';
import 'package:my_asks/core/utilts/my_cache_keys.dart';
import 'package:my_asks/core/utilts/notifications_services.dart';
import 'package:my_asks/features/home_screen/manager/home_cubit.dart';
import 'package:my_asks/features/home_screen/presentation/views/view/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NotificationsServices notifyHelper;
  @override
  void initState() {
    notifyHelper = NotificationsServices();
    notifyHelper.initializeNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            HomeCubit.get(context).changeTheme();
            notifyHelper.displayNotification(
                title: 'Theme Changed',
                body: MyCache.getBool(key: MyCacheKeys.isDark) == true
                    ? 'Activated Dark Theme'
                    : 'Activated Light Theme');
          },
          child: Icon(
            MyCache.getBool(key: MyCacheKeys.isDark)!
                ? Icons.wb_sunny_outlined
                : Icons.nightlight_round,
            size: 25,
            color: MyCache.getBool(key: MyCacheKeys.isDark)!
                ? Colors.white
                : Colors.black,
          ),
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage('images/dawnload.png'),
          ),
          SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const HomeScreenBody(),
    );
  }
}
