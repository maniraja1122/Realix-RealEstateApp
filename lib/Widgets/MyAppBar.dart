import 'package:Realix/Widgets/AppIcon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../AppRoutes.dart';
import '../Repository/DBHelper.dart';


class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  var title="";
  var isCenter=false;
  var isBold=false;
  MyAppBar({Key? key,required this.title,required this.isCenter,required this.isBold}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: isCenter,
      automaticallyImplyLeading: false,
      title: Text(title,style: TextStyle(fontWeight: isBold?FontWeight.bold:FontWeight.normal),),
      actions: [
        AppIcon(icon: Icons.logout, onclick: () async {
          await DBHelper.auth.signOut();
          Get.toNamed(AppRoutes.selector);
        }),
        SizedBox(
          width: 5,
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
