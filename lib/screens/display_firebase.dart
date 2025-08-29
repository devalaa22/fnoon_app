// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fnoon_app_new/models/event_calander.dart';
import 'package:fnoon_app_new/screens/edit_admin_event.dart';
import 'package:fnoon_app_new/screens/services/funcation_firebase.dart';

import '../Share/dialogMessege.dart';
import '../Share/dialogSuss.dart';
import '../models/user.dart';

class DisplayFirebase extends StatefulWidget {
  final DateTime selectedDay;

  DisplayFirebase({super.key, required this.selectedDay});

  @override
  State<DisplayFirebase> createState() => _DisplayFirebaseState();
}

class _DisplayFirebaseState extends State<DisplayFirebase> {
  DatabaseService service = DatabaseService();

  late Future<List<Event>> eventList;
  late List<Event> retrievedEventList;
  late UserInfoModel getUser;
 Future<UserInfoModel> FetchUser(String id) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(id).get();
    return UserInfoModel.fromDocument(snapshot);
  }

  void _getData() async {
    final user = FirebaseAuth.instance.currentUser;
    getUser = (await FetchUser(user!.uid));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  void initState() {
    // retrievedEventList = [];
    //print()
    _initRetrieval();
    _getData();
    super.initState();
  }

  Future<void> _initRetrieval() async {
    var x = await FirebaseFirestore.instance
        .collection('ooo')
        // .where('date', isEqualTo: widget.selectedDay)
        .where('SelectedDay', isEqualTo: widget.selectedDay)
        .get();
    print(x.docs.length);
    // eventList = service.retrieveEmployees(widget.selectedDay);
    // print(eventList);
    // retrievedEventList = await service.retrieveEmployees(widget.selectedDay);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _getData();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("fierbase"),
      // ),
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assest/image/FnoonBackground.png"),
                  fit: BoxFit.cover)),
          child: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
                .collection('ooo')
                // .where('date', isEqualTo: widget.selectedDay)
                .where('SelectedDay', isEqualTo: widget.selectedDay)
                .get(),
            //initialData: [],
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData && snapshot.data!.docs.length > 0) {

                //retrievedEventList= eventList ;
                return ListView.separated(
                    itemCount: snapshot.data!.docs.length,
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemBuilder: (context, index) {
                      Timestamp timestamp =
                          snapshot.data?.docs[index]['SelectedDay'];
                      DateTime time = DateTime.fromMicrosecondsSinceEpoch(
                          timestamp.microsecondsSinceEpoch);
                      // DateTime date = bill.docs[0]['orderDate'].toDate();
                      // header.invoiceDate = bill.docs[0]['orderDate'].toDate();
                      //.invoiceDate = Utils.formatDate(time);

                      return
                          // Dismissible(
                          //   onDismissed: ((direction) async {
                          //      await service.deleteEmployee(snapshot.data.docs[index].id).then((value) =>  showDialog(
                          //                       context: context,
                          //                       builder: (BuildContext context) =>
                          //                       DialogScss()
                          //                       //     DialogMessege(
                          //                       //   messege: "هل أنت متأكد من الحذف",
                          //                       //   funcation:()async{
                          //                       //     await service.deleteEmployee(snapshot.data.docs[index].id);
                          //                       //   },
                          //                       // ),
                          //                     ));

                          //     // await service
                          //     //     .deleteEmployee(snapshot.data!.docs[index].id);
                          //   }),
                          //   // background: Container(
                          //   //   decoration: BoxDecoration(
                          //   //       color: Colors.red,
                          //   //       borderRadius: BorderRadius.circular(16.0)),
                          //   //   padding: const EdgeInsets.only(right: 28.0),
                          //   //   alignment: AlignmentDirectional.centerEnd,
                          //   //   child: const Text(
                          //   //     "حذف",
                          //   //     style: TextStyle(color: Colors.white),
                          //   //   ),
                          //   // ),
                          //   direction: DismissDirection.endToStart,
                          //   resizeDuration: const Duration(milliseconds: 200),
                          //   key: UniqueKey(),
                          // child:
                          Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(16.0)),
                        child: ListTile(
                          onTap: () {
                            //  Navigator.pushNamed(context, "/edit", arguments: retrievedEmployeeList![index]);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          title: Center(
                              child: Text(
                              
                            'اسم الفعالية' "  : " +
                                '    ' +
                                '${snapshot.data?.docs[index]["title"]}',
                                textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                          subtitle: Column(
                            children: [
                              Text(
                                'تاريخ الفعالية' "  : " +
                                    "   " +
                                    '${DateFormat('dd/MM/yyyy').format(time)}',
                                    textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                ' اسم العميل' "  : " +
                                    "   " +
                                    snapshot.data?.docs[index]['clientperson'],
                                    textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                '  مكان الفعالية' "  : " +
                                    "   " +
                                    snapshot.data?.docs[index]['place'],
                                    textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              getUser.role =="account"
                                    ? Column(
                                        children: [
                                          Text(
                                            '  سعر الفعالية' "  : " +
                                                "   " +
                                                snapshot.data?.docs[index]
                                                    ['price'],
                                                    textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            '  العربون' "  : " +
                                                "   " +
                                                snapshot.data?.docs[index]
                                                    ['deposit'],
                                                    textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            '   المبلغ المتبقي' "  : " +
                                                "   " +
                                                snapshot.data?.docs[index]
                                                    ['subprice'],
                                                    textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ],
                                      )
                                    : Container(),
                              Text(
                                '  رقم التواصل' "  : " +
                                    "   " +
                                    snapshot.data?.docs[index]['phonenumber'],
                                    textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                '  فترة الفعالية' "  : " +
                                    "   " +
                                    snapshot.data?.docs[index]['state'],
                                    textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                ' نوع الباقة' "  : " +
                                    "   " +
                                    snapshot.data?.docs[index]['qute'],
                                    textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                EditAdminEventDialog(
                                                     eventData: Event.fromDocument(
    snapshot.data!.docs[index] as DocumentSnapshot<Map<String, dynamic>>,)));
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             EditAdminEventDialog(
                                        //                 eventData: Event.fromMap(
                                        //                     snapshot.data
                                        //                             .docs[index]
                                        //                         as DocumentSnapshot<
                                        //                             Map<String,
                                        //                                 dynamic>>,
                                        //                     snapshot.data
                                        //                         .docs[index].id
                                        //                         .toString()))));
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              DialogMessege(
                                            messege: "هل أنت متأكد من الحذف",
                                            funcation: () async {
                                              await service
                                                  .deleteEmployee(snapshot
                                                      .data!.docs[index].id)
                                                  .then((value) => showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                              context) =>
                                                          DialogScss()).then(
                                                      (value) =>
                                                          Navigator.of(context)
                                                              .pop()));
                                            },
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      )),
                                ],
                              )
                            ],
                          ),
                          // trailing: const Icon(Icons.arrow_right_sharp,color: Colors.red,),
                        ),
                        // ),
                      );
                    });
              } else if (snapshot.connectionState == ConnectionState.waiting) {
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
            },
          ),
        ),
      ),
//
    );
  }
}
