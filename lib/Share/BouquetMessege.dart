
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BouquetMessege extends StatelessWidget {
  const BouquetMessege({super.key});

  @override
  Widget build(BuildContext context) {
    openwhtsapp() async {
      var whatsappurlAndriod = "whatsapp://send?phone=+967777950310";
      // var whatsappURL_ios = "https://wa.me/+967700330303";
      if (Platform.isAndroid) {
        if (await canLaunch(whatsappurlAndriod)) {
          await launch(whatsappurlAndriod);
        }
      }
    }

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Stack(children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(),
          child: FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance
                  .collection('AdminAddbouquetmessege')
                  .orderBy('dateTime', descending: true)
                  .get(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData && snapshot.data!.docs.length > 0) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                          child: Text(
                        "اختر رقم الباقة" " :",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      )),
                      Divider(
                        color: Colors.orange,
                        thickness: 2.0,
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("باقة1" ':' '  '),
                          SizedBox(
                            width: 5,

                          ),
                          Expanded(
                            flex: 2,
                            child: AutoSizeText(
                              snapshot.data!.docs[0]['title'],
                              maxLines: 1,
                              ),
                          )
                        ],
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("باقة2" ':' '  '),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 2,
                            child: AutoSizeText(
                              snapshot.data!.docs[0]['title2'],
                              maxLines: 1,
                              ),
                          )
                        ],
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("باقة3" ':' '  '),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 2,
                            child: AutoSizeText(
                              snapshot.data!.docs[0]['title3'],
                              maxLines: 1,
                              ),
                          )
                          
                        ],
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              fixedSize: const Size(300, 30),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          onPressed: () {
                            openwhtsapp();
                          },
                          child: Text("للتواصل والحجز"))
                    ],
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: ListView(
                      children: const <Widget>[
                        Align(
                            alignment: AlignmentDirectional.center,
                            child: Center(child: Text('لايوجد بيانات'))),
                      ],
                    ),
                  );
                } else {
                  return const Text('Error');
                }
              }),

          //  Column(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     Center(
          //         child: Text(
          //       "اختر رقم الباقة" + " :",
          //       maxLines: 2,
          //       textAlign: TextAlign.center,
          //     )),
          //     Divider(
          //       color: Colors.orange,
          //       thickness: 2.0,
          //     ),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [Text(Bouquet1), Text(':' + '  ' + "باقة1")],
          //     ),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [Text(Bouquet2), Text(':' + '  ' + "باقة2")],
          //     ),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [Text(Bouquet3), Text(':' + '  ' + "باقة3")],
          //     ),
          //     ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //             primary: Color(0xFFFF6C06),
          //             fixedSize: const Size(300, 30),
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(50))),
          //         onPressed: () {
          //           Link(
          //             target: LinkTarget.self,
          //             uri: Uri.parse('https://wa.me/967777370700'),
          //             builder: (context, folloeLink) => GestureDetector(
          //               onTap: folloeLink,
          //               child: Container(
          //                 margin: EdgeInsets.only(right: 8.0),
          //                 height: 40,
          //                 width: 40,
          //               ),
          //             ),
          //           );
          //         },
          //         child: Text("للتواصل والحجز"))
          //     //  Continar_login(
          //     //                  title: "للتواصل والحجز",
          //     //                  ontap: (){
          //     //                    Link(
          //     //   target: LinkTarget.blank,
          //     //   uri: Uri.parse('https://wa.me/967711106414'),
          //     //   builder:(context,folloeLink)=> GestureDetector(
          //     //     onTap: folloeLink,
          //     //     child: Container(
          //     //            margin: EdgeInsets.only(right: 8.0),
          //     //         height: 40,
          //     //         width: 40,
          //     //       ),
          //     //   ),

          //     // );
          //     //                  },
          //     //                  //Get.to(HOME_PAGE),
          //     //                ),
          //   ],
          // ),
        )
      ]),
    );
  }
}
