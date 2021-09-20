import 'package:flutter/material.dart';

import 'dashboardAgent.dart';

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(

      backgroundColor: Color(0XFFABEBC6),

      appBar: AppBar(
        backgroundColor: Color(0XFF21804A),
        title: Text('FreshMaicher-Login'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              Text("Connexion",
              style:TextStyle(color:Color(0XFF04150B),
              fontSize:20.0,
              fontWeight: FontWeight.w500,
              ),
              ),

            SizedBox(
              height: 15,
            ),

            CircleAvatar(
            radius:70.0,
            backgroundImage: AssetImage('assets/a.jpg'),
              ),

            SizedBox(
              height: 10,
            ),

            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Color(0XFF3DA168 ),
                hintText: "NOM D'UTILISATEUR",
                prefixIcon: Icon(
                  Icons.person,
                  color: Color(0XFF14271C),
                )
              ),
            ),
            SizedBox(
              height: 10,
            ),

            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Color(0XFF3DA168 ),
                hintText: "MOT DE PASSE",
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0XFF14271C),
                )
              ),
            ),

            SizedBox(
              height: 10,
            ),

            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MENU()),
                );
              },
              child: Text('Connexion'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
              
             )  
              ]
            


          ),),
      )

    );

  }
}