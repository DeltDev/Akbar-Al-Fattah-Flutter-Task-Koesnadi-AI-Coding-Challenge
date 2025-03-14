import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:koesnadi_ai_coding_challenge/service/database.dart';
import 'package:random_string/random_string.dart';

class Food extends StatefulWidget{
  const Food ({super.key});
  @override
  State<Food> createState() => FoodState();
}

class FoodState extends State<Food>{
  TextEditingController foodnamecontroller = new TextEditingController();
  TextEditingController pricecontroller = new TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Food",
              style: TextStyle(
                  color: Colors.teal,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),),
            Text(
              "Form",
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),
            )
          ],),),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama Makanan", style: TextStyle(
              color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 10.0,),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: foodnamecontroller,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 20.0,),
            Text("Harga (dalam dollar)", style: TextStyle(
                color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 10.0,),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: pricecontroller,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 30.0,),
            Center(
                child: ElevatedButton(
                    onPressed: ()async{
                      String Id = randomAlphaNumeric(12);
                      Map<String, dynamic> foodInfoMap={
                        "ID":Id,
                        "FoodName": foodnamecontroller.text,
                        "Price":pricecontroller.text
                      };
                      await DatabaseMethods().addFoodDetails(foodInfoMap, Id).then((value){
                        Fluttertoast.showToast(
                            msg: "Food Details has been uploaded succesfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      });
                    },
                    child: Text(
                        "Tambahkan makanan",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold)))
            )

          ],
        ),
      ),
    );
  }
}