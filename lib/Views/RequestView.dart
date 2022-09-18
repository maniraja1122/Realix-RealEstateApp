import 'package:Realix/ListItems/RequestItem.dart';
import 'package:Realix/Widgets/MyAppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../Repository/DBHelper.dart';

class RequestView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Requests",
        isCenter: true,
        isBold: true,
      ),
      body: StreamBuilder(
        stream: DBHelper.db
            .collection("Requests")
            .where("recieverkey", isEqualTo: DBHelper.auth.currentUser!.uid)
            .orderBy("timefixed")
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            var arr = snapshot.data!.docs;
            arr=arr.where((element) => !element.get("isResponded")).toList();
            if(!arr.isEmpty) {
              return ListView.builder(
                itemCount: arr.length,
                itemBuilder: (BuildContext context, int index) {
                  return RequestItem(snap: arr[index]);
                },
              );
            }
            else{
              return Center(child: Text("No Requests",style: TextStyle(fontSize: 20),),);
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
