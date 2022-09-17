import 'package:Realix/Widgets/MyAppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'dart:developer' as dev;
import '../ListItems/AppointmentItem.dart';
import '../Repository/DBHelper.dart';

class AppointmentView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Appointments",
        isCenter: true,
        isBold: true,
      ),
      body: StreamBuilder(
        stream: DBHelper.db
            .collection("Requests")
            .where("isResponded", isEqualTo: true)
            .orderBy("timefixed")
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if(snapshot.hasError){
            dev.log(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            var arr = snapshot.data!.docs;
            arr.where((element) =>
            (element.get("senderkey") == DBHelper.auth.currentUser!.uid ||
                element.get("recieverkey") == DBHelper.auth.currentUser!.uid));
            return ListView.builder(
              itemCount: arr.length,
              itemBuilder: (BuildContext context, int index) {
                return AppointmentItem(snap: arr[index]);
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

}