import 'package:flutter/material.dart';
import '/AJOUT_PRODUIT/AjoutProduit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/bloc/authentication_bloc.dart';

class DrawerScreen extends StatefulWidget {
  DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:50,bottom: 70,left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/ok.jpg'),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Joel Mani',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  Text('Active Status',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),

          

          Column(
            children:[

              GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProduitScreen()));

              },

              child:Container(
                
                child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.plus,color: Colors.white,size: 30,),
                    SizedBox(width: 10,),
                    Text('Ajouter produit',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))
                  ],

                ),
                ),
              )),

              GestureDetector(
              onTap: (){

              },

              child:Container(
                
                child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.shoppingBasket,color: Colors.white,size: 30,),
                    SizedBox(width: 10,),
                    Text('Commandes',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))
                  ],

                ),
                ),
              )),

              GestureDetector(
              onTap: (){

              },

              child:Container(
                child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.favorite,color: Colors.white,size: 30,),
                    SizedBox(width: 10,),
                    Text('Plus commandé',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))
                  ],

                ),
                ),
              )),

              GestureDetector(
              onTap: (){

              },

              child:Container(
                child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.userAlt,color: Colors.white,size: 30,),
                    SizedBox(width: 10,),
                    Text('Mon compte',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))
                  ],

                ),
                ),
              ))
            ]

          

          ),

          Row(
            children: [

              Column(
                children: [
                  Icon(Icons.settings,color: Colors.white,),
                ],
                
              ),

              Column(
                children: [
                  SizedBox(width: 10,),
                  Text('Settings',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ],
                
              ),

              Column(
                children: [
                  SizedBox(width: 30,),
                  Container(width: 2,height: 20,color: Colors.white,),
                ],
                
              ),
              
              GestureDetector(
              onTap: (){
                  BlocProvider.of<AuthenticationBloc>(context)
                  .add(LoggedOut());
                
              },
              child:
              Column(
                children: [
                  SizedBox(width: 30,),
                  Text('Log out',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                ],
                
              )),

              

              


            ],

          )


        ],
      ),

    );
  }
}