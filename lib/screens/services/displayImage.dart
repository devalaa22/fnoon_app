import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DisplayImage extends StatefulWidget {
  const DisplayImage({super.key});


  @override
  State<DisplayImage> createState() => _DisplayImageState();
}

class _DisplayImageState extends State<DisplayImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assest/image/background.png"),
                fit: BoxFit.cover)),
        child: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance.collection('ooo').get(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData && snapshot.data!.docs.length > 0) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                        child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          child: Image.file(
                            snapshot.data?.docs[index]['imageUrl'] as File,
                            width: 100,
                            height: 100,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: snapshot.data!.docs.length,
                    ));
                  },
                  itemCount: snapshot.data!.docs.length,
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: ListView(
                    children: const <Widget>[
                      Align(
                          alignment: AlignmentDirectional.center,
                          child: Text('No data available')),
                    ],
                  ),
                );
              } else {
                return const Text('Error');
              }
            }),
      ),
    );
  }
}
