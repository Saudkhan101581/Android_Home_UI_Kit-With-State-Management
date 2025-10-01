
import 'package:classico/Controllers/AndroidHomeUiController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Customcircleavatar extends StatelessWidget {
  final int index;
  final IconData CircleIcon;
  final String text1;
  final String text2;
  final IconData lastIcon;
  final AndroidHomeUIController controller = Get.find();
  Customcircleavatar({super.key, required this.CircleIcon, required this.text1, required this.text2,required this.lastIcon, required this.index});

  @override
  Widget build(BuildContext context) {
    return Obx(()  {
      final isOn= controller.ButtonState[index];
      return Row(
        children: [
          InkWell(
            onTap: (){
              controller.ButtonState[index]=!isOn;
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: isOn? Colors.green : Colors.grey,
              child: Icon(CircleIcon,color:isOn ? Colors.white : Colors.black,),
            ),
          ),
          SizedBox(width: 10,),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 10,),
              Text(text1,style: TextStyle(fontWeight: isOn? FontWeight.w100: FontWeight.w500),),
              Text(text2,style: TextStyle(fontWeight: isOn? FontWeight.w100: FontWeight.w500)),
            ],
          ),
          Spacer(),
          Icon(lastIcon)
        ],
      );
    }
    );
  }
}



