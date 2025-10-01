import 'package:classico/Controllers/AndroidHomeUiController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Customvoicecontainer extends StatefulWidget {
  final IconData ConIcon;
  Customvoicecontainer({super.key, required this.ConIcon,});

  @override
  State<Customvoicecontainer> createState() => _CustomvoicecontainerState();
}

class _CustomvoicecontainerState extends State<Customvoicecontainer> {
  @override
  Widget build(BuildContext context) {

    return  Container(
            width: 50,height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[100]
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 115),
                child: Icon(widget.ConIcon),),

        );
  }
}
