import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '/model/api_model.dart';
import '/model/user_model.dart';
import '/model/produit_model.dart';

final _base = "https://freshm.herokuapp.com";
final _tokenEndpoint = "/api-token-auth/";
final _tokenURL = _base + _tokenEndpoint;

Future<Token> getToken(UserLogin userLogin) async {
  print(_tokenURL);
  final http.Response response = await http.post(
    Uri.parse(_tokenURL),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userLogin.toDatabaseJson()),
  );
  if (response.statusCode == 200) {
    return Token.fromJson(json.decode(response.body));
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

class UserProvider with ChangeNotifier{
  UserProvider() {
    this.fetchTasks();


  }
  List<User>_users =[];
  List<User>get users{
    return[..._users];
  }

fetchTasks() async{
    final url ='https://freshm.herokuapp.com/api/user/?format=json';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _users = data.map<User>((json) => User.fromJson(json)).toList();
      notifyListeners();

  }}

}



Future<List<Produit>> fetchProduit() async {
  final response =
      await http.get(Uri.parse('https://freshm.herokuapp.com/api/list-produit'),
      headers: <String, String>{
        
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token 8647f6408ad97d8180d1574447fc9492b34cf561' ,
      
      },
      );

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Produit>((json) => Produit.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}
// }

// Future<Produit> createProduit(String nom, prix, description, lieu, File image, slug) async {
  
//   final http.Response response = await http.post(
//     Uri.parse('https://freshm.herokuapp.com/api/list'),
//     headers: <String, String>{

//       'Content-Type': 'application/json; charset=UTF-8',
//       'Authorization': 'Token 8647f6408ad97d8180d1574447fc9492b34cf561' ,

//     },
//     body: jsonEncode({
      
//       'Nom': nom,
//       'prix': prix,
//       'description' : description,
//       'lieu' : lieu,
//       'image_produit' : image,
//       'slug' : slug,
//     }),
//   );

//   if (response.statusCode == 201) {
//     return Produit.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Impossible de cree un Produit');
//   }
// }


// // class ProduitProvider with ChangeNotifier{
  
// //   List<Produit>_produits =[];
// //   List<Produit>get produits{
// //     return[..._produits];
// //   }

// // void addProduit(Produit produit) async {
// //     final response = await http.get(Uri.parse('https://freshm.herokuapp.com/api/list?format=json'),
// //         headers: {
// //           'Content-Type': 'application/json; charset=UTF-8',
// //           'Authorization': 'Token 8647f6408ad97d8180d1574447fc9492b34cf561',
// //         },
// //         body: json.encode(produit));
// //     if (response.statusCode == 201) {
// //       produit.id = json.decode(response.body)['id'];
// //       _produits.add(produit);
// //       notifyListeners();
// //     }
// //  } }

//   Future<Produit> fetchProduit() async {
//   final response = await http
//       .get(Uri.parse('https://freshm.herokuapp.com/api/list?format=json'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Produit.fromJson(jsonDecode(response.body)['id']);
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }




