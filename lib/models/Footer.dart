import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 220, // Ajustez la hauteur selon vos besoins
      // color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
            child: Text(
              'Wave Digital Finance',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            child: Text(
              'Version: 2.12.13',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
          Padding(

            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Conditions Générales | Avis de Confidentialité',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Fermer mon compte Wave',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
