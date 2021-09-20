import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
Color primaryGreen = Color(0XFF416d6d);

List<BoxShadow>shadowList = [
  BoxShadow(color: Color(0XFF9AC8EA), blurRadius:30,offset: Offset(0,10))
];

List<Map> categories = [
  {'name':'Légum','iconPath':'assets/a.jpg'},
  {'name':'Légum','iconPath':'assets/a.jpg'},
  {'name':'Léeuses','iconPath':'assets/a.jpg'},
  {'name':'Légum','iconPath':'assets/a.jpg'},
  {'name':'Légum','iconPath':'assets/a.jpg'},
  {'name':'Léeuses','iconPath':'assets/a.jpg'},
];

List<Map> drawerItems=[
  
  {
    'icon': FontAwesomeIcons.plus,
    'title' : 'Ajouter produit'
    
  },
  
  {
    'icon': FontAwesomeIcons.shoppingBasket,
    'title' : 'Commandes'
  },
  {
    'icon': Icons.favorite,
    'title' : 'Plus Commandé'
  },
  {
    'icon': FontAwesomeIcons.userAlt,
    'title' : 'Mon Compte'
  },
];