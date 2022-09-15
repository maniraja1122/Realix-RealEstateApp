import 'package:Realix/AppRoutes.dart';
import 'package:Realix/Controller/HomeController.dart';
import 'package:Realix/Models/User.dart';
import 'package:Realix/Repository/DBHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../Widgets/RoundButton.dart';

class Signup extends GetView {
  @override
  Widget build(BuildContext context) {
    var _controller=Get.find<HomeController>();
    var _key = GlobalKey<FormState>();
    var name = "";
    var email = "";
    var pass = "";
    return Obx(() => ModalProgressHUD(
      inAsyncCall: _controller.isRegistering.value,
      dismissible: false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Create a Realix account",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Create an account to continue",
                      style: TextStyle(color: Colors.grey,fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter A Name First";
                        }
                        return null;
                      },
                      onChanged: (val) {
                        name = val;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: "Enter Your Full Name",
                          label: Text("Full Name")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: TextFormField(
                      onChanged: (val) {
                        email = val;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: "Enter Your Email",
                          label: Text("Email")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: TextFormField(
                      obscureText: true,
                      onChanged: (val) {
                        pass = val;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: "Enter Your Password",
                          label: Text("Password")),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RoundButton(
                      bg: Colors.blue, content: "Sign Up", onclick: () async {
                    if (_key.currentState!.validate()) {
                      _controller.isRegistering.value=true;
                      try {
                        var credits = await DBHelper.auth
                            .createUserWithEmailAndPassword(
                            email: email, password: pass);
                        var newuser=Users(key: credits.user!.uid, name: name, email: email);
                        await DBHelper.db.collection("Users").add(newuser.toMap());
                        _controller.isRegistering.value=false;
                        Get.toNamed(AppRoutes.home);
                      } on FirebaseAuthException
                      catch(e){
                        _controller.isRegistering.value=false;
                        Get.showSnackbar(GetSnackBar(title: "Error",message: e.message,));
                      }
                    }
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Text("Already have an account?"),
                    onTap: () {
                      Get.toNamed(AppRoutes.login);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
