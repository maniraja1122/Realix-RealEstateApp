import 'package:Realix/AppRoutes.dart';
import 'package:Realix/Repository/DBHelper.dart';
import 'package:Realix/Widgets/AppIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class Home extends GetView {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Gronausestraat 710, Enschede"),
        actions: [
          AppIcon(icon: Icons.logout, onclick: () async {
            await DBHelper.auth.signOut();
            Get.toNamed(AppRoutes.selector);
          }),
          SizedBox(
            width: 10,
          )
        ],
      ),
    ));
  }
}
