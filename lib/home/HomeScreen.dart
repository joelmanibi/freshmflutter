import 'package:flutter/material.dart';
import '/api_connection/api_connection.dart';
import '/model/produit_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 late Future<List<Produit>> futureProduit;

  @override
  void initState() {
    super.initState();
    futureProduit = fetchProduit();
  }

  double xOffset=0;
  double yOffset=0;
  double scaleFactor =1;
  bool isDrawerOpen =false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      
      decoration: BoxDecoration(
          
          color: Color(0XFFFCFBFB),
          borderRadius: BorderRadius.circular(isDrawerOpen?40:0.0)

      ),
  
      child:SingleChildScrollView(

              child: Column(
              children: [
              SizedBox(
                height: 50,
              ),

          Container(
            decoration: BoxDecoration(
            color: Color(0XFFFCFBFB),
            borderRadius: BorderRadius.circular(isDrawerOpen?40:0.0)),

            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isDrawerOpen? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: (){
                    setState(() {
                      xOffset=0;
                      yOffset=0;
                      scaleFactor=1;
                      isDrawerOpen=false;
                    });
                  },
                ):
                IconButton(onPressed: (){
                  
                  setState(() {
                    xOffset=230;
                    yOffset=150;
                    scaleFactor=0.6;
                    isDrawerOpen = true;
                  });

                },
                  icon: Icon(Icons.menu) 
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

           Container(
            child:Text('VOS PRODUITS',
            textAlign: TextAlign.center,
            style:TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              
              
            ),
            )
          ),
        
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          //   margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(20)
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Icon(Icons.search),
          //       Text('recherche des mes produits'),
          //       Icon(Icons.settings)
          //     ],
          //   ),
          // ),
          // Container(
            
          //   child:Text('LA LISTE DE VOS PRODUITS',
          //   textAlign: TextAlign.center,
          //   style:TextStyle(
          //     fontSize: 25.0,
          //     fontWeight: FontWeight.bold,
              
          //   ),
          //   )
          // ),
          // Container(
          //   height: 120,
            
          //   // child: ListView.builder(
          //   //   scrollDirection: Axis.horizontal,
          //   //   itemCount: categories.length,
          //   //   itemBuilder:(context,index){
          //   //     return Container(
          //   //       child: Column(
          //   //         children: [
          //   //           Container(
          //   //             height: 70,
          //   //             width: 70,
                        
          //   //             padding: EdgeInsets.all(10),
          //   //             margin: EdgeInsets.only(left: 20),
          //   //             decoration: BoxDecoration(
          //   //               color: Colors.white,
          //   //               boxShadow: shadowList,
          //   //               borderRadius: BorderRadius.circular(5)
          //   //             ),
          //   //             child: Image.asset(categories[index]['iconPath']),
          //   //           ),
          //   //           Text(categories[index]['name'])
          //   //         ],
          //   //       ),
          //   //     );
          //   //   }),
          // ),
          

           Container(
            //  height: MediaQuery.of(context).size.height,
            
              decoration: BoxDecoration(
              color: Color(0XFFF3C7BD),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
              ),
              height: 370,
              width: 400,
              child: FutureBuilder<List<Produit>>(
                future: futureProduit,
                builder: (context, snapshot){
                  if (snapshot.hasData){
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                        child: Container(

                        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            
                            SizedBox(height: 20),
                            Image.network("https://res.cloudinary.com/joelmani12/${snapshot.data![index].image}",width: 280,height: 150,),
                            Text(
                              "${snapshot.data![index].nom} de ${snapshot.data![index].lieu}",
                              
                              textAlign: TextAlign.center,
                              style:TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            Text(
                              "${snapshot.data![index].prix} FCFA/Kg",
                              
                              textAlign: TextAlign.center,
                              style:TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal,
                                
                              ),
                            ),

                            Text(
                              "${snapshot.data![index].description}",
                              
                              textAlign: TextAlign.center,
                              style:TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w200,
                                
                              ),
                            ),  

                              ],
                            ),
                          ),
                          )
                    )
                  );
                }else {
              return Center(child: CircularProgressIndicator());
              }
               
            }),
          ),

          Container(
            //  height: MediaQuery.of(context).size.height,
            
              decoration: BoxDecoration(
              color: Color(0XFFF3C7BD),
              ),
              height: 105,
              width: 500,
              child: Row(

                  children: [
                    Container(
                      height: 140,
                      width: 140,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      padding: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                      color: Color(0XFF61956B ),
                      borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: SingleChildScrollView(
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          
                            Icon(FontAwesomeIcons.shoppingBasket,color: Colors.white,size: 30,),
                            Text("Commandes",textAlign: TextAlign.center,style:TextStyle(color:Colors.white,fontSize: 15.0,fontWeight: FontWeight.bold),),

                            ],
                          ),

                            
                          ),
                          ),

                          Container(
                            height: 140,
                            width: 140,
                            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                            padding: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                            color: Color(0XFF61956B ),
                            borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: SingleChildScrollView(
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                Icon(FontAwesomeIcons.plus,color: Colors.white,size: 30),
                                  Text("ajouter",textAlign: TextAlign.center,style:TextStyle(color:Colors.white,fontSize: 15.0,fontWeight: FontWeight.bold),),

                                  ],
                            ),
                            ),
                          ),

                        ]
                ),
                
          ),
          Container(
            //  height: MediaQuery.of(context).size.height,
            
              decoration: BoxDecoration(
              color: Color(0XFFF3C7BD),
              ),
              height: 105,
              width: 500,
              child: Row(

                  children: [
                    Container(
                      height: 140,
                      width: 140,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      padding: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                      color: Color(0XFF61956B ),
                      borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: SingleChildScrollView(
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          
                            Icon(Icons.favorite,color: Colors.red,size: 30,),
                            Text("Favoris",textAlign: TextAlign.center,style:TextStyle(color:Colors.white,fontSize: 15.0,fontWeight: FontWeight.bold),),

                            ],
                          ),

                            
                          ),
                          ),

                          

                          Container(
                            height: 140,
                            width: 140,
                            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                            padding: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                            color: Color(0XFF61956B ),
                            borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: SingleChildScrollView(
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                
                                  Icon(Icons.person,color: Colors.white,size: 30,),
                                  Text("Compte",textAlign: TextAlign.center,style:TextStyle(color:Colors.white,fontSize: 15.0,fontWeight: FontWeight.bold),),

                                  ],
                            ),
                            ),
                          ),

                        ]
                ),
                
          ),

          Container(
            height: 24,
            width: 400,
            decoration: BoxDecoration(
              color: Color(0XFFF3C7BD),
            ),
            child: Text(''),
          ),
          
          Container(
            height: 24,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            child: Text('©2021 - FreshMaraicher | by JOEL_MANI',textAlign: TextAlign.center,style:TextStyle(color:Colors.white,fontSize: 15.0,fontWeight: FontWeight.bold),),
          )
            ],
                  ),

                  )

                );
  }

}