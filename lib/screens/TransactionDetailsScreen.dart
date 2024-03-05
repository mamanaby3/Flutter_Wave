import 'package:flutter/material.dart';
import 'package:cours_flutter/models/transaction.dart';

class TransactionDetailsScreen extends StatelessWidget {
  final Transaction transaction;

  const TransactionDetailsScreen({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Icon(
              Icons.person,
              color: Colors.blue,
              size: 30.0,
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                  Text("${transaction.isRetrait ? '-' : ''} ${transaction.price}F" , style: TextStyle(color: Colors.black , fontSize: 30)) ,
                Text("${transaction.isRetrait ? 'À' : 'De'} ${transaction.name} ${transaction.phoneNumber}", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500))
              ],
            ),
            //Text("${transact.isRetrait ? '-' : ''} ${transact.price}F", style: TextStyle(color: primaryColor, fontSize: 16, fontWeight: FontWeight.w500)),

            SizedBox(height: 20),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Montant Recu", style: TextStyle(color: Colors.grey  , fontSize: 16) ),
                      Text(" ${transaction.price}F", style: TextStyle(color: Colors.black )),
                  ],
                ),

            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Frais", style: TextStyle(color: Colors.grey , fontSize: 16)),
                Text(" ${transaction.price / 100}", style: TextStyle(color: Colors.black )),
              ],
            ),


            SizedBox(height: 20),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Date et eure",   style: TextStyle(color: Colors.grey , fontSize: 16)),
                Text(transaction.dateTime.toString(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
              ],
            ),
              ],
      ),
    ),
    );
  }

}




