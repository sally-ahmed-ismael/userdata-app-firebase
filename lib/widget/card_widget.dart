import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardWidget extends StatelessWidget {
 CardWidget({super.key , required this.name, required this.phone, required this.onTap});
  String name;
  String phone;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return  Card(
            color: Colors.white,
            child: ListTile(
              title: Text(name, style: TextStyle(fontSize: 15),),
              subtitle: Text(phone), 
              trailing: InkWell(
                onTap: onTap,
                child: Icon(Icons.delete, color: Colors.red,)),),
            );
  }
}