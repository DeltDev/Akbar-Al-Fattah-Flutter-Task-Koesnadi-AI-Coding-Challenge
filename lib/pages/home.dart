import 'package:flutter/material.dart';
import 'package:koesnadi_ai_coding_challenge/pages/food.dart';

class Home extends StatefulWidget{

  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Food()));
      }, child: Icon(Icons.add),backgroundColor: Colors.tealAccent,),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Soup",
              style: TextStyle(
                  color: Colors.teal,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),),
            Text(
              "Way",
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),
        )
      ],),),
      body: Container(
        child: Column(children: [

        ],
        ),
      )
    );
  }
}