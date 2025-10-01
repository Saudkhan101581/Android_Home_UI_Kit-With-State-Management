
import 'package:classico/Controllers/AndroidHomeUiController.dart';
import 'package:classico/Controllers/Utils/components/CustomVoiceContainer.dart';
import 'package:classico/Model%20Class/FirstModelClass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controllers/Utils/components/CustomWidget.dart';

class AndroidHomeUI extends StatefulWidget {
  const AndroidHomeUI({super.key});
  @override
  State<AndroidHomeUI> createState() => _AndroidHomeUIState();
}
class _AndroidHomeUIState extends State<AndroidHomeUI> {

  final AndroidHomeUIController controller = Get.put(AndroidHomeUIController());

  List<SmallContainer> ContainerList=[
 SmallContainer(text: 'Flashlights', ContIcon:Icons.flashlight_on_outlined),
 SmallContainer(text: 'Flashlights', ContIcon:Icons.flashlight_on_outlined),
 SmallContainer(text: 'Flashlights', ContIcon:Icons.flashlight_on_outlined),
 SmallContainer(text: 'Flashlights', ContIcon:Icons.flashlight_on_outlined),
 SmallContainer(text: 'Flashlights', ContIcon:Icons.flashlight_on_outlined),
    
  ];
  void initState(){
    super.initState();

    controller.ButtonState.assignAll(List.generate(3, (_) => false));
    
    controller.ContainerState.assignAll(List.generate(ContainerList.length, (_) => false));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffA17168),
      appBar: AppBar(
        backgroundColor: Color(0xff61372F),
        title: Text(
          'Notification Panel',
          style: GoogleFonts.poppins(
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.w600,
              fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 160,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //SizedBox(width: 40,),
                        Customcircleavatar(
                            index: 0,
                            CircleIcon: Icons.home,
                            text1: 'Wi-fi',
                            text2: 'off',
                            lastIcon: Icons.arrow_drop_down,
                          ),
                        Customcircleavatar(
                             index:1,
                            CircleIcon: Icons.signal_cellular_alt,
                            text1: 'Telenor',
                            text2: '4G',
                            lastIcon: Icons.arrow_drop_down,
                        ),
                        Customcircleavatar(index: 2,
                            CircleIcon: Icons.bluetooth,
                            text1: 'Buetooth',
                            text2: 'off',
                            lastIcon: Icons.arrow_drop_down)

                      ],
                    ),
                  ),
                ),
                Container(
                 width: 160,height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Customvoicecontainer(
                          ConIcon: Icons.light_mode_sharp,
                      ),
                      Customvoicecontainer(
                          ConIcon: Icons.volume_up,)
                    ],
                  ),
                ),
              ],
            ),
          ),
          //Todo 2nd container yaha per banan raha ho.
          Padding(padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
          child: Container(
            width: 380,height: 400,
            decoration: BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Obx(() {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                    itemCount: ContainerList.length,
                    itemBuilder: (context,index){
                      final item = ContainerList[index];
                      final isOn = controller.ContainerState[index];
                      return InkWell(
                        onTap: (){
                          controller.ContainerState[index] = !isOn;
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 50,height: 50,
                              decoration: BoxDecoration(
                                color: isOn? Colors.green : Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Icon(item.ContIcon,color: isOn ? Colors.white : Colors.black,),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(item.text)
                          ],
                        ),
                        
                      );
                    }
                );
              })
            ),

          ),
          )
        ],
      ),
    );
  }
}
