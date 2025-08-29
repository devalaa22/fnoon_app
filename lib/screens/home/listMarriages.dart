import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fnoon_app_new/models/allEvent.dart';
import 'package:fnoon_app_new/screens/home/Edit_event_youtub.dart';
import 'package:url_launcher/link.dart';
import 'package:fnoon_app_new/screens/services/funcation_firebase.dart';

import '../../Share/dialogSuss.dart';

class ListMarriage extends StatefulWidget {
  final String allEvent;
  const ListMarriage({super.key, required this.allEvent});

  @override
  State<ListMarriage> createState() => _ListMarriageState();
}

class _ListMarriageState extends State<ListMarriage> {
  DatabaseService service = DatabaseService();
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assest/image/FnoonBackground.png"),
                    fit: BoxFit.cover)),
            child: Container(
              margin: EdgeInsets.all(30),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(15),
              ),
              child: FutureBuilder<QuerySnapshot>(
                  future: FirebaseFirestore.instance
                      .collection('AddAllEvent')
                      .where('actor', isEqualTo: widget.allEvent)
                      .get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData && snapshot.data!.docs.length > 0) {
                      return ListView.builder(
                          itemCount:
                              // CartDatabaseHelper.list.length,
                              snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 10,
                              color: Color(0XFFEBEBEB),
                              child: Column(children: [
                                // SizedBox(
                                //   height: 10,
                                // ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CircleAvatar(
                                        radius: 35.0,
                                        backgroundImage: NetworkImage(
                                            // CartDatabaseHelper.list[index].imageUrl
                                            snapshot.data!.docs[index]['image']),
                                        //AssetImage(snapshot.data!.docs[0]['image']) ,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: Text(
                                                // CartDatabaseHelper.list[index].title,
                                                snapshot.data!.docs[index]
                                                    ['title'],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black
                                                    // fontStyle: FontStyle.italic,
                                                    // fontWeight: FontWeight.bold,
                                                    ),
                                              ),
                                            ),
                                            // RichText(
                                            //   text: TextSpan(
                                            //       text: 'اسم الفعالية' + " :  ",
                                            //       style: TextStyle(
                                            //           fontSize: 20, color: Colors.orange),
                                            //       children: <TextSpan>[
                                            //         TextSpan(
                                            //           text: '${widget.allEvent[index].title}',
                                            //           style: TextStyle(
                                            //               fontSize: 15, color: Colors.black
                                            //               // fontStyle: FontStyle.italic,
                                            //               // fontWeight: FontWeight.bold,
                                            //               ),
                                            //         ),
                                            //       ]),
                                            // ),

                                            // SizedBox(
                                            //   width: 10,
                                            // ),
                                            Link(
                                              target: LinkTarget.blank,
                                              uri: Uri.parse(
                                                  //CartDatabaseHelper.list[index].youtubUrl
                                                  snapshot.data!.docs[index]
                                                      ['youtubUrl']),
                                              builder: (context, folloeLink) =>
                                                  GestureDetector(
                                                onTap: folloeLink,
                                                child:
                                                    // decoration: BoxDecoration(
                                                    //     shape: BoxShape.circle, color:Colors.orange),
                                                    Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Text(
                                                    //  CartDatabaseHelper.list[index].youtubUrl,
                                                    snapshot.data!.docs[index]
                                                        ['youtubUrl'],
                                                    style: TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontSize: 15,
                                                        color: Colors.blue),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            user?.email != null
                                                ?Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    IconButton(
      onPressed: () {
        var model = AllEvent(
          actor: snapshot.data!.docs[index]['actor'] ?? '',
          imageUrl: snapshot.data!.docs[index]['image'] ?? '',
          state: snapshot.data!.docs[index]['state'] ?? '',
          title: snapshot.data!.docs[index]['title'] ?? '',
          youtubUrl: snapshot.data!.docs[index]['youtubUrl'] ?? '',
          documentId: snapshot.data!.docs[index].id, // صححت الاسم
          qute: snapshot.data!.docs[index]['qute'] ?? '',
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditEventYoutub(model),
          ),
        );
      },
      icon: Icon(
        Icons.edit,
        color: Colors.grey,
      ),
    ),
    IconButton(
      onPressed: () async {
        await service
            .deleteEventYOUtub(snapshot.data!.docs[index].id)
            .then(
              (value) => showDialog(
                context: context,
                builder: (BuildContext context) => DialogScss(),
              ),
            );
      },
      icon: Icon(
        Icons.delete,
        color: Colors.red,
      ),
    ),
  ],
)

                                                : Container()
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )

                                //Text('اسم الفعالية'+" :  "+'${widget.allEvent[index].title}'),
                              ]),
                            );

                            // Center(child: Text('${widget.allEvent[index].title}'));
                          });
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.data!.docs.isEmpty) {
                      return Center(
                          child: Text(
                        'لايوجد بيانات لعرضها',
                        style: TextStyle(fontSize: 25),
                      ));
                    } else {
                      return const Text('Error');
                    }
                  }),

              //  ListView.builder(
              //     itemCount: widget.allEvent.length,
              //     itemBuilder: (context, index) {
              //       return Card(
              //         elevation: 10,
              //         color: Color(0XFFEBEBEB),
              //         child: Column(children: [
              //           // SizedBox(
              //           //   height: 10,
              //           // ),
              //           Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 35.0,
              //                   backgroundImage:
              //                       NetworkImage(widget.allEvent[index].imageUrl),
              //                   //AssetImage(snapshot.data!.docs[0]['image']) ,
              //                 ),
              //                 Expanded(
              //                   child: Column(
              //                     children: [
              //                       Text(
              //                         '${widget.allEvent[index].title}',
              //                         style: TextStyle(
              //                             fontSize: 15, color: Colors.black
              //                             // fontStyle: FontStyle.italic,
              //                             // fontWeight: FontWeight.bold,
              //                             ),
              //                       ),
              //                       // RichText(
              //                       //   text: TextSpan(
              //                       //       text: 'اسم الفعالية' + " :  ",
              //                       //       style: TextStyle(
              //                       //           fontSize: 20, color: Colors.orange),
              //                       //       children: <TextSpan>[
              //                       //         TextSpan(
              //                       //           text: '${widget.allEvent[index].title}',
              //                       //           style: TextStyle(
              //                       //               fontSize: 15, color: Colors.black
              //                       //               // fontStyle: FontStyle.italic,
              //                       //               // fontWeight: FontWeight.bold,
              //                       //               ),
              //                       //         ),
              //                       //       ]),
              //                       // ),

              //                       SizedBox(
              //                         width: 10,
              //                       ),
              //                       Link(
              //                         target: LinkTarget.blank,
              //                         uri: Uri.parse(
              //                             widget.allEvent[index].youtubUrl),
              //                         builder: (context, folloeLink) =>
              //                             GestureDetector(
              //                           onTap: folloeLink,
              //                           child:
              //                               // decoration: BoxDecoration(
              //                               //     shape: BoxShape.circle, color:Colors.orange),
              //                               Text(
              //                             widget.allEvent[index].youtubUrl,
              //                             style: TextStyle(
              //                                 overflow: TextOverflow.ellipsis,
              //                                 fontSize: 10,
              //                                 color: Colors.blue),
              //                           ),
              //                         ),
              //                       ),
              //                       user?.email != null
              //                           ? IconButton(
              //                               onPressed: () async {
              //                                 await service.deleteEventYOUtub(widget
              //                                     .allEvent[index].documentid).then((value) => showDialog(
              //                                 context: context,
              //                                 builder: (BuildContext context) =>
              //                                     DialogScss()));
              //                               },
              //                               icon: Icon(Icons.delete,color: Colors.red,))
              //                           : null
              //                     ],
              //                   ),
              //                 )
              //               ],
              //             ),
              //           )

              //           //Text('اسم الفعالية'+" :  "+'${widget.allEvent[index].title}'),
              //         ]),
              //       );

              //       // Center(child: Text('${widget.allEvent[index].title}'));
              //     }),
            )

            // SingleChildScrollView(
            //   child: Column(children: [
            //     Container(
            //            margin: EdgeInsets.only(top: 10,right: 25),

            //             width: double.infinity,
            //             height: 70,
            //             decoration: BoxDecoration(

            //             ),
            //             child:
            //           Container(
            //               margin: EdgeInsets.all(15),
            //               padding: EdgeInsets.all(15),
            //             decoration: BoxDecoration(
            //               color:Colors.white24,
            //               borderRadius:BorderRadius.circular(15),
            //             ),
            //             child: ListView.builder(
            //               itemCount:widget. allEvent.length,
            //               itemBuilder: (context,index){
            //                 print("mmmmmmmmmmmmmmmm");
            //                 print(widget.allEvent[index].title);
            //                 print(widget.allEvent[index].youtubUrl);
            //                 // if(widget.allEvent.isEmpty){
            //                 //   return Text("لايوجد محتوى");
            //                 // }
            //                 // else{
            //                      return Center(child: Text('${widget.allEvent[index].title}'));
            //     //                   Container(
            //     //                    margin: EdgeInsets.all(30),
            //     //                    child: Column(
            //     //                      children: [
            //     //                Text('${widget.allEvent[index].title}'),
            //     // //                Link(
            //     // //   target: LinkTarget.blank,
            //     // //   uri: Uri.parse(widget.allEvent[index].youtubUrl),
            //     // //   builder:(context,folloeLink)=> GestureDetector(
            //     // //     onTap: folloeLink,
            //     // //     child: Container(
            //     // //            margin: EdgeInsets.only(right: 8.0),
            //     // //         height: 40,
            //     // //         width: 40,
            //     // //         // decoration: BoxDecoration(
            //     // //         //     shape: BoxShape.circle, color:Colors.orange),

            //     // //       ),
            //     // //   ),

            //     // // ),
            //     //           ]
            //     //             ),
            //     //             );
            //                 }

            //                 // }

            //               )

            //               ),
            //             ),

            //   ]),
            // ),

            ),
      ),
    );
  }
}
