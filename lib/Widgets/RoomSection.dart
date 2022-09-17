import 'package:Realix/Widgets/AppIcon.dart';
import 'package:flutter/material.dart';

class RoomSection extends StatelessWidget {
  IconData icon;
  String high;
  String low;
  RoomSection({Key? key,required this.icon,required this.high,required this.low}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppIcon(icon:icon, onclick: (){}),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(high,style: TextStyle(fontSize: 12,color: Colors.grey.shade400),),
            SizedBox(height: 2,),
            Text(low,style: TextStyle(fontSize: 13))
          ],
        )
      ],
    );
  }
}
