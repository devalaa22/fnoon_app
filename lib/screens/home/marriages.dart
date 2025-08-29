

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fnoon_app_new/models/allEvent.dart';
import 'package:fnoon_app_new/screens/home/listMarriages.dart';
import 'package:fnoon_app_new/screens/services/funcation_firebase.dart';
import 'package:url_launcher/link.dart';

import '../../Share/dialogSuss.dart';

class Marriages extends StatefulWidget {
  String title;
  Marriages({super.key, required this.title});

  @override
  State<Marriages> createState() => _MarriagesState();
}

class _MarriagesState extends State<Marriages> {
  List<AllEvent> allevent = [];
  final scearchContllor = TextEditingController();
  List _allResult = [];
  List _resultList = [];
  List<AllEvent> uniquelist = [];
  late Future resultLoaded;
  DatabaseService service = DatabaseService();
  final user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scearchContllor.addListener(_onSearchChanged);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    resultLoaded = getAllScerch();
  }

  @override
  void dispose() {
    scearchContllor.addListener(_onSearchChanged);
    scearchContllor.dispose();
    super.dispose();
  }

  _onSearchChanged() {
    searchResultsList();
    // print(scearchContllor.text);
  }

  getAllScerch() async {
    Center(child: CircularProgressIndicator());
    var data = await FirebaseFirestore.instance
        .collection("AddAllEvent")
        .where('state', isEqualTo: widget.title)
        .get();
    for (var index = 0; index < data.docs.length; index++) {
     allevent.add(AllEvent(
  documentId: data.docs[index].id, // معرف المستند
  title: data.docs[index]['title'] ?? '',
  imageUrl: data.docs[index]['image'] ?? '',
  youtubUrl: data.docs[index]['youtubUrl'] ?? '',
  state: data.docs[index]['state'] ?? '',
  actor: data.docs[index]['actor'] ?? '',
  qute: data.docs[index]['qute'] ?? '',
));

    }

    List<AllEvent> list =
        allevent.where((student) => seen.add(student.actor)).toList();

    setState(() {
      _allResult = data.docs;
      uniquelist = list;
    });

    searchResultsList();
    return "data.docs";
  }

  searchResultsList() {
    var showResult = [];
    if (scearchContllor.text != "") {
      for (var event in _allResult) {
        var title = AllEvent.fromDocument(event).title;
        if (title.contains(scearchContllor.text)) {
          showResult.add(event);

          setState(() {
            _resultList = showResult;
          });
        }
      }
    } else {
      //showResult = List.from(_allResult);
      showResult = List.from(showResult);

      setState(() {
        _resultList = showResult;
      });
    }
  }

  var count = 0;
  var seen = <String>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assest/image/FnoonBackground.png"),
                fit: BoxFit.cover)),
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 10, right: 25),
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(),
            child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 30, color: Colors.white),
                )),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(right: 10),
              height: MediaQuery.of(context).size.height / 13,
              width: MediaQuery.of(context).size.width,
              //290,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Color(0xFFFF6C06)),
                  color: Colors.white),
              child: TextField(
                controller: scearchContllor,
                // textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                    hintText: "إبحث هنا",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                    ),
//hintTextDirection: TextDirection.rtl,
                    prefixIcon: Icon(
                      Icons.search,
                      size: MediaQuery.of(context).size.width / 13,
                      color: Color(0xFFFF6C06),
                    ),
                    border: InputBorder.none),
              ),
            ),
          ),
          // _allResult.length==null?Container():
          Expanded(
              child: _resultList.isEmpty
                  ? GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 0.85,
                      children: List.generate(
                        uniquelist.length,
                        // uniquelist.length,
                        // snapshot.data.docs.length,
                        (index) => Container(
                          height: 100,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: SingleChildScrollView(
                            child: Column(children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)
                                        //Radius.circular(20)
                                        )),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              uniquelist[index].imageUrl,

                                              //           loadingBuilder:
                                              //     (context, child, loadingProgress) {
                                              //   return loadingProgress == null
                                              //       ? child
                                              //       : CircularProgressIndicator(
                                              //           color: textcolor,
                                              //         );
                                              // },
                                              // snapshot
                                              //   .data.docs[index]['image']
                                            ),
                                            fit: BoxFit.fill)
                                        //: BorderRadius.circular(30)
                                        ),
                                    // child: Image.network(
                                    //   snapshot.data.docs[index]['image'],
                                    //   width: double.infinity,
                                    //   // fit: BoxFit.contain,
                                    //    height: 100,
                                    //    fit:BoxFit.cover ,
                                    //   //color: Colors.black,
                                    // ),
                                  ),
                                ),
                              ),
                              Divider(
                                color: Colors.black12,
                                thickness: 2.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ListMarriage(
                                              allEvent: uniquelist[index].actor
                                              //  snapshot
                                              //             .data
                                              //             .docs[
                                              //         index]
                                              //     ['state']
                                              )));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    uniquelist[index].actor,
                                    // maxLines: 2,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _resultList.length,
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
                                        _resultList[index]["image"]),
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
                                            _resultList[index]['title'],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15, color: Colors.black
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
                                              _resultList[index]['youtubUrl']),
                                          builder: (context, folloeLink) =>
                                              GestureDetector(
                                            onTap: folloeLink,
                                            child:
                                                // decoration: BoxDecoration(
                                                //     shape: BoxShape.circle, color:Colors.orange),
                                                Align(
                                              alignment: Alignment.bottomRight,
                                              child: Text(
                                                _resultList[index]['youtubUrl'],
                                                style: TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontSize: 15,
                                                    color: Colors.blue),
                                              ),
                                            ),
                                          ),
                                        ),
                                        user?.email != null
                                            ? IconButton(
                                                onPressed: () async {
                                                  await service
                                                      .deleteEventYOUtub(
                                                          _resultList[index]
                                                              ['documentid'])
                                                      .then((value) => showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                                  context) =>
                                                              DialogScss()));
                                                },
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ))
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
                      })
              // GridView.count(
              //     crossAxisCount: 2,
              //     crossAxisSpacing: 5,
              //     mainAxisSpacing: 5,
              //     childAspectRatio: 1.0,
              //     children: List.generate(
              //       _resultList.length,
              //       // uniquelist.length,
              //       // snapshot.data.docs.length,
              //       (index) => Container(
              //         height: 100,
              //         margin: EdgeInsets.all(10),
              //         decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius:
              //                 BorderRadius.all(Radius.circular(20))),
              //         child: SingleChildScrollView(
              //           child: Column(children: [
              //             //         for (var index = 0;
              //             //     index < snapshot.data.docs.length;
              //             //     index++) {
              //             //   allevent.add(AllEvent(
              //             //     actor: snapshot.data.docs[index]['actor'],
              //             //     imageUrl: snapshot.data.docs[index]['image'],
              //             //   ));
              //             // }

              //             // List<AllEvent> uniquelist = allevent
              //             //     .where((student) => seen.add(student.actor))
              //             //     .toList();
              //             Container(
              //               decoration: BoxDecoration(
              //                   color: Colors.black,
              //                   borderRadius: BorderRadius.only(
              //                       topLeft: Radius.circular(20),
              //                       topRight: Radius.circular(20)
              //                       //Radius.circular(20)
              //                       )),
              //               child: Container(
              //                 decoration: BoxDecoration(
              //                   color: Colors.white,
              //                   borderRadius: BorderRadius.only(
              //                     topLeft: Radius.circular(20),
              //                     topRight: Radius.circular(20),
              //                   ),
              //                 ),
              //                 child: Container(
              //                   height: 100,
              //                   decoration: BoxDecoration(
              //                       color: Colors.white,
              //                       borderRadius: BorderRadius.only(
              //                         topLeft: Radius.circular(20),
              //                         topRight: Radius.circular(20),
              //                       ),
              //                       image: DecorationImage(
              //                           image: NetworkImage(
              //                               _resultList[index]["image"]
              //                               // snapshot
              //                               //   .data.docs[index]['image']
              //                               ),
              //                           fit: BoxFit.fill)
              //                       //: BorderRadius.circular(30)
              //                       ),
              //                   // child: Image.network(
              //                   //   snapshot.data.docs[index]['image'],
              //                   //   width: double.infinity,
              //                   //   // fit: BoxFit.contain,
              //                   //    height: 100,
              //                   //    fit:BoxFit.cover ,
              //                   //   //color: Colors.black,
              //                   // ),
              //                 ),
              //               ),
              //             ),
              //             Divider(
              //               color: Colors.black12,
              //               thickness: 2.0,
              //             ),
              //             GestureDetector(
              //               onTap: () {
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (context) => ListMarriage(
              //                             allEvent: _resultList[index]
              //                                 ['actor']
              //                             //  snapshot
              //                             //             .data
              //                             //             .docs[
              //                             //         index]
              //                             //     ['state']
              //                             )));
              //               },
              //               child: AutoSizeText(
              //                 _resultList[index]["actor"],
              //                 maxLines: 2,
              //               ),
              //             ),
              //           ]),
              //         ),
              //       ),
              //     ),
              //   )
              //  FutureBuilder<QuerySnapshot>(
              //     future: FirebaseFirestore.instance
              //         .collection('AddAllEvent')
              //         .where('state', isEqualTo: widget.title)
              //         .get(),
              //     builder: (BuildContext context,
              //         AsyncSnapshot<QuerySnapshot> snapshot) {
              //       if (snapshot.hasData && snapshot.data.docs.length > 0) {
              //         for (var index = 0;
              //             index < snapshot.data.docs.length;
              //             index++) {
              //           allevent.add(AllEvent(
              //             actor: snapshot.data.docs[index]['actor'],
              //             imageUrl: snapshot.data.docs[index]['image'],
              //           ));
              //         }

              //         List<AllEvent> uniquelist = allevent
              //             .where((student) => seen.add(student.actor))
              //             .toList();
              //         print("_resultList.length");
              //         print(_resultList.length);
              //         return
              //         GridView.count(
              //           crossAxisCount: 2,
              //           crossAxisSpacing: 5,
              //           mainAxisSpacing: 5,
              //           childAspectRatio: 1.0,
              //           children: List.generate(
              //             uniquelist.length,
              //             // uniquelist.length,
              //             // snapshot.data.docs.length,
              //             (index) => Container(
              //               height: 100,
              //               margin: EdgeInsets.all(10),
              //               decoration: BoxDecoration(
              //                   color: Colors.white,
              //                   borderRadius:
              //                       BorderRadius.all(Radius.circular(20))),
              //               child: SingleChildScrollView(
              //                 child: Column(children: [
              //                   Container(
              //                     decoration: BoxDecoration(
              //                         color: Colors.black,
              //                         borderRadius: BorderRadius.only(
              //                             topLeft: Radius.circular(20),
              //                             topRight: Radius.circular(20)
              //                             //Radius.circular(20)
              //                             )),
              //                     child: Container(
              //                       decoration: BoxDecoration(
              //                         color: Colors.white,
              //                         borderRadius: BorderRadius.only(
              //                           topLeft: Radius.circular(20),
              //                           topRight: Radius.circular(20),
              //                         ),
              //                       ),
              //                       child: Container(
              //                         height: 100,
              //                         decoration: BoxDecoration(
              //                             color: Colors.white,
              //                             borderRadius: BorderRadius.only(
              //                               topLeft: Radius.circular(20),
              //                               topRight: Radius.circular(20),
              //                             ),
              //                             image: DecorationImage(
              //                                 image: NetworkImage(
              //                                     uniquelist[index].imageUrl
              //                                     // snapshot
              //                                     //   .data.docs[index]['image']
              //                                     ),
              //                                 fit: BoxFit.fill)
              //                             //: BorderRadius.circular(30)
              //                             ),
              //                         // child: Image.network(
              //                         //   snapshot.data.docs[index]['image'],
              //                         //   width: double.infinity,
              //                         //   // fit: BoxFit.contain,
              //                         //    height: 100,
              //                         //    fit:BoxFit.cover ,
              //                         //   //color: Colors.black,
              //                         // ),
              //                       ),
              //                     ),
              //                   ),
              //                   Divider(
              //                     color: Colors.black12,
              //                     thickness: 2.0,
              //                   ),
              //                   GestureDetector(
              //                     onTap: () {
              //                       Navigator.push(
              //                           context,
              //                           MaterialPageRoute(
              //                               builder: (context) => ListMarriage(
              //                                   allEvent: snapshot
              //                                       .data.docs[index]['state'])));
              //                     },
              //                     child: AutoSizeText(
              //                       uniquelist[index].actor,
              //                       maxLines: 2,
              //                     ),
              //                   ),
              //                 ]),
              //               ),
              //             ),
              //           ),
              //         );

              //       } else if (snapshot.connectionState ==
              //           ConnectionState.waiting) {
              //         return const Center(child: CircularProgressIndicator());
              //       } else if (snapshot.data.docs.isEmpty) {
              //         return Center(
              //             child: Text(
              //           'لايوجد بيانات لعرضها',
              //           style: TextStyle(fontSize: 25),
              //         ));
              //       } else {
              //         return const Text('Error');
              //       }
              //     })
              // :FutureBuilder<QuerySnapshot>(
              // future: FirebaseFirestore.instance
              //     .collection('AddAllEvent')
              //     .where('state', isEqualTo: widget.title)
              //     .get(),
              // builder: (BuildContext context,
              //     AsyncSnapshot<QuerySnapshot> snapshot) {
              //   if (snapshot.hasData && snapshot.data.docs.length > 0) {
              //     for (var index = 0;
              //         index < snapshot.data.docs.length;
              //         index++) {
              //       allevent.add(AllEvent(
              //         actor: snapshot.data.docs[index]['actor'],
              //         imageUrl: snapshot.data.docs[index]['image'],
              //       ));
              //     }

              //     List<AllEvent> uniquelist = allevent
              //         .where((student) => seen.add(student.actor))
              //         .toList();
              //     print("_resultList.length");
              //     print(_resultList.length);
              //     return
              //     GridView.count(
              //       crossAxisCount: 2,
              //       crossAxisSpacing: 5,
              //       mainAxisSpacing: 5,
              //       childAspectRatio: 1.0,
              //       children: List.generate(
              //         _resultList.length,
              //         // uniquelist.length,
              //         // snapshot.data.docs.length,
              //         (index) => Container(
              //           height: 100,
              //           margin: EdgeInsets.all(10),
              //           decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.all(
              //                   Radius.circular(20))),
              //           child: SingleChildScrollView(
              //             child: Column(children: [
              //               Container(
              //                 decoration: BoxDecoration(
              //                     color: Colors.black,
              //                     borderRadius: BorderRadius.only(
              //                         topLeft:
              //                             Radius.circular(20),
              //                         topRight:
              //                             Radius.circular(20)
              //                         //Radius.circular(20)
              //                         )),
              //                 child: Container(
              //                   decoration: BoxDecoration(
              //                     color: Colors.white,
              //                     borderRadius: BorderRadius.only(
              //                       topLeft: Radius.circular(20),
              //                       topRight: Radius.circular(20),
              //                     ),
              //                   ),
              //                   child: Container(
              //                     height: 100,
              //                     decoration: BoxDecoration(
              //                         color: Colors.white,
              //                         borderRadius:
              //                             BorderRadius.only(
              //                           topLeft:
              //                               Radius.circular(20),
              //                           topRight:
              //                               Radius.circular(20),
              //                         ),
              //                         image: DecorationImage(
              //                             image: NetworkImage(
              //                                 _resultList[index]
              //                                     ["image"]
              //                                 // snapshot
              //                                 //   .data.docs[index]['image']
              //                                 ),
              //                             fit: BoxFit.fill)
              //                         //: BorderRadius.circular(30)
              //                         ),
              //                     // child: Image.network(
              //                     //   snapshot.data.docs[index]['image'],
              //                     //   width: double.infinity,
              //                     //   // fit: BoxFit.contain,
              //                     //    height: 100,
              //                     //    fit:BoxFit.cover ,
              //                     //   //color: Colors.black,
              //                     // ),
              //                   ),
              //                 ),
              //               ),
              //               Divider(
              //                 color: Colors.black12,
              //                 thickness: 2.0,
              //               ),
              //               GestureDetector(
              //                 onTap: () {
              //                   Navigator.push(
              //                       context,
              //                       MaterialPageRoute(
              //                           builder: (context) =>
              //                               ListMarriage(
              //                                   allEvent: snapshot
              //                                               .data
              //                                               .docs[
              //                                           index]
              //                                       ['state'])));
              //                 },
              //                 child: AutoSizeText(
              //                   _resultList[index]["actor"],
              //                   maxLines: 2,
              //                 ),
              //               ),
              //             ]),
              //           ),
              //         ),
              //       ),
              //     );

              //   } else if (snapshot.connectionState ==
              //       ConnectionState.waiting) {
              //     return const Center(child: CircularProgressIndicator());
              //   } else if (snapshot.data.docs.isEmpty) {
              //     return Center(
              //         child: Text(
              //       'لايوجد بيانات لعرضها',
              //       style: TextStyle(fontSize: 25),
              //     ));
              //   } else {
              //     return const Text('Error');
              //   }
              // }),
              )
        ]),
      ),
    );
  }
}
