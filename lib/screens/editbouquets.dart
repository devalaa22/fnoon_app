// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fnoon_app_new/screens/services/funcation_firebase.dart';

import '../Share/dialogSuss.dart';
// import '../database/sheredprefsevent.dart';
// import '../models/event_calander.dart';

class AdminEditbouquetmessege extends StatefulWidget {
  final String id;
  final String title1;
  final String title2;
  final String title3;

  const AdminEditbouquetmessege({super.key, required this.id, required this.title1, required this.title2, required this.title3});

  @override
  State<AdminEditbouquetmessege> createState() =>
      _AdminEditbouquetmessegeState();
}

class _AdminEditbouquetmessegeState extends State<AdminEditbouquetmessege> {
  getbouquet() async {
    _titleController.text = widget.title1;
    _title2Controller.text = widget.title2;
    _title3Controller.text = widget.title3;

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _title2Controller = TextEditingController();
  final TextEditingController _title3Controller = TextEditingController();
  DatabaseService service = DatabaseService();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    getbouquet();

    super.initState();
  }

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
                              await service
                                  .updatebouquets(
                                      bouquetsid: widget.id,
                                      title1: _titleController.text,
                                      title2: _title2Controller.text,
                                      title3: _title3Controller.text)
                                  .then((value) => showDialog(
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
