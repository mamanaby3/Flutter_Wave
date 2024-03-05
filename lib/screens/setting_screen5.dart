
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SettingScreen5 extends StatefulWidget {
  const SettingScreen5({Key? key}) : super(key: key);

  @override
  State<SettingScreen5> createState() => _SettingScreen5State();
}

class _SettingScreen5State  extends State<SettingScreen5>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: const TextSpan(
                  text: 'Plafonds du Compte',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
    body: Container(
          height: 1200,
          child: ListView(
          children: [
            _buildSection('Plafonds actuels', [
            _buildListTileWithoutIcon(
            //icon: Icons.ios_share,
            title: 'Solde  maximum '
                 'de votre compte',
              price: '2.000.000F' ,

            ),
            _buildListTileWithoutIcon(
            //icon: Icons.card_giftcard,

            title: 'Cumul mensuel maximum',
              price: '10.000.000F ',

            ),
            ]),
          ],
    ),
    ),
    );
          }


  Widget _buildSection(String title, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            child: RichText(
              text: TextSpan(
                text: title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(height: 2),
          ...children,
        ],
      ),
    );
  }

  Widget _buildListTileWithoutIcon({
   required String price,
    required String title,

  }) {
    return InkWell(

      child: ListTile(
      //  leading: Icon(icon),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),

        ),

      ),
    );
  }

}