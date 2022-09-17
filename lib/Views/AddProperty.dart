import 'dart:ffi';
import 'dart:io';

import 'package:Realix/Controller/HomeController.dart';
import 'package:Realix/Widgets/AppIcon.dart';
import 'package:Realix/Widgets/RoundButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddProperty extends GetView {
  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<HomeController>();
    var _key=GlobalKey<FormState>();
    var name="";
    var beds=0;
    var baths=0;
    var area=0;
    var desc="";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add New Property",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: AppIcon(
            icon: Icons.arrow_back_rounded,
            onclick: () {
              _controller.img.value="";
              Get.back();
            }),
      ),
      body: Obx(() => ModalProgressHUD(
        inAsyncCall: _controller.isAdding.value,
        child: Form(
          key: _key,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      leading: AppIcon(
                        icon: Icons.location_pin,
                        onclick: () {},
                      ),
                      title: Text("Property Address"),
                      subtitle: Text(_controller.currplace!.subLocality! +
                          ", " +
                          _controller.currplace!.locality! +
                          ", " +
                          _controller.currplace!.country!),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (val){
                      name=val;
                    },
                    validator: (val){
                      if(val!.length>5){
                        return null;
                      }
                      return "Please enter atleast 6 characters";
                    },
                    decoration: InputDecoration(
                        hintText: "e.g House No 19 , Phase 8",
                        label: Text("Enter Property Name"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextFormField(
                          onChanged: (val){
                            if(val!="")
                              beds=int.parse(val);
                          },
                          validator: (val){
                            if(val!=""){
                              return null;
                            }
                            return "Please enter a number first";
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "0",
                              label: Text("No of Beds"),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: TextFormField(
                          onChanged: (val){
                            if(val!="")
                              baths=int.parse(val);
                          },
                          validator: (val){
                            if(val!=""){
                              return null;
                            }
                            return "Please enter a number first";
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "0",
                              label: Text("No of Baths"),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    onChanged: (val){
                      if(val!="")
                        area=int.parse(val);
                    },
                    validator: (val){
                      if(val!=""){
                        return null;
                      }
                      return "Please enter a number first";
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "0 Sq. Ft",
                        label: Text("Area in Square Feets"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    onChanged: (val){
                      desc=val;
                    },
                    validator: (val){
                      if(val!.length>49){
                        return null;
                      }
                      return "Please enter atleast 50 characters";
                    },
                    maxLines: 5,
                    maxLength: 200,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: "e.g Year built, Property location importance etc",
                        label: Text("Tell us about your home here"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppIcon(icon: Icons.camera_alt, onclick: () async {
                        var xfile = await ImagePicker().pickImage(source: ImageSource.gallery,maxHeight: 1800);
                        _controller.img.value=xfile!.path;
                      }),
                      Obx(() => _controller.img.value==""?SizedBox():Text("Uploaded Successfully",style: TextStyle(color: Colors.green),))
                    ],
                  ),
                  SizedBox(height: 10,),
                  RoundButton(bg: Colors.blue, content: "Publish", onclick: () async {
                    _controller.isAdding.value=true;
                    if(_key.currentState!.validate()){
                      if(_controller.img.value==""){
                        Get.showSnackbar(GetSnackBar(duration: Duration(seconds: 10),title: "Upload Image",message: "Please upload an image too !!!",));
                        _controller.isAdding.value=false;
                      }
                      else{
                        await _controller.AddProperty(name, beds,baths, area, desc);
                        _controller.img.value="";
                        _controller.isAdding.value=false;
                        Get.back();
                      }
                    }
                    _controller.isAdding.value=false;
                  })
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
