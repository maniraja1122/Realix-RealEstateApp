import 'package:Realix/Views/AppointmentView.dart';
import 'package:Realix/Views/HomeMap.dart';
import 'package:Realix/Views/RequestView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class Home extends GetView {
  @override
  Widget build(BuildContext context) {
    var colorlabel=MediaQuery.of(context).platformBrightness==Brightness.dark?Colors.white:Colors.black;
    return SafeArea(
      child: DefaultTabController(child:Scaffold(
        body: TabBarView(physics: NeverScrollableScrollPhysics(),children: [HomeMap(),RequestView(),AppointmentView()],),
        bottomNavigationBar:  TabBar(
          unselectedLabelColor: Colors.grey,
          labelColor: colorlabel,
          tabs: [
            Tab(
              text: "Home",
              icon: Icon(Icons.home),
            ),
            Tab(
              text: "Request",
              icon: Icon(Icons.people),
            ),
            Tab(
              text: "Appointment",
              icon: Icon(Icons.watch_later),
            )
          ],),
      ), length:3,
      ),);
  }
}
