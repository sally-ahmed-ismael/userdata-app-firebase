import 'package:flutter/material.dart';

class MaterialButtonWidget extends StatelessWidget {
 MaterialButtonWidget({super.key, required this.onPressed});
  void Function()? onPressed;//callback function --fn. in a place & calling in another
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
            onPressed: onPressed,
            // textColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            color: Color.fromARGB(255, 137, 138, 230),
            child: Text("ADD" , style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          );
  }
}