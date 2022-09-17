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
        subtitle:Text(fixdate) ,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIcon(icon: Icons.check, onclick: () async {
              await snap.reference.update({
                "isResponded":true,
                "isAccepted":true,
              });
            }),
            AppIcon(icon: Icons.cancel, onclick: () async {
              await snap.reference.delete();
            }),
          ],
        ),
      ),
    );
  }
}
