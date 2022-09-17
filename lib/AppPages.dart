import 'package:Realix/AppRoutes.dart';
import 'package:Realix/Views/AddProperty.dart';
import 'package:Realix/Views/Selector.dart';
import 'package:Realix/Views/Signup.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'Views/Home.dart';
import 'Views/Login.dart';

class AppPages {
  static List<GetPage> getPages = [GetPage(name: AppRoutes.selector, page: () { return Selector(); },),
    GetPage(name: AppRoutes.login, page: () { return Login(); }, ),
    GetPage(name: AppRoutes.signup, page: () { return Signup(); },),
    GetPage(name: AppRoutes.home, page: () { return Home(); }),
    GetPage(name: AppRoutes.addproperty, page: () { return AddProperty(); }),
  ];
}