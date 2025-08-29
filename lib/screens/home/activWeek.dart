// ignore_for_file: prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fnoon_app_new/models/event_calander.dart';
import 'package:fnoon_app_new/screens/services/funcation_firebase.dart';

class activeWeek extends StatefulWidget {
  @override
  State<activeWeek> createState() => _activeWeekState();
   const activeWeek({super.key});
}

class _activeWeekState extends State<activeWeek> {
  DatabaseService service = DatabaseService();

  late Future<List<Event>> eventList;
  late List<Event> retrievedEventList;
  void _getData() async {
  var date = DateTime.now().add(const Duration(days: 7));
  var date2=DateTime.now();
  // ignore: duplicate_ignore
  // ignore: unused_local_variable
  var resulte=date2.subtract(Duration(days: date.day));
  
  }

  @override
  void initState() {
    // retrievedEventList = [];
    //print()
    // _initRetrieval();
    super.initState();
  }

  // Future<void> _initRetrieval() async {
  //   var x = await FirebaseFirestore.instance
  //       .collection('ooo')
  //       // .where('date', isEqualTo: widget.selectedDay)
  //       // .where('SelectedDay', isEqualTo: widget.selectedDay)
  //       .get();
  //   // eventList = service.retrieveEmployees(widget.selectedDay);
  //   // print(eventList);
  //   // retrievedEventList = await service.retrieveEmployees(widget.selectedDay);

  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    _getData();
    var height =MediaQuery.of(context).size.height;
   var width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("fierbase"),
      // ),
      body: SafeArea(
        child: Container(
          width: width,
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assest/image/FnoonBackground.png"),
                  fit: BoxFit.cover)),
          child: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
                .collection('ooo')
                .where('SelectedDay',isLessThanOrEqualTo:DateTime.now().add(const Duration(days: 7)) ).where(
                  'SelectedDay',isGreaterThanOrEqualTo:DateTime.now()
                )
                .get(),
            //initialData: [],
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData && snapshot.data!.docs.length > 0) {
                //retrievedEventList= eventList ;
                return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      Timestamp timestamp =
                          snapshot.data?.docs[index]['SelectedDay'];
                      DateTime time = DateTime.fromMicrosecondsSinceEpoch(
                          timestamp.microsecondsSinceEpoch);
                      return Container(
                              margin: EdgeInsets.all(10),
                              child: Table(
                                border: TableBorder.all(color: Colors.orangeAccent),
                                children: [
                                  buildRow([
                                    " اسم الفعالية",
                                    snapshot.data?.docs[index]["title"] ?? " ",
                                    
                                  ]),
                                  buildRow([
                                    " تاريخ الفعالية",
                                    '${DateFormat('dd/MM/yyyy').format(time)}',
                                    
                                  ]),
                                  buildRow([
                                    
                                    "فترة الفعالية",
                                    snapshot.data?.docs[index]['state'] ?? " ",
                                    
                                  ], isHeader: true),
                                  
                                  buildRow([
                                    "الفنان",
                                   snapshot.data?.docs[index]['actor'] ?? " ",
                                    
                                  ]),
                                  buildRow([
                                     "مكان الفعالية",
                                    snapshot.data?.docs[index]['place'] ?? " ",
                                   
                                  ]),
                                  
                                  // buildRow(["الفنان"]),
                                ],
                              ),
                            );

                      //  Card(
                      //   margin: EdgeInsets.all(width/20,),
                      //   elevation: 10,
                      //   color: Color(0XFFEBEBEB),
                      //   child: Container(
                      //     padding: EdgeInsets.all(15),
                      //     child: Column(
                      //         //crossAxisAlignment:CrossAxisAlignment.center ,
                      //         children: [
                      //           // SizedBox(
                      //           //   height: 10,
                      //           // ),
                      //           Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Text(
                      //                 '${DateFormat('dd/MM/yyyy').format(time)}',
                      //                 style: TextStyle(
                      //                     fontFamily: "ArbFONTS-beIN Normal",
                      //                     fontSize: width/20,
                      //                     fontWeight: FontWeight.bold),
                      //               ),
                      //               Text(
                      //                 snapshot.data.docs[index]['state'],
                      //                 style: TextStyle(
                      //                     fontFamily: "ArbFONTS-beIN Normal",
                      //                     fontSize: width/20,
                      //                     fontWeight: FontWeight.bold),
                      //               ),
                      //             ],
                      //           ),
                      //           Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Text(
                      //                 snapshot.data.docs[index]["title"],
                      //                 style: TextStyle(
                      //                     fontFamily: "ArbFONTS-beIN Normal",
                      //                     fontSize: width/20,
                      //                     fontWeight: FontWeight.bold),
                      //               ),
                      //               Text(
                      //                 snapshot.data.docs[index]['place'],
                      //                 style: TextStyle(
                      //                     fontFamily: "ArbFONTS-beIN Normal",
                      //                     fontSize: width/20,
                      //                     fontWeight: FontWeight.bold),
                      //               ),
                      //               Text(
                      //                 snapshot.data.docs[index]['actor'],
                      //                 style: TextStyle(
                      //                     fontFamily: "ArbFONTS-beIN Normal",
                      //                     fontSize: width/20,
                      //                     fontWeight: FontWeight.bold),
                      //               ),
                      //             ],
                      //           )

                      //           //Text('اسم الفعالية'+" :  "+'${widget.allEvent[index].title}'),
                      //         ]
                      //         ),
                      //   ),
                      // );

                      // Center(child: Text('${widget.allEvent[index].title}'));
                    });
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(child: Text('لا يوجد فعاليات لهذا الأسبوع'));
              } else {
                return const Text('Error');
                // return Container(
                //   child: Center(
                //     child: CircularProgressIndicator(),
                //   ),
                // );
              }
              // else {
              //   return const Center(child: CircularProgressIndicator());
              // }
            },
          ),
        ),
      ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: (() {
// //Navigator.pushNamed(context, '/add');
//         }),
//         tooltip: 'add',
//         child: const Icon(Icons.add),
//       ),
    );
  }
}

















// import 'package:flutter/material.dart';
// import 'package:test2/models/allEvent.dart';
// import 'package:url_launcher/link.dart';

// class ActiveWeek extends StatefulWidget {

//   @override
//   State<ActiveWeek> createState() => _ActiveWeekState();
// }

// class _ActiveWeekState extends State<ActiveWeek> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage("assest/image/fnoonbackground.png"),
//                 fit: BoxFit.cover)),
//         child: Container(
//           margin: EdgeInsets.all(30),
//           padding: EdgeInsets.all(15),
//           decoration: BoxDecoration(
//             color: Colors.white24,
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: ListView.builder(
//               itemCount: widget.allEvent.length,
//               itemBuilder: (context, index) {
//                 return Card(
                  
//                   elevation: 10,
//                   color: Color(0XFFEBEBEB),
//                   child: Column(
//                     children: [
//                     // SizedBox(
//                     //   height: 10,
//                     // ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         CircleAvatar(
//                           radius: 35.0,
//                           backgroundImage:
//                               NetworkImage(widget.allEvent[index].imageUrl),
//                           //AssetImage(snapshot.data!.docs[0]['image']) ,
//                         ),
//                         Expanded(
//                           child: Column(
//                             children: [
//                                Text(
//                                     '${widget.allEvent[index].title}',
//                                     style: TextStyle(
//                                             fontSize: 15, color: Colors.black
//                                             // fontStyle: FontStyle.italic,
//                                             // fontWeight: FontWeight.bold,
//                                             ),
//                                   ),
//                               // RichText(
//                               //   text: TextSpan(
//                               //       text: 'اسم الفعالية' + " :  ",
//                               //       style: TextStyle(
//                               //           fontSize: 20, color: Colors.orange),
//                               //       children: <TextSpan>[
//                               //         TextSpan(
//                               //           text: '${widget.allEvent[index].title}',
//                               //           style: TextStyle(
//                               //               fontSize: 15, color: Colors.black
//                               //               // fontStyle: FontStyle.italic,
//                               //               // fontWeight: FontWeight.bold,
//                               //               ),
//                               //         ),
//                               //       ]),
//                               // ),
                              
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Link(
//                                 target: LinkTarget.blank,
//                                 uri: Uri.parse(widget.allEvent[index].youtubUrl),
//                                 builder: (context, folloeLink) => GestureDetector(
//                                   onTap: folloeLink,
//                                   child:
//                                       // decoration: BoxDecoration(
//                                       //     shape: BoxShape.circle, color:Colors.orange),
//                                       Text(
//                                     widget.allEvent[index].youtubUrl,
//                                     style: TextStyle(
//                                         overflow: TextOverflow.ellipsis,
//                                         fontSize: 10,
//                                         color: Colors.blue),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     )

//                     //Text('اسم الفعالية'+" :  "+'${widget.allEvent[index].title}'),
//                   ]),
//                 );

//                 // Center(child: Text('${widget.allEvent[index].title}'));
//               }),
//         )

//         // SingleChildScrollView(
//         //   child: Column(children: [
//         //     Container(
//         //            margin: EdgeInsets.only(top: 10,right: 25),

//         //             width: double.infinity,
//         //             height: 70,
//         //             decoration: BoxDecoration(

//         //             ),
//         //             child:
//         //           Container(
//         //               margin: EdgeInsets.all(15),
//         //               padding: EdgeInsets.all(15),
//         //             decoration: BoxDecoration(
//         //               color:Colors.white24,
//         //               borderRadius:BorderRadius.circular(15),
//         //             ),
//         //             child: ListView.builder(
//         //               itemCount:widget. allEvent.length,
//         //               itemBuilder: (context,index){
//         //                 print("mmmmmmmmmmmmmmmm");
//         //                 print(widget.allEvent[index].title);
//         //                 print(widget.allEvent[index].youtubUrl);
//         //                 // if(widget.allEvent.isEmpty){
//         //                 //   return Text("لايوجد محتوى");
//         //                 // }
//         //                 // else{
//         //                      return Center(child: Text('${widget.allEvent[index].title}'));
//         //     //                   Container(
//         //     //                    margin: EdgeInsets.all(30),
//         //     //                    child: Column(
//         //     //                      children: [
//         //     //                Text('${widget.allEvent[index].title}'),
//         //     // //                Link(
//         //     // //   target: LinkTarget.blank,
//         //     // //   uri: Uri.parse(widget.allEvent[index].youtubUrl),
//         //     // //   builder:(context,folloeLink)=> GestureDetector(
//         //     // //     onTap: folloeLink,
//         //     // //     child: Container(
//         //     // //            margin: EdgeInsets.only(right: 8.0),
//         //     // //         height: 40,
//         //     // //         width: 40,
//         //     // //         // decoration: BoxDecoration(
//         //     // //         //     shape: BoxShape.circle, color:Colors.orange),

//         //     // //       ),
//         //     // //   ),

//         //     // // ),
//         //     //           ]
//         //     //             ),
//         //     //             );
//         //                 }

//         //                 // }

//         //               )

//         //               ),
//         //             ),

//         //   ]),
//         // ),

//         );
//   }
// }
TableRow buildRow(List<String> cells, {bool isHeader = false}) => TableRow(
        children: cells.map((e) {
      final style = TextStyle(
        //  color: Colors.white,
        fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
      );
      return Padding(
        padding: EdgeInsets.all(12),
        child: Center(
            child: Text(
          e,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontFamily: "bein-black",color: Colors.black),
        )),
      );
    }).toList());
