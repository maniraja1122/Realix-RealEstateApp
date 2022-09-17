import 'package:Realix/AppRoutes.dart';
import 'package:Realix/Views/ViewProperty.dart';
import 'package:Realix/Widgets/MyAppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Controller/HomeController.dart';
import '../Repository/DBHelper.dart';

class HomeMap extends GetView {
  var _controller = Get.find<HomeController>();
  late GoogleMapController mapcontroller;

  Future<LatLng> getLocation() async {
    bool service = await Geolocator.isLocationServiceEnabled();
    var permission = await Geolocator.checkPermission();
    if (service) {
      if (permission == LocationPermission.denied) {
        await Geolocator.requestPermission();
        permission = await Geolocator.checkPermission();
        if (permission != LocationPermission.denied) {
          var loc = await Geolocator.getCurrentPosition();
          return Future.value(LatLng(loc.latitude, loc.longitude));
        }
      } else {
        var loc = await Geolocator.getCurrentPosition();
        return Future.value(LatLng(loc.latitude, loc.longitude));
      }
    }
    var lastloc = await Geolocator.getLastKnownPosition();
    if (lastloc != null) {
      return Future.value(LatLng(lastloc.latitude, lastloc.longitude));
    } else {
      return Future.value(LatLng(0, 0));
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getLocation(),
      builder: (BuildContext context, AsyncSnapshot<LatLng> snapshot) {
        if (snapshot.hasData) {
          var currloc = snapshot.data!;
          return FutureBuilder(
            future:
            placemarkFromCoordinates(currloc.latitude, currloc.longitude),
            builder: (BuildContext context,
                AsyncSnapshot<List<Placemark>> snapshot) {
              if (snapshot.hasData) {
                var places = snapshot.data!;
                _controller.currloc = currloc;
                _controller.currplace = places[0];
                return FutureBuilder(future: BitmapDescriptor.fromAssetImage(
                    ImageConfiguration(size: Size(50, 50)),
                    "assets/images/home.png"),
                  builder: (BuildContext context,
                      AsyncSnapshot<BitmapDescriptor> snapshot) {
                  if(snapshot.hasData){
                    var homeicon=snapshot.data;
                    return StreamBuilder(
                      stream: DBHelper.db.collection("Home").snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                        if (snapshot.hasData) {
                          Set<Marker> markers = {};
                          var snaps = snapshot.data!.docs;
                          for (var snap in snaps) {
                            var newmarker = Marker(icon:homeicon!,
                                markerId: MarkerId(snap.get("userkey") +
                                    snap.get("name") +
                                    snap.get("description")),position: LatLng(snap.get("Latitude"),snap.get("Longitude")),infoWindow: InfoWindow(title: snap.get("name"),onTap:(){
                                  Get.to(ViewProperty(snap));
                                }));
                            markers.add(newmarker);
                          }
                          return Scaffold(
                            floatingActionButton: FloatingActionButton(
                              onPressed: () {
                                Get.toNamed(AppRoutes.addproperty);
                              },
                              child: Icon(Icons.add),
                            ),
                            appBar: MyAppBar(
                              title: places[0].subLocality! +
                                  ", " +
                                  places[0].locality! +
                                  ", " +
                                  places[0].country!,
                              isCenter: false,
                              isBold: false,
                            ),
                            body: GoogleMap(
                              markers: markers,
                              initialCameraPosition:
                              CameraPosition(target: currloc, zoom: 11),
                              onMapCreated: (controller) {
                                mapcontroller = controller;
                              },
                              mapType: MapType.terrain,
                              zoomControlsEnabled: false,
                              myLocationEnabled: true,
                            ),
                          );
                        }
                        return Scaffold(
                            body: Center(child: CircularProgressIndicator()));
                      },
                    );
                  }
                  return Scaffold(body: Center(child: CircularProgressIndicator()));
                  },);
              }
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            },
          );
        }
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
