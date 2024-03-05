import 'package:cours_flutter/models/option.dart';
import 'package:cours_flutter/models/transaction.dart';
import 'package:cours_flutter/screens/TransactionDetailsScreen.dart';

import 'package:cours_flutter/screens/scan_screen.dart';
import 'package:cours_flutter/screens/setting_screen.dart';
import 'package:cours_flutter/utils/constants.dart';
import 'package:cours_flutter/widget/card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

import 'package:cours_flutter/screens/Paiement_screen.dart';

import 'DetailsTransfert.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isVisible = true;


  @override
  Widget build(BuildContext context) {
    List<Option> optionList = [
      Option(
          text: "Transfert", color: Colors.deepPurpleAccent, icon: Icons.person,
          onPressed:(){}),
      Option(
          text: "Paiiements", color: Colors.orangeAccent, icon: Icons.shopping_cart ,

          onPressed: () {
            print("Paiements option pressed");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingScreen()),
            );
          },


      ),
      Option(
          text: "Crédit", color: Colors.blue, icon: Icons.phone_android,
          onPressed:(){}),
      Option(
          text: "Banque", color: Colors.redAccent, icon: Icons.account_balance_rounded,
          onPressed:(){}),
      Option(
          text: "Cadeaux", color: Colors.green, icon: Icons.card_giftcard,
          onPressed:(){}),
    ];
    List<Transaction> transactionList=[
      Transaction("Modou", "771234567", 10000, DateTime.now(), true),
      Transaction("Mbaye", "777777777", 50000, DateTime.now(), false),
      Transaction("Baye", "771234567", 10000, DateTime.now(), true),
      Transaction("Saliou", "777777777", 50000, DateTime.now(), false),
    ];

    return Scaffold(

      backgroundColor: primaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: primaryColor,
            leading: IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SettingScreen();
                },
                )
                );
              },
            ),
            pinned: true,
            expandedHeight: 90,
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  isVisible
                      ? RichText(
                          text: const TextSpan(
                              text: '5.000',
                              children: [
                                TextSpan(
                                    text: 'F',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400))
                              ],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w400)),
                        )
                      : const Text(
                          '•••••••',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w400),
                        ),
                  const SizedBox(
                    width: 10,
                  ),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: Icon(
                      isVisible
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ],
              ),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
              child: Stack(
                children: [
                Container(
                height: 1000,
                color: primaryColor,
              ),
                  // Conteneur blanc avec le bord arrondi
              Container(
                height: 1000,
                margin: const EdgeInsets.only(top: 100),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
              ),
              Column(
                children: [
                  // Widget personnalisé pour afficher la carte qu'on a interer
                  CardWidget(),
                  // GridView pour afficher les options qu'on avait fixer
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: optionList.length,

                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (context) =>

                                [DetailsTransfert() ,
                                  ParametreScreen(),
                                Scaffold(appBar: AppBar(title: Text('credit') )),
                                Scaffold(appBar: AppBar(title: Text('banque') )),
                                Scaffold(appBar: AppBar(title: Text('cadeaux') )),
                                ][index],

                              ),
                            );

                          },

                      child: optionWidget(
                          icon: optionList[index].icon,
                          color: optionList[index].color,
                          text: optionList[index].text),
                      ) ;
                      },

                  ),
                  // Séparateur entre la liste de transaction et les options de wave
                  Divider(
                    thickness: 7,
                    color: Colors.grey.withOpacity(.3),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      Transaction transact = transactionList[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TransactionDetailsScreen(transaction: transact),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${transact.isRetrait ? 'À' : 'De'} ${transact.name} ${transact.phoneNumber}", style: TextStyle(color: Colors.blue[900], fontSize: 16, fontWeight: FontWeight.w500)),
                                  Text("${transact.isRetrait ? '-' : ''} ${transact.price}F", style: TextStyle(color:  primaryColor , fontSize: 16, fontWeight: FontWeight.w500)),
                                ],
                              ),

                              Text(transact.dateTime.toString(), style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 5);
                    },
                    itemCount: transactionList.length,
                  )

                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  optionWidget(
      {required IconData icon, required Color color, required String text}) {
    return Column(
      children: [

        Container(
          decoration: BoxDecoration(
              color: color.withOpacity(0.3),
              borderRadius: BorderRadius.circular(45)),
          padding: const EdgeInsets.all(8),
          child: Icon(
            icon,
            color: color,
            size: 40,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 14),
        )
      ],
    );
  }

}
