import 'package:final_project_tourism/HomePage/home.dart';
import 'package:flutter/material.dart';

class OpenPage extends StatefulWidget {
  const OpenPage({super.key});

  @override
  State<OpenPage> createState() => _OpenPageState();
}

class _OpenPageState extends State<OpenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/AbcdApp.jpg',
          height: 380,
          fit: BoxFit.fill,
         ),
         const SizedBox(height: 10,),
         const Padding(
           padding: EdgeInsets.only(left: 20),
           child: Text('Explore The Beauty',
           style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold
           ),),
         ),

         const SizedBox(height: 5,),
         const Padding(
           padding: EdgeInsets.only(left: 20),
           child: Text('Of The World With Us',
           style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold
           ),),
         ),
const SizedBox(height: 20,),
         const Padding(
           padding: EdgeInsets.only(left: 20),
           child: Text('Wild Heart Adveture are ready to help you',
           style: TextStyle(
            color: Colors.grey
           ),),
         ),
          const Padding(
           padding: EdgeInsets.only(left: 20),
           child: Text('on Your Vaction Around Pakistan',
           style: TextStyle(
            color: Colors.grey
           ),),
         ),
         const SizedBox(height: 40,),
         Container(
          width: 450,
          height: 50,
          padding: const EdgeInsets.only(left: 20, ),
           child: ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>
            const HomePage()));
           },
           style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,   
           ),
            child: const Text('Let\'s Plan Your Vacation',
            
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),)),
         )
        ],
      ),
    );
  }
}