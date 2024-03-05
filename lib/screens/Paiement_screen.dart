import 'package:flutter/material.dart';

import '../models/option.dart';

class ParametreScreen extends StatefulWidget {
  const ParametreScreen({Key? key}) : super(key: key);

  @override
  State<ParametreScreen> createState() => _ParametreScreenState();
}

class _ParametreScreenState extends State<ParametreScreen> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    List<Images> imageList = [
      Images(
        text : "Transfert",
         assetImage : 'assets/images/canal.png',
      )
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: const TextSpan(
                    text: 'Paiements',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            floating: true,
            snap: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 40,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search by name',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    focusColor: Colors.transparent,
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return imageWidget(
                  text: imageList[index].text,
                  assetImage: imageList[index].assetImage,
                );
              },
              childCount: imageList.length,
            ),
          ),
        ],
      ),
    );
  }

   imageWidget({required String text, required String assetImage}) {
    return Column(
      children: [

        Image.asset(assetImage),
        Text(
          text,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
