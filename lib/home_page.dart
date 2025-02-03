import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_base_project/widget/card_widget.dart';
import 'package:fire_base_project/widget/material_button_widget.dart';
import 'package:fire_base_project/widget/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // getData();
    super.initState();
  }
  
  var nameUser = TextEditingController();

  var phoneUser = TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection("users");

  Stream <QuerySnapshot> streamUser = 
    FirebaseFirestore.instance.collection("users").snapshots();

  // List <QueryDocumentSnapshot> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(height: 50),
        backgroundColor: Color(0xff121212),
      ),
      backgroundColor: Color(0xff121212),
      body:
       Column(
        children: [
          TextFormFieldWidget(text: "enter user name", textEditingController: nameUser, icon: Icons.person),
          TextFormFieldWidget(text: "enter user phone", textEditingController: phoneUser, icon: Icons.phone,),
          MaterialButtonWidget(onPressed: (){
            saveDataUser();
            // showLoading();
          }),
          // CardWidget(name: "sally", phone: "010203040"),
          StreamBuilder<QuerySnapshot>(
            stream: streamUser,
            builder: (context, snapshot) {
              if(snapshot.hasError){
                return Text("error", style: TextStyle(fontSize: 30, color: Colors.white),);
              }
              if(snapshot.connectionState == ConnectionState.waiting){
                // return Text("waiting", style: TextStyle(fontSize: 30, color: Colors.white),);
                   return CircularProgressIndicator(color: Colors.white,) ;
              }
              var data = snapshot.data?.docs ?? [];
              return Expanded(
               
                  child: ListView.builder(
                    itemBuilder: (context, index)=>
                     CardWidget(name: data[index]['name'], phone: data[index]['phone'], 
                          onTap: ()async{
                               await deleteUser(data[index].id);
                             },
                            ),
                     itemCount: data.length,
                     ),
                );
            }
          ),
          
        
         

        ]
      ),
    );

  }

  void saveDataUser() async{
     showLoading() ;
      await users.add({
        "name": nameUser.text,
        "phone": phoneUser.text
      }).then((value){ 
        Navigator.of(context).pop();
        nameUser.clear();
        phoneUser.clear();
      })
      .catchError((error)=> print("failed!!! $error"));
      
      
  }

  Future<void> deleteUser(String id) async{
   showLoading() ;
   await users.doc(id).delete().then((value) => Navigator.of(context).pop())
    .catchError((error)=> print("failed!!! $error"));
    
  }

  void showLoading(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 10),
            Text("Loading" , style: TextStyle(fontSize: 20, color: Colors.white),)
          ],
        ),
      );
    });
  }

  // void getData()async{
  //   QuerySnapshot querySnapShot =  await users.get();
  //   data.addAll(querySnapShot.docs);
  //   setState(() { });
  // }
}