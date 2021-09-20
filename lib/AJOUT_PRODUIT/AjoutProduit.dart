import 'dart:convert';
import 'dart:io' as Io;
// import 'package:freshm/model/agent_model.dart';
import 'package:freshm/model/user_model.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/model/produit_model.dart';
// import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;

class AddProduitScreen extends StatefulWidget {
  @override
  _AddProduitScreenState createState() => _AddProduitScreenState();
}

class _AddProduitScreenState extends State<AddProduitScreen> {
  final TextEditingController _produitNomController = TextEditingController();
  final TextEditingController _produitprixController = TextEditingController();
  final TextEditingController _produitdescriptionController = TextEditingController();
  final TextEditingController _produitlieuController = TextEditingController();
  Io.File? image;
  Future<Produit>? _futureProduit;

  
  Future<User>get id{
    return id;
  }

  // Future<User>? f;
  

///////////////La fonction qui permet d'envoyer les donnees du formulaire vers mon dans l'api
  addProduct(String nom, prix, description, lieu, image,agent) async {
    // ignore: deprecated_member_use
    var stream= new http.ByteStream(DelegatingStream.typed(image.openRead()));
    var length= await image.length();
    var uri = Uri.parse("https://freshm.herokuapp.com/api/list-produit");

/////definis le header de l'api
    Map<String, String> headers = {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Token 8647f6408ad97d8180d1574447fc9492b34cf561',
        };
//// definir une variable request qui vas permet d'envoyer plusieur requet a la fois grace a Multipartrequest
    var request = new http.MultipartRequest("POST", uri);

    var multipartFile = new http.MultipartFile("image_produit", stream, length, filename: basename(image.path));


    request.headers.addAll(headers);
    request.fields['Nom'] = nom;
    request.fields['prix'] = prix;
    request.fields['description'] = description;
    request.fields['lieu'] = lieu;
    request.fields['agent'] = agent;
    request.files.add(multipartFile);

    var response = await request.send();
    if(response.statusCode==200){
      response.stream.transform(utf8.decoder).listen((value){
        print(value);
      });
    }else{
      print("Upload Failed");
    }

    }
  
  ////////////////////// Capture a photo///////////////////////
  
  Future pickImage() async{
  try{
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final imageTemporary = Io.File(image.path);
    setState(() => this.image = imageTemporary);
  } on PlatformException catch (e){
    print('Failed to $e');
  }
  

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFCFBFB),
      body: ListView(
        children: [
          SizedBox(
                      height: 10,
                    ),
          Container(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                IconButton(onPressed: (){
                  
                  Navigator.of(context).pop();

                },
                  icon: Icon(Icons.backspace_rounded, color: Colors.pink,) 
                  ),

                  Column(
                    children: [
                      Image.asset('assets/logo2.png',height: 40,width: 100)

                    ],
                  ),

                CircleAvatar(
                      radius:20.0,
                      backgroundImage: AssetImage('assets/ok.jpg'),
                    )
              ],
            ),
          ),

                    SizedBox(
                      height: 10,
                    ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child:Text('AJOUTER UN PRODUIT',
            textAlign: TextAlign.center,
            style:TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              
              
            ),
            )
          ),
          Container(
              child:(_futureProduit == null)
              ? Column(
                
              children: [

              SizedBox(
                      height: 20,
                    ),

              image != null?
              
                Image.file(
                  image!,
                  width: 170,
                  height: 190,
                )
              : 
              GestureDetector(
                onTap: ()=>pickImage(),
                child: Container(
                
                        decoration: BoxDecoration(
                            color: Colors.red[200]),
                        width: 200,
                        height: 200,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
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
                        fillColor: Color(0XFFF7E2D7 ),
                        hintText: "Type de produit",
                        // prefixIcon: Icon(
                        //   Icons.person,
                        //   color: Color(0XFF14271C),
                        // )
                      ),
                      controller: _produitNomController,
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
                        fillColor: Color(0XFFF7E2D7),
                        hintText: "Prix au kg",
                        // prefixIcon: Icon(
                        //   Icons.person,
                        //   color: Color(0XFF14271C),
                        // )
                      ),
                      controller: _produitprixController,
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
                        fillColor: Color(0XFFF7E2D7 ),
                        hintText: "description du produit",
                        // prefixIcon: Icon(
                        //   Icons.person,
                        //   color: Color(0XFF14271C),
                        // )
                      ),
                      controller: _produitdescriptionController,
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
                        fillColor: Color(0XFFF7E2D7 ),
                        hintText: "Localisation du produit",
                        // prefixIcon: Icon(
                        //   Icons.person,
                        //   color: Color(0XFF14271C),
                        // )
                      ),
                      controller: _produitlieuController,
                    ),

              SizedBox(
                      height: 20,
                    ),

              


              // ElevatedButton(
                

              //   child: Text('Photo'),
              //   style: ElevatedButton.styleFrom(
              //       primary: Colors.orangeAccent,
              //       shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(25),
              //             ),
              //       padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              //       textStyle: TextStyle(
              //       fontSize: 15,
              //       fontWeight: FontWeight.bold)),
                
              //   ),

              SizedBox(
                      height: 10,
                    ),

              ElevatedButton(
                  child: Text('    AJOUTER LE PRODUIT    '),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink,
                    shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
                  onPressed: () {
                        setState(() {
                          addProduct(_produitNomController.text,
                           _produitprixController.text,
                            _produitdescriptionController.text,
                             _produitlieuController.text,
                              image,
                              '1');
                              Navigator.of(context).pop();
                        });
                  }),

              // ElevatedButton(
              //     child: Text('AJOUTER'),
              //     onPressed: () {
              //           setState(() {
              //             _futureProduit = createProduit(
              //               _produitNomController.text,
              //             _produitprixController.text,
              //             _produitdescriptionController.text,
              //             _produitlieuController.text,
              //             image!,
              //             _produitslugController.text
              //             );
              //           });
              //     })
                  ]
          ) 
          :FutureBuilder<Produit>(
                  future: _futureProduit,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data!.nom!);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    return CircularProgressIndicator();
                  },
                ),
          )  
        ],
      ),
    );
  }

}

