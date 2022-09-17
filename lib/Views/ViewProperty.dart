import 'package:Realix/Models/Requests.dart';
import 'package:Realix/Repository/DBHelper.dart';
import 'package:Realix/Widgets/AppIcon.dart';
import 'package:Realix/Widgets/RoomSection.dart';
import 'package:Realix/Widgets/RoundButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

class ViewProperty extends GetView {
  late QueryDocumentSnapshot snap;

  ViewProperty(@required this.snap);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Viewing Property"),
        leading: AppIcon(
            icon: Icons.arrow_back_outlined,
            onclick: () {
              Get.back();
            }),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Image.network(
                        snap.get("imglink"),
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        fit: BoxFit.fill,
                      ),
                      clipBehavior: Clip.hardEdge,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snap.get("name"),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              shadows: <Shadow>[
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(125, 0, 0, 255),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            snap.get("location"),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                shadows: <Shadow>[
                                  Shadow(
                                    blurRadius: 3.0,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                  Shadow(
                                    blurRadius: 3.0,
                                    color: Color.fromARGB(125, 0, 0, 255),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Description",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    RoomSection(
                        icon: Icons.bed,
                        high: "Bed Room",
                        low: snap.get("beds").toString() + " Rooms"),
                    SizedBox(
                      width: 5,
                    ),
                    RoomSection(
                        icon: Icons.bathtub_outlined,
                        high: "Bath Room",
                        low: snap.get("bath").toString() + " Rooms"),
                    SizedBox(
                      width: 5,
                    ),
                    RoomSection(
                        icon: Icons.crop_square,
                        high: "Square",
                        low: snap.get("square").toString() + " Ft"),
                    SizedBox(
                      width: 5,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "About",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 5,
                ),
                Text(
                  snap.get("description"),
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                ),
                SizedBox(
                  height: 40,
                ),
                StreamBuilder(
                  stream: DBHelper.db
                      .collection("Requests")
                      .where("senderkey",isEqualTo: DBHelper.auth.currentUser!.uid)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if(snapshot.hasData){
                      var arr=snapshot.data!.docs;
                      var check=arr.where((element) => element.get("recieverkey")==snap.get("userkey"));
                      if(snap.get("userkey")!=DBHelper.auth.currentUser!.uid && check.isEmpty){
                        return RoundButton(bg: Colors.blue, content: "Request Tour", onclick: (){
                          //2628000000000
                          DatePicker.showDatePicker(theme:DatePickerTheme(backgroundColor: MediaQuery.of(context).platformBrightness==Brightness.dark?Colors.grey.shade500:Colors.white),context,
                              showTitleActions: true,
                              minTime: DateTime.now(),
                              maxTime: DateTime.fromMicrosecondsSinceEpoch(DateTime.now().microsecondsSinceEpoch+2628000000000),
                          onConfirm: (date) async {
                                await DBHelper.db.collection("Requests").add(Requests(senderkey: DBHelper.auth.currentUser!.uid, recieverkey: snap.get("userkey"), isResponded: false, isAccepted: false, timefixed: date.microsecondsSinceEpoch).toMap());
                          },
                          currentTime: DateTime.now(), locale: LocaleType.en);
                        });
                      }
                    }
                    return SizedBox();
                  },
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
