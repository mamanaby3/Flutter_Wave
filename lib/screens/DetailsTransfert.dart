import 'package:flutter/material.dart';

class DetailsTransfert extends StatefulWidget {
  const DetailsTransfert({Key? key}) : super(key: key);

  @override
  _DetailsTransfertState createState() => _DetailsTransfertState();
}

class _DetailsTransfertState extends State<DetailsTransfert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Envoyer de l'argent"),
        centerTitle: true,
      ),
      
      body: SingleChildScrollView(


          child:Column(
            crossAxisAlignment:CrossAxisAlignment.start,

            children: [
              // appBar:
              Padding(
                padding: const EdgeInsets.symmetric(vertical:8.0,horizontal:16),
                child:TextField(
                  decoration: InputDecoration(
                      labelText: 'A'
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.all(16),
                child:const Column(
                  //crossAxisAlignment:CrossAxisAlignment.start,
                  children:[
                    Text("Favoris",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),

                    // Text("Favoris"),
                  ],
                ),

              ),
              Container(
                margin: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children:[
                    const Text("Contacts",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: 50,
                      itemBuilder: (context,index ){
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical:8.0,horizontal:12) ,
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color:Colors.grey.withOpacity(0.2),borderRadius: BorderRadius.circular(25),
                                ),
                                padding: const EdgeInsets.all(5) ,
                                child:Icon(Icons.person,size: 30,),


                              ),

                              Column(
                                  children:[
                                    Text("   Modou Fall") ,
                                    Text("   77777777") ,
                                  ]

                              )


                            ],
                          ),
                        );

                      },
                      // Text("Favoris"),
                    )
                  ],
                ),

              )
            ],

          )

      ),
    );
  }
}
