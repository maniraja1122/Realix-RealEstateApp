import 'package:Realix/AppPages.dart';
import 'package:Realix/AppRoutes.dart';
import 'package:Realix/Bindings/HomeBinding.dart';
import 'package:Realix/Repository/DBHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApp());
}

class MainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Realix",
      theme: ThemeData(primarySwatch: Colors.blue,fontFamily: GoogleFonts.lato().fontFamily,brightness:Brightness.light ,backgroundColor: Color.fromRGBO(255, 255, 255,1)),
      darkTheme: ThemeData(primarySwatch: Colors.blue,fontFamily: GoogleFonts.lato().fontFamily,brightness:Brightness.dark,backgroundColor: Color.fromRGBO(17, 24, 19, 1)),
      getPages: AppPages.getPages,
      initialRoute: DBHelper.auth.currentUser==null?AppRoutes.selector:AppRoutes.home,
      initialBinding: HomeBinding(),
    );
  }

}



