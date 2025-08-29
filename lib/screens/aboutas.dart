import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AboutAs extends StatelessWidget {
  const AboutAs({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assest/image/FnoonBackground.png"),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, right: 25),
                    width: width,
                    height: height / 9,
                    decoration: BoxDecoration(

                        // image: DecorationImage(
                        //     image: AssetImage("assest/image/fnoonbackground.png"),
                        //     fit: BoxFit.cover)

                        ),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          " من نحن",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontFamily: "bein-black"),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(children: [
                      Center(
                          child: Text(
                        " نبذه عنا:",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: "bein-black"),
                      )),
                      AutoSizeText(
                        'مؤسسة إعلامية رسمية تحمل سجل تجاري رقم 22/66 من مكتب وزارة الصناعة والتجارة بحضرموت وترخيص رسمي من مكتب وزارة الثقافة بحضرموت ونقوم بتوثيق الحفلات والسهرات والمناسبات وتصوير البرامج التلفزيونية والإعلانات المرئية بطريقة إحترافية نموذجية',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: "bein-black"),
                        maxLines: 4,
                        minFontSize: 14,
                      ),
                      // Center(
                      //     child: Text(
                      //   " مؤسسة إعلامية  رسمية تحمل سجل تجاري رقم  22/66 من مكتب وزارة الصناعة والتجارة بحضرموت وترخيص رسمي من مكتب وزارة الثقافة بحضرموت",
                      //   style: TextStyle(
                      //       fontSize: 20,
                      //       color: Colors.black,
                      //       fontFamily: "bein-black"),
                      // )),
                      // Center(
                      //   child: Text(
                      //     "ونقوم بتوثيق الحفلات والسهرات والمناسبات وتصوير البرامج التلفزيونية والإعلانات المرئية بطريقة \nإحترافية نموذجية",
                      //     style: TextStyle(
                      //         fontSize: 20,
                      //         color: Colors.black,
                      //         fontFamily: "bein-black"),
                      //   ),
                      // ),
                      Center(
                          child: Text(
                        " رسالتنا",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.orange,
                            fontFamily: "bein-black"),
                      )),
                      AutoSizeText(
                        "  تقديم مادة إعلامية هادفة ترضي العميل وتنقل صورة إيجابية لكل حدث ومناسبة ",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: "bein-black"),
                        maxLines: 2,
                      ),
                      Center(
                          child: Text(
                        " رؤيتنا",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.orange,
                            fontFamily: "bein-black"),
                      )),
                      AutoSizeText(
                        " نسعى للتميز والتفرد من خلال  التطور والتنوع في إنتاج الأعمال المرئية بلمسة إبداعية بعيدا عن التقليد  و  الإعتيادية",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: "bein-black"),
                        maxLines: 2,
                      ),
                      Center(
                          child: Text(
                        " أهدافنا",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.orange,
                            fontFamily: "bein-black"),
                      )),
                      AutoSizeText(
                        " 1)   نقل الحدث بكافة تفاصيله بشكل يحاكي الواقع وإنتاج مواد إعلامية مرئية بشكل فني إبداعي",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: "bein-black"),
                        textAlign: TextAlign.start,
                        maxLines: 2,
                      ),

                      AutoSizeText(
                        " 2)  إضافة الجديد في عالم التصوير والإنتاج الإعلامي من خلال المواكبة والتحديث",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: "bein-black"),
                        maxLines: 2,
                        textAlign: TextAlign.start,
                      ),
                      AutoSizeText(
                        " 3)  رضاء جمهورنا بتقديم أعمال فنية متفردة وإطلاعهم على كل جديد في عالمنا",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: "bein-black"),
                        maxLines: 2,
                      ),
                      AutoSizeText(
                        "  4)  نسعى لنكون المؤسسة الأولى في الإنتاج الإعلامي على مستوى الوطن",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: "bein-black"),
                        maxLines: 2,
                        //textAlign: TextAlign.justify,
                      ),
                      AutoSizeText(
                        "5)  مراعاة الأعمال الخيرية والمشاريع الإنسانية والتعامل معهم بشكل خاص خدمة للوطن والمواطن ",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: "bein-black"),
                        maxLines: 2,
                      ),
                      Divider(
                        color: Colors.black38,
                        thickness: 2.0,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: FutureBuilder<QuerySnapshot>(
                            future: FirebaseFirestore.instance
                                .collection('AdminAddAboutUs')
                                .get(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasData &&
                                  snapshot.data!.docs.length > 0) {
                                return //
                                    Container(
                                  child: Column(children: [
                                    // Container(
                                    //   height: 90,
                                    //   width: 100,
                                    //   decoration: BoxDecoration(
                                    //       borderRadius: BorderRadius.all(
                                    //           Radius.circular(10)),
                                    //       border:
                                    //           Border.all(color: Colors.orange),
                                    //       color: Colors.white,
                                    //       image: DecorationImage(
                                    //           image: NetworkImage(snapshot
                                    //               .data.docs[4]['image']),
                                    //           fit: BoxFit.cover)),
                                    // ),
                                    // CircleAvatar(
                                    //   radius: 30.0,
                                    //   backgroundImage: NetworkImage(
                                    //       snapshot.data.docs[1]['image']),
                                    // ),
                                    Card(
                                      elevation: 10,
                                      color: Colors.white54,
                                      child: SizedBox(
                                        height: 100,
                                        width: double.infinity,
                                        child: Column(
                                          children: [
                                            Text(snapshot.data?.docs[4]['name'],
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontFamily: "bein-black")),
                                            Text(snapshot.data?.docs[4]['state'],
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.orange,
                                                    fontFamily: "bein-black")),
                                          ],
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 10,
                                    ),
                                    Card(
                                      elevation: 10,
                                      color: Colors.white54,
                                      child: SizedBox(
                                        height: 100,
                                        width: double.infinity,
                                        child: Column(
                                          children: [
                                            Text(snapshot.data?.docs[3]['name'],
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontFamily: "bein-black")),
                                            Text(snapshot.data?.docs[3]['state'],
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.orange,
                                                    fontFamily: "bein-black")),
                                          ],
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 10,
                                    ),
                                    Card(
                                      elevation: 10,
                                      color: Colors.white54,
                                      child: SizedBox(
                                        height: 100,
                                        width: double.infinity,
                                        child: Column(
                                          children: [
                                            Text(snapshot.data?.docs[2]['name'],
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontFamily: "bein-black")),
                                            Text(snapshot.data?.docs[2]['state'],
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.orange,
                                                    fontFamily: "bein-black")),
                                          ],
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 10,
                                    ),
                                    Card(
                                      elevation: 10,
                                      color: Colors.white54,
                                      child: SizedBox(
                                        height: 100,
                                        width: double.infinity,
                                        child: Column(
                                          children: [
                                            Text(snapshot.data?.docs[0]['name'],
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontFamily: "bein-black")),
                                            Text(snapshot.data?.docs[0]['state'],
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.orange,
                                                    fontFamily: "bein-black")),
                                          ],
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 10,
                                    ),

                                    Card(
                                      elevation: 10,
                                      color: Colors.white54,
                                      child: SizedBox(
                                        height: 100,
                                        width: double.infinity,
                                        child: Column(
                                          children: [
                                            Text(snapshot.data?.docs[1]['name'],
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontFamily: "bein-black")),
                                            Text(snapshot.data?.docs[1]['state'],
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.orange,
                                                    fontFamily: "bein-black")),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Column(
                                    //       children: [
                                    //         Container(
                                    //   height: 90,
                                    //   width: 100,
                                    //   decoration: BoxDecoration(
                                    //       borderRadius: BorderRadius.all(
                                    //           Radius.circular(10)),
                                    //       border:
                                    //           Border.all(color: Colors.orange),
                                    //       color: Colors.white,
                                    //       image: DecorationImage(
                                    //           image: NetworkImage(snapshot
                                    //               .data.docs[3]['image']),
                                    //           fit: BoxFit.cover)),
                                    // ),
                                    //         Text(snapshot.data.docs[3]['state'],
                                    //             style: TextStyle(
                                    //                 fontSize: 15,
                                    //                 color: Colors.orange,fontFamily: "bein-black")),
                                    //         Text(snapshot.data.docs[3]['name'],
                                    //             style: TextStyle(
                                    //                 fontSize: 15,
                                    //                 color: Colors.black,fontFamily: "bein-black")),
                                    //       ],
                                    //     ),
                                    //     Column(
                                    //       children: [
                                    //        Container(
                                    //   height: 90,
                                    //   width: 100,
                                    //   decoration: BoxDecoration(
                                    //       borderRadius: BorderRadius.all(
                                    //           Radius.circular(10)),
                                    //       border:
                                    //           Border.all(color: Colors.orange),
                                    //       color: Colors.white,
                                    //       image: DecorationImage(
                                    //           image: NetworkImage(snapshot
                                    //               .data.docs[2]['image']),
                                    //           fit: BoxFit.cover)),
                                    // ),
                                    //         Text(snapshot.data.docs[2]['state'],
                                    //             style: TextStyle(
                                    //                 fontSize: 15,
                                    //                 color: Colors.orange,fontFamily: "bein-black")),
                                    //         Text(snapshot.data.docs[2]['name'],
                                    //             style: TextStyle(
                                    //                 fontSize: 15,
                                    //                 color: Colors.black,fontFamily: "bein-black")),
                                    //       ],
                                    //     ),
                                    //   ],
                                    // ),
                                    // SizedBox(height:20,),
                                    //    Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Column(
                                    //       children: [
                                    //         Container(
                                    //   height: 90,
                                    //   width: 100,
                                    //   decoration: BoxDecoration(
                                    //       borderRadius: BorderRadius.all(
                                    //           Radius.circular(10)),
                                    //       border:
                                    //           Border.all(color: Colors.orange),
                                    //       color: Colors.white,
                                    //       image: DecorationImage(
                                    //           image: NetworkImage(snapshot
                                    //               .data.docs[1]['image']),
                                    //           fit: BoxFit.cover)),
                                    // ),
                                    //         Text(snapshot.data.docs[1]['state'],
                                    //             style: TextStyle(
                                    //                 fontSize: 15,
                                    //                 color: Colors.orange,fontFamily: "bein-black")),
                                    //         Text(snapshot.data.docs[1]['name'],
                                    //             style: TextStyle(
                                    //                 fontSize: 15,
                                    //                 color: Colors.black,fontFamily: "bein-black")),
                                    //       ],
                                    //     ),
                                    //     Column(
                                    //       children: [
                                    //        Container(
                                    //   height: 90,
                                    //   width: 100,
                                    //   decoration: BoxDecoration(
                                    //       borderRadius: BorderRadius.all(
                                    //           Radius.circular(10)),
                                    //       border:
                                    //           Border.all(color: Colors.orange),
                                    //       color: Colors.white,
                                    //       image: DecorationImage(
                                    //           image: NetworkImage(snapshot
                                    //               .data.docs[0]['image']),
                                    //           fit: BoxFit.cover)),
                                    // ),
                                    //         Text(snapshot.data.docs[0]['state'],
                                    //             style: TextStyle(
                                    //                 fontSize: 15,
                                    //                 color: Colors.orange,fontFamily: "bein-black")),
                                    //         Text(snapshot.data.docs[0]['name'],
                                    //             style: TextStyle(
                                    //                 fontSize: 15,
                                    //                 color: Colors.black,fontFamily: "bein-black")),
                                    //       ],
                                    //     ),
                                    //   ],
                                    // ),
                                    // Container(
                                    //   height: 90,
                                    //   width: 100,
                                    //   decoration: BoxDecoration(
                                    //       borderRadius: BorderRadius.all(
                                    //           Radius.circular(10)),
                                    //       border:
                                    //           Border.all(color: Colors.orange),
                                    //       color: Colors.white,
                                    //       image: DecorationImage(
                                    //           image: NetworkImage(snapshot
                                    //               .data.docs[1]['image']),
                                    //           fit: BoxFit.cover)),
                                    // ),
                                    // Text(snapshot.data.docs[0]['state'],
                                    //     style: TextStyle(
                                    //         fontSize: 15,
                                    //         color: Colors.orange,fontFamily: "bein-black")),
                                    // Text(snapshot.data.docs[0]['name'],
                                    //     style: TextStyle(
                                    //         fontSize: 15, color: Colors.black,fontFamily: "bein-black")),
                                  ]),
                                );
                              } else if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.data!.docs.isEmpty) {
                                return Center(
                                  child: ListView(
                                    children: const <Widget>[
                                      Align(
                                          alignment:
                                              AlignmentDirectional.center,
                                          child: Text('لا توجد بيانات')),
                                    ],
                                  ),
                                );
                              } else {
                                return const Text('Error');
                              }
                            }),
                      ),
                    ]),
                  )
                ]))),
      ),
    );
  }
}
