// import 'package:flutter/material.dart';
// import 'package:url_launcher/link.dart';

// import '../../database/images_database.dart';
// import '../../models/allEvent.dart';

// class Texte extends StatefulWidget {
//   const Texte({Key key}) : super(key: key);

//   @override
//   State<Texte> createState() => _TexteState();
// }

// class _TexteState extends State<Texte> {
//   List<AllEvent> li = [];
  
  
//   @override
//   void initState() {
//     _getData();
//     super.initState();
//   }

//   void _getData() async {
//     var dbHelper = CartDatabaseHelper.instance;
//     li = (await dbHelper.getAllEvents());
//     Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
//     print("li.length");
//     print(li.length);
//   }


//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           body:
      
//           ListView.builder(
//               itemCount: li.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   elevation: 10,
//                   color: Color(0XFFEBEBEB),
//                   child: Column(children: [
//                     // SizedBox(
//                     //   height: 10,
//                     // ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           // CircleAvatar(
//                           //   radius: 35.0,
//                           //   backgroundImage: NetworkImage(
//                           //       li[index].imageUrl),
//                           //   //AssetImage(snapshot.data!.docs[0]['image']) ,
//                           // ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Expanded(
//                             child: Column(
//                               // mainAxisAlignment:
//                               //     MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   padding: EdgeInsets.all(10),
//                                   child: Text(
//                                     li[index].title,
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         fontSize: 15, color: Colors.black
//                                         // fontStyle: FontStyle.italic,
//                                         // fontWeight: FontWeight.bold,
//                                         ),
//                                   ),
//                                 ),
//                                 // RichText(
//                                 //   text: TextSpan(
//                                 //       text: 'اسم الفعالية' + " :  ",
//                                 //       style: TextStyle(
//                                 //           fontSize: 20, color: Colors.orange),
//                                 //       children: <TextSpan>[
//                                 //         TextSpan(
//                                 //           text: '${widget.allEvent[index].title}',
//                                 //           style: TextStyle(
//                                 //               fontSize: 15, color: Colors.black
//                                 //               // fontStyle: FontStyle.italic,
//                                 //               // fontWeight: FontWeight.bold,
//                                 //               ),
//                                 //         ),
//                                 //       ]),
//                                 // ),

//                                 // SizedBox(
//                                 //   width: 10,
//                                 // ),
//                                 Link(
//                                   target: LinkTarget.blank,
//                                   uri: Uri.parse(
//                                       li[index].youtubUrl),
//                                   builder: (context, folloeLink) =>
//                                       GestureDetector(
//                                     onTap: folloeLink,
//                                     child:
//                                         // decoration: BoxDecoration(
//                                         //     shape: BoxShape.circle, color:Colors.orange),
//                                         Align(
//                                       alignment: Alignment.bottomRight,
//                                       child: Text(
//                                         li[index].youtubUrl,
//                                         style: TextStyle(
//                                             overflow: TextOverflow.ellipsis,
//                                             fontSize: 15,
//                                             color: Colors.blue),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 // user?.email != null
//                                 //     ? IconButton(
//                                 //         onPressed: () async {
//                                 //           await service
//                                 //               .deleteEventYOUtub(
//                                 //                   snapshot
//                                 //                       .data
//                                 //                       .docs[index]
//                                 //                       .id)
//                                 //               .then((value) => showDialog(
//                                 //                   context: context,
//                                 //                   builder: (BuildContext
//                                 //                           context) =>
//                                 //                       DialogScss()));
//                                 //         },
//                                 //         icon: Icon(
//                                 //           Icons.delete,
//                                 //           color: Colors.red,
//                                 //         ))
//                                 //     : Container()
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     )

//                     //Text('اسم الفعالية'+" :  "+'${widget.allEvent[index].title}'),
//                   ]),
//                 );

//                 // Center(child: Text('${widget.allEvent[index].title}'));
//               }),
//           ),
//     );
//   }
// }
