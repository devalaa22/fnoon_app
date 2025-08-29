// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/event_calander.dart';
import '../models/user.dart';
import 'services/funcation_firebase.dart';

class EditAdminEventDialog extends StatefulWidget {
  // final DateTime SelectedDay;
  // final List<Object> eventList;
  //final String userid;
  final Event eventData;

  const EditAdminEventDialog({super.key, 
    required this.eventData,
    //required this.userid
  });

  @override
  State<EditAdminEventDialog> createState() => _EditAdminEventState();
}

class _EditAdminEventState extends State<EditAdminEventDialog> {
  final TextEditingController _eventController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _clientpersonController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _depositController = TextEditingController();
  final TextEditingController _subpriceController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final TextEditingController _actorController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DatabaseService service = DatabaseService();
  late UserInfoModel getUser;
  late List<Map<String, String>> itemsStatequet;
  late List<DocumentSnapshot> listquet;
  late String valuequet;
  late String valuechoosequet;
  Future<UserInfoModel> FetchUser(String id) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(id).get();
    return UserInfoModel.fromDocument(snapshot);
  }

  // void _getData() async {
  //   final user = FirebaseAuth.instance.currentUser;
  //   getUser = (await FetchUser(user.uid));
  //   Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  // }
  @override
  void initState() {
    // TODO: implement initState
    getevent();

    super.initState();
  }

  // Timestamp timestamp = widget.eventData.SelectedDay;
  // DateTime time =
  //     DateTime.fromMicrosecondsSinceEpoch(timestamp.microsecondsSinceEpoch);
//  DateTime dateTime = eventData.SelectedDay;
  // getEditDetelis() async {
  //   final uid = AuthService();
  //   final userId = await FirebaseAuth.instance.currentUser!.uid;
  //   var data = await FirebaseFirestore.instance
  //       .collection('ooo')
  //       .doc("Cvbwi2c9bCMggywsxJwa");

  //   data.update({
  //     'title': _eventController.text,
  //     'state': _colorController.text,
  //   });
  //   return data;
  // }

  @override
  Widget build(BuildContext context) {
    //Timestamp myTimeStamp = Timestamp.fromDate(widget.eventData.SelectedDay);
    // DateTime time =
    //     DateTime.fromMicrosecondsSinceEpoch(widget.eventData.SelectedDay.microsecondsSinceEpoch);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Stack(children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _eventController,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "إسم الفعالية"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال إسم الفعالية';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _actorController,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: " اسم الفنان "),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال   اسم الفنان';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _placeController,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: " مكان الفعالية "),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال مكان الفعالية';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _clientpersonController,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "مالك الفعالية"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال مالك الفعالية';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _stateController,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "حالة الفعالية"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال حالة الفعالية';
                      }
                      return null;
                    },
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "نوع باقة",
                        style: TextStyle(color: Colors.orange),
                      )),
                      Container(
                    // width: double.infinity,
                    child: DropdownButton(
                      isExpanded: true,
                      hint: Text("اختر الباقة"),
                      value: valuequet,
                      onChanged: (newvalue) {
                        setState(() {
                          valuechoosequet = newvalue.toString();
                          valuequet = newvalue.toString();
                          print(valuechoosequet);
                        });
                      },
                      icon: Icon(
                        Icons.arrow_drop_down,
                        size: 33,
                        color: Colors.orange,
                      ),
                      items: itemsStatequet.map((valueitem) {
                        return DropdownMenuItem(
                          value: valueitem["value"],
                          child: Container(
                            child: AutoSizeText(
                              valueitem["name"].toString(),
                              maxLines: 1,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  TextFormField(
                    controller: _phonenumberController,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "رقم الجوال "),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 9) {
                        return 'الرجاء إدخال رقم الجوال ';
                      }
                      return null;
                    },
                  ),
                  getUser.role == "account"
                          ? Column(
                              children: [
                                TextFormField(
                                  controller: _priceController,
                                  cursorColor: Colors.white,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      labelText: "سعر الفعالية "),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'الرجاء إدخال سعر الفعالية ';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: _depositController,
                                  cursorColor: Colors.white,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  decoration:
                                      InputDecoration(labelText: " العربون"),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'الرجاء إدخال العربون ';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: _subpriceController,
                                  cursorColor: Colors.white,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      labelText: "المبلغ المتبقي "),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'الرجاء إدخال  المبلغ المتبقي';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            )
                          : Container(),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("cansel")),
                      TextButton(
                          onPressed: () async {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            } else {
                            if (_formKey.currentState!.validate()) {
  Event updateEvent = Event(
    documentId: widget.eventData.documentId, // لازم تحافظ على نفس الـ documentId
    clientPerson: _clientpersonController.text,
    place: _placeController.text,
    actor: _actorController.text,
    price: _priceController.text,
    deposit: _depositController.text,
    subPrice: _subpriceController.text,
    phoneNumber: _phonenumberController.text,
    selectedDay: widget.eventData.selectedDay, // لا داعي لعمل parse
    title: _eventController.text,
    qute: valuechoosequet ?? widget.eventData.qute,
    state: _stateController.text,
  );

  await service.updateEmployee(updateEvent, widget.eventData.documentId);
}

                              // if (_eventController.text.isEmpty) {
                              // return;
                            }

                            // SharedPref pre = SharedPref();
                            //  await pre.save("user", selectedEvents);

                            _eventController.clear();
                            _stateController.clear();
                            _placeController.clear();
                            _actorController.clear();
                            _clientpersonController.clear();
                            _phonenumberController.clear();
                            _priceController.clear();
                            _depositController.clear();
                            _stateController.clear();
                            Navigator.pop(context);
                            setState(() {});

                            return;
                          },
                          child: Text("ok"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  getevent() async {
    _eventController.text = widget.eventData.title;
    _stateController.text = widget.eventData.state;
    _placeController.text = widget.eventData.place;
    _actorController.text = widget.eventData.actor;
    _subpriceController.text = widget.eventData.subPrice;
    _clientpersonController.text = widget.eventData.clientPerson;
    _phonenumberController.text = widget.eventData.phoneNumber;
    _priceController.text = widget.eventData.price;
    _depositController.text = widget.eventData.deposit;
    valuequet = widget.eventData.qute ;
    final user = FirebaseAuth.instance.currentUser;
    
    listquet = (await service.retrievebouquet());
    itemsStatequet = [
      {"name": listquet[0]['title'], "value": listquet[0]['title']},
      {"name": listquet[0]['title2'], "value": listquet[0]['title2']},
      {"name": listquet[0]['title3'], "value": listquet[0]['title3']},
    ];
    getUser = (await FetchUser(user!.uid));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }
}
