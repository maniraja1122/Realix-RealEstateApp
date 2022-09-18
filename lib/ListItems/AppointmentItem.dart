import 'package:Realix/Repository/DBHelper.dart';
import 'package:Realix/Widgets/AppIcon.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class AppointmentItem extends StatelessWidget {
  QueryDocumentSnapshot snap;

  AppointmentItem({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var now=DateTime.fromMicrosecondsSinceEpoch(snap.get("timefixed"));
    DateFormat dateFormat = DateFormat("d MMMM");
    String fixdate = dateFormat.format(now);
    return Card(
      child: ListTile(
        title: StreamBuilder(
          stream: DBHelper.db
              .collection("Users")
              .where("key", isEqualTo: snap.get("senderkey"))
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if(snapshot.hasData){
              return Text(snapshot.data!.docs[0].get("name"));
            }
            return SizedBox();
          },
        ),
        subtitle:Text("Due on "+fixdate) ,
        trailing: snap.get("senderkey")==DBHelper.auth.currentUser!.uid?Icon(Icons.arrow_circle_right):Icon(Icons.arrow_circle_left)
      ),
    );
  }
}
