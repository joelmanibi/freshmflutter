import 'package:flutter/material.dart';

class MENU extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(

      backgroundColor: Color(0XFFABEBC6),

      appBar: AppBar(
        backgroundColor: Color(0XFF21804A),
        title: Text('MENU AGENT'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              Text("MENU AGENT",
              style:TextStyle(color:Color(0XFF04150B),
              fontSize:20.0,
              fontWeight: FontWeight.w500,
              ),
              ),

            SizedBox(
              height: 80,
            ),

            ElevatedButton(
              onPressed: (){},
              child: Text('AJOUTER PRODUIT'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
              
             ),

            SizedBox(
              height: 10,
            ),
 
            ElevatedButton(
              onPressed: (){},
              child: Text('LISTE DE PRODUIT'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
                  
             ),

            SizedBox(
              height: 10,
            ),

            ElevatedButton(
              onPressed: (){},
              child: Text('LISTE DE PRODUIT'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
                  
             ),

            SizedBox(
              height: 10,
            ),


            ElevatedButton(
              onPressed: (){},
              child: Text('COMPTE AGENT'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
              
             ),

            

              ]
            


          ),),
      )

    );

  }
}