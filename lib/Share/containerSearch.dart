import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fnoon_app_new/models/event_calander.dart';

class container_search extends StatefulWidget {
  final String title;

  final IconData prefixIcon;

  const container_search({super.key, this.title = "بحث", this.prefixIcon = Icons.search});

  @override
  State<container_search> createState() => _container_searchState();
}

class _container_searchState extends State<container_search> {
  final scearchContllor = TextEditingController();
  List _allResult = [];
  List _resultList = [];
  late Future resultLoaded;
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
    var data = await FirebaseFirestore.instance
        .collection("ooo")
        .where("SelectedDay", isLessThanOrEqualTo: DateTime.now())
        .orderBy("SelectedDay", descending: true)
        .get();

    setState(() {
      _allResult = data.docs;
    });

    searchResultsList();
    return "data.docs";
  }

 searchResultsList() {
  var showResult = [];
  if (scearchContllor.text.isNotEmpty) {
    for (var event in _allResult) {
      // تحويل البيانات إلى كائن Event
      var eventObj = Event.fromJson(event as Map<String, dynamic>);
      var title = eventObj.title;

      if (title.contains(scearchContllor.text)) {
        showResult.add(event);

        setState(() {
          _resultList = showResult;
        });
      }
    }
  } else {
    // إذا كان البحث فارغ، نعرض القائمة كاملة
    showResult = List.from(_allResult);

    setState(() {
      _resultList = showResult;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:
            // Container(
            //   margin: EdgeInsets.all(20),
            //   height: 40,
            //   width: double.infinity,
            //   //290,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(50),
            //       border: Border.all(color: Color(0xFFFF6C06)),
            //       color: Colors.white),
            //   child: Padding(
            //     padding: const EdgeInsets.only(right: 20),
            //     child:
            Container(
          width: width,
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assest/image/FnoonBackground.png"),
                  fit: BoxFit.cover)),
          // margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child:
                 Container(
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.only(right: 10),
                  height: height / 13,
                  width: width,
                  //290,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Color(0xFFFF6C06)),
                      color: Colors.white),
                  child: TextField(
                    controller: scearchContllor,
                    // textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                        hintText: widget.title,
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
//hintTextDirection: TextDirection.rtl,
                        prefixIcon: Icon(
                          widget.prefixIcon,
                          size: width / 13,
                          color: Color(0xFFFF6C06),
                        ),
                        border: InputBorder.none),
                  ),
                ),
              ),
              Expanded(
                  child: _resultList.isEmpty
                      ? 
                      ListView.builder(
                          itemCount: _allResult.length,
                          itemBuilder: (BuildContext context, int index) {
                            Timestamp timestamp =
                                _allResult[index]['SelectedDay'];
                            DateTime time = DateTime.fromMicrosecondsSinceEpoch(
                                timestamp.microsecondsSinceEpoch);
                            return 
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Table(
                                border: TableBorder.all(color: Colors.orangeAccent),
                                children: [
                                  buildRow([
                                   
                                    _allResult[index]["title"] ?? " ",
                                     " اسم الفعالية",
                                  ]),
                                  buildRow([
                                    _allResult[index]['state'] ?? " ",
                                    " فترة الفعالية",
                                  ], isHeader: true),
                                  buildRow([
                                    
                                    '${DateFormat('dd/MM/yyyy').format(time)}',
                                    " تاريخ الفعالية",
                                  ]),
                                  buildRow([
                                    
                                    _allResult[index]['actor'] ?? " ",
                                    "الفنان",
                                  ]),
                                  buildRow([
                                    
                                    _allResult[index]['place'] ?? " ",
                                    "مكان الفعالية",
                                  ]),
                                  buildRow([
                                    _allResult[index]['qute'] ?? " ",
                                    " نوع الباقة",
                                  ]),
                                  
                                  // buildRow(["الفنان"]),
                                ],
                              ),
                            );

                            //      Card(
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
                            //                 _allResult[index]['state']??" ",
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
                            //                 _allResult[index]["title"]??" ",
                            //                 style: TextStyle(
                            //                     fontFamily: "ArbFONTS-beIN Normal",
                            //                     fontSize: width/20,
                            //                     fontWeight: FontWeight.bold),
                            //               ),
                            //               Text(
                            //                 _allResult[index]['place']??" ",
                            //                 style: TextStyle(
                            //                     fontFamily: "ArbFONTS-beIN Normal",
                            //                     fontSize: width/20,
                            //                     fontWeight: FontWeight.bold),
                            //               ),
                            //               Text(
                            //                 _allResult[index]['actor']??" ",
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
                            // Card(
                            //     color: Colors.white,
                            //     child: Column(
                            //       children: [
                            //         Text(_allResult[index]['title']),
                            //         Text(_allResult[index]['place']),
                            //         Text(_allResult[index]['actor'])
                            //       ],
                            //     ));
                            //Text("لايوجد نتائج بحث");

                            //var event =Event.Map(_resultList[index]);
                          })
                      : ListView.builder(
                          itemCount: _resultList.length,
                          itemBuilder: (BuildContext context, int index) {
                            Timestamp timestamp =
                                _resultList[index]['SelectedDay'];
                            DateTime time = DateTime.fromMicrosecondsSinceEpoch(
                                timestamp.microsecondsSinceEpoch);
                            return  
                             Container(
                              margin: EdgeInsets.all(10),
                              child: Table(
                                border: TableBorder.all(color: Colors.orangeAccent),
                                children: [
                                  buildRow([
                                    
                                    
                                    _resultList[index]['state'] ?? " ",
                                    "فترة الفعالية",
                                  ], isHeader: true),
                                  buildRow([
                                    
                                    '${DateFormat('dd/MM/yyyy').format(time)}',
                                    " تاريخ الفعالية",
                                  ]),
                                  buildRow([
                                    
                                    _resultList[index]['actor'] ?? " ",
                                    "الفنان",
                                  ]),
                                  buildRow([
                                    _resultList[index]['place'] ?? " ",
                                    "مكان الفعالية",
                                  ]),
                                  buildRow([
                                   
                                    _resultList[index]["title"] ?? " ",
                                     " اسم الفعالية",
                                  ]),
                                  buildRow([
                                    _allResult[index]['qute'] ?? " ",
                                    " نوع الباقة",
                                  ]),
                                  // buildRow(["الفنان"]),
                                ],
                              ),
                            );

                            //  Card(
                            //   margin: EdgeInsets.all(
                            //     width / 20,
                            //   ),
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
                            //                     fontFamily:
                            //                         "ArbFONTS-beIN Normal",
                            //                     fontSize: width / 20,
                            //                     fontWeight: FontWeight.bold),
                            //               ),
                            //               Text(
                            //                 _resultList[index]['state'] ?? " ",
                            //                 style: TextStyle(
                            //                     fontFamily:
                            //                         "ArbFONTS-beIN Normal",
                            //                     fontSize: width / 20,
                            //                     fontWeight: FontWeight.bold),
                            //               ),
                            //             ],
                            //           ),
                            //           Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.spaceBetween,
                            //             children: [
                            //               Text(
                            //                 _resultList[index]["title"] ?? " ",
                            //                 style: TextStyle(
                            //                     fontFamily:
                            //                         "ArbFONTS-beIN Normal",
                            //                     fontSize: width / 20,
                            //                     fontWeight: FontWeight.bold),
                            //               ),
                            //               Text(
                            //                 _resultList[index]['place'] ?? " ",
                            //                 style: TextStyle(
                            //                     fontFamily:
                            //                         "ArbFONTS-beIN Normal",
                            //                     fontSize: width / 20,
                            //                     fontWeight: FontWeight.bold),
                            //               ),
                            //               Text(
                            //                 _resultList[index]['actor'] ?? " ",
                            //                 style: TextStyle(
                            //                     fontFamily:
                            //                         "ArbFONTS-beIN Normal",
                            //                     fontSize: width / 20,
                            //                     fontWeight: FontWeight.bold),
                            //               ),
                            //             ],
                            //           )

                            //           //Text('اسم الفعالية'+" :  "+'${widget.allEvent[index].title}'),
                            //         ]),
                            //   ),
                            // );
                            // Card(
                            //     color: Colors.white,
                            //     child: Column(
                            //       children: [
                            //         Text(_resultList[index]['title']),
                            //         Text(_resultList[index]['place']),
                            //         Text(_resultList[index]['actor'])
                            //       ],
                            //     ));
                            //Text("لايوجد نتائج بحث");

                            //var event =Event.Map(_resultList[index]);
                          }))
            ],
          ),
        ),
      ),
      //   ),
    );
  }
}

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
