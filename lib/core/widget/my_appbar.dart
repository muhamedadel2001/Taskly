import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final Function()onTAP;
  final IconData icon;
  const MyAppBar({super.key, required this.onTAP, required this.icon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: GestureDetector(
        onTap: onTAP
        ,
        child: Icon(icon

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
    );
  }
}
