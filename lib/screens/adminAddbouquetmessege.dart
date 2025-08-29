// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Share/dialogSuss.dart';
// import '../database/sheredprefsevent.dart';
// import '../models/event_calander.dart';

class AdminAddbouquetmessege extends StatefulWidget {
  
  

  const AdminAddbouquetmessege({super.key}
      );

  @override
  State<AdminAddbouquetmessege> createState() => _AdminAddbouquetmessegeState();
}

class _AdminAddbouquetmessegeState extends State<AdminAddbouquetmessege> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _title2Controller = TextEditingController();
  final TextEditingController _title3Controller = TextEditingController();
  
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                    controller: _titleController,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "الباقة الأولى"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال اسم الباقة الأولى';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _title2Controller,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "الباقة الثانية"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال اسم الباقة الثانية';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _title3Controller,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "الباقة الثالثة"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال اسم الباقة الثالثة';
                      }
                      return null;
                    },
                  ),
                  

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
                              await FirebaseFirestore.instance
                                      .collection('AdminAddbouquetmessege')
                                      .add({
                                    'title': _titleController.text,
                                    'title2': _title2Controller.text,
                                    'title3': _title3Controller.text,
                                    "dateTime": DateTime.now(),
                                    // "dataTime":DataNow()
                                  }).then((value) =>  showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              DialogScss()));
                             _titleController.clear();
                             _title2Controller.clear();
                             _title3Controller.clear();
                             Navigator.pop(context); 
                            }

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
}
