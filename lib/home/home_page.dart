import 'package:flutter/material.dart';

import 'package:freshm/drawerScreen.dart/drawScreen.dart';
import 'package:freshm/home/HomeScreen.dart';
// // import '/api_connection/api_connection.dart';
// import '/bloc/authentication_bloc.dart';
// import '/AJOUT_PRODUIT/AjoutProduit.dart';
// import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      
        body: Stack(
          children: [
            DrawerScreen(),
            HomeScreen(),

            
          ],
        ) 
     
    );
  }
}