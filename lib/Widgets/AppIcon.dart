import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  IconData icon;
  var onclick;

  AppIcon({Key? key, required this.icon, required this.onclick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(50)),
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon),
            ),
            onTap: onclick,
          )),
    );
  }
}
