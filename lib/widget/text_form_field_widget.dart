import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
   String text;
   IconData icon;
   TextEditingController textEditingController = TextEditingController();

   TextFormFieldWidget({super.key, 
   required this.text,required this.textEditingController, required this.icon });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
              style: TextStyle(color: Colors.white),
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: text,
                suffixIcon: Icon(icon, color: Colors.white,),
                hintStyle: TextStyle(fontSize: 20),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2, color: Colors.white ),
                
              ),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Colors.white)),
             ), 
          
          )
    );
  }
}