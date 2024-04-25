import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utilts/my_cache.dart';
import '../../../../../core/utilts/my_cache_keys.dart';

class NotificationPage extends StatelessWidget {
  final String label;
  const NotificationPage({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          label.toString().split('|')[0],
          style: TextStyle(
              color: MyCache.getBool(key: MyCacheKeys.isDark)!
                  ? Colors.white
                  : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: MyCache.getBool(key: MyCacheKeys.isDark)!
                  ? Colors.white
                  : Colors.black,
            )),
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 300,
          decoration: BoxDecoration(
            color: MyCache.getBool(key: MyCacheKeys.isDark) == true
                ? Colors.white
                : Colors.grey[400],
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  label.toString().split('|')[1],
                  style: TextStyle(
                  color: MyCache.getBool(key: MyCacheKeys.isDark) == true
                      ? Colors.black
                      : Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
