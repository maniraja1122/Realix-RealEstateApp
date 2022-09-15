import 'package:Realix/AppRoutes.dart';
import 'package:Realix/Widgets/RoundButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class Selector extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Enjoy the real world",
              style: TextStyle(fontSize: 20,fontWeight:
              FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Find your dream home on the map"),
            SizedBox(height: 30,),
            RoundButton(bg: Colors.blue, content: "Log In",onclick: (){
              Get.toNamed(AppRoutes.login);
            },),
            SizedBox(height: 20,),
            RoundButton(bg: Colors.blue, content: "Register",onclick: (){
              Get.toNamed(AppRoutes.signup);
            },),
            SizedBox(height: 20,)
          ],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(MediaQuery.of(context).platformBrightness==Brightness.light?"assets/images/bgwhite.jpg":"assets/images/bgblack.jpg"),
        )),
      ),
    );
  }
}
