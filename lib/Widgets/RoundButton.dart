import 'package:flutter/material.dart';


class RoundButton extends StatelessWidget {
  Color bg;
  String content="";
  var onclick;
  RoundButton({Key? key,required this.bg,required this.content,required this.onclick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick,
      child: Container(
        child: Center(child: Text(content,style: TextStyle(fontSize: 20),)),
        decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),
            color:bg),
        width: MediaQuery.of(context).size.width-100,
        height: 50,
      ),
    );
  }
}
