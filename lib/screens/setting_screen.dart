import 'package:cours_flutter/screens/setting_screen5.dart';
import 'package:flutter/material.dart';

import '../models/Footer.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: const TextSpan(
                text: 'Paramètres',
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
            Text("    Partager" , style: const TextStyle(  fontSize: 16, fontWeight: FontWeight.w700,  color: Colors.grey,  )),
            _buildSection(  ' ', [
              _buildListTileWithIcon(
                icon: Icons.ios_share,
                title: 'Inviter un ami à rejoindre Wave',
                onTap: () {
                },
              ),
              _buildListTileWithIcon(
                icon: Icons.star,
                title: 'Utiliser le code promotionnel',
                onTap: () {


                },
              ),
            ]),
            Text("    Assistance" , style: const TextStyle(  fontSize: 16, fontWeight: FontWeight.w700,  color: Colors.grey,  )),

            _buildSection(' ', [
              _buildListTileWithIcon(
                icon: Icons.phone,
                title: 'Contactez le service client',
                onTap: () {
                  },
              ),
              _buildListTileWithIcon(
                icon: Icons.location_on,
                title: 'Trouvez les agents à proximité',
                onTap: () {
                 },
              ),
              _buildListTileWithIcon(
                icon: Icons.event_note_outlined,
                title: 'Vérifiez votre plafond',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SettingScreen5();
                  },
                  )
                  );
                },
              ),
            ]),
            Text("    Sécurité" , style: const TextStyle(  fontSize: 16, fontWeight: FontWeight.w700,  color: Colors.grey,  )),

            _buildSection(' ', [
              _buildListTileWithIcon(
                icon: Icons.security,
                title: 'Modifiez votre code secret',
                onTap: () {
                   },
              ),
              _buildListTileWithIcon(
                icon: Icons.phone_android_outlined,
                title: 'Vos appareils connectés',
                onTap: () {
                        },
              ),
            ]),
            _buildSection('Se déconnecter', [
              _buildListTileWithIcon(
                icon: Icons.logout,
                title: 'Se déconnecter (77 994 74 43) ',
                onTap: () {

                },
              ),
            ]),
            Footer(),
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

          const SizedBox(height: 2),
          ...children,
        ],
      ),
    );
  }

  Widget _buildListTileWithIcon({
    required IconData icon,
    required String title,

    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Icon(icon ,
          color: Colors.black,),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
