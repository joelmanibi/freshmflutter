
import 'dart:convert';
import 'dart:io';



// class Produit {
//   int? id;
//   final String? nom;
//   final int? prix;
//   final String? description;
//   final String? lieu;
//   File?image;

//   // ignore: non_constant_identifier_names
//   Produit({this.id, this.nom, this.prix, this.description, this.lieu,this.image});

//   factory Produit.fromJson(Map<String, dynamic> json) {
//     return Produit(
//         id: json['id'], 
//         nom: json['Nom'], 
//         prix:json['prix'], 
//         description: json['description'],
//         lieu: json['lieu'] ,
//         image:json['image_produit'] );
//   }
//   dynamic toJson() => {
//   'id': id, 
//   'Nom': nom, 
//   'prix': prix,
//   'description':description,
//   'lieu':lieu,
//   'image_produit':image,
//   };
// }

List<Produit> postFromJson(String str) =>
    List<Produit>.from(json.decode(str).map((x) => Produit.fromMap(x)));

class Produit {
  Produit({this.id, this.nom, this.prix, this.description, this.lieu,this.image,this.agent
  });

  int? id;
  final String? nom;
  final int? prix;
  final String? description;
  final String? lieu;
  final String?image;
  final int? agent;

  factory Produit.fromMap(Map<String, dynamic> json) => Produit(
        id: json['id'], 
        nom: json['Nom'], 
        prix:json['prix'], 
        description: json['description'],
        lieu: json['lieu'] ,
        image:json['image_produit'] );
      
}