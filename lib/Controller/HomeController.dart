

import 'dart:io';

import 'package:Realix/Bindings/HomeBinding.dart';
import 'package:Realix/Repository/DBHelper.dart';
import 'package:Realix/Models/Home.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController{
  var isRegistering=false.obs;
  var isLogging=false.obs;
  var isAdding=false.obs;
  Placemark? currplace=null;
  LatLng? currloc=null;
  Rx<String> img="".obs;

  //Functions
  Future<void> AddProperty(String name,int bed,int bath,int area,String desc) async{
    var imgfile=File(img.value);
    var id=DateTime.now().microsecondsSinceEpoch;
    var myref=DBHelper.storage.ref().child("Home").child(id.toString());
    await myref.putFile(imgfile);
    var imgurl=await myref.getDownloadURL();
    var newhome=Home(name: name, userkey: DBHelper.auth.currentUser!.uid, location: currplace!.subLocality! +
        ", " +
        currplace!.locality! +
        ", " +
        currplace!.country!, Longitude: currloc!.longitude, Latitude: currloc!.latitude, bath: bath, beds: bed, square: area, description: desc, imglink: imgurl);
    await DBHelper.db.collection("Home").add(newhome.toMap());
  }
}