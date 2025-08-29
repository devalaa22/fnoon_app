import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../Share/dialogSuss.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AdminAddAboutUs extends StatefulWidget {
  const AdminAddAboutUs({super.key});


  @override
  State<AdminAddAboutUs> createState() => _AdminAddAboutUsState();
}

class _AdminAddAboutUsState extends State<AdminAddAboutUs> {
  final nameactorContllor = TextEditingController();
  final stateContllor = TextEditingController();
  final imageUrlContllor = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String imageName = "";
  late XFile imagepath;
  final ImagePicker _picker = ImagePicker();
  FirebaseFirestore fierstorRef = FirebaseFirestore.instance;
  FirebaseStorage storegeRef = FirebaseStorage.instance;
  String collectionName = "AdminAddAboutUs";
  bool _isloading = false;

  uploadImage() async {
    setState(() {
      _isloading = true;
    });
    var uniquekey = fierstorRef.collection(collectionName).doc();
    String uploadFieleName =
        '${DateTime.now().millisecondsSinceEpoch}.jpg';
    Reference reference = storegeRef.ref(collectionName).child(uploadFieleName);
    UploadTask uploadTask = reference.putFile(File(imagepath.path));
    uploadTask.snapshotEvents.listen((event) {
      print("${event.totalBytes}/t${event.bytesTransferred}");
    });

    await uploadTask.whenComplete(() async {
      var uploadPath = await uploadTask.snapshot.ref.getDownloadURL();
      if (uploadPath.isNotEmpty) {
        fierstorRef.collection(collectionName).doc(uniquekey.id).set({
          'image': uploadPath,
          'state': stateContllor.text,
          'name': nameactorContllor.text
        }).then((value) =>  showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              DialogScss()));
        setState(() {
        stateContllor.text='';
        nameactorContllor.text='';
        });
        
      } else {
        showmesseg("يوجد خطا");
      }
      setState(() {
        _isloading = false;
        imageName = '';
      });
    });
  }

  showmesseg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: Duration(seconds: 4),
    ));
  }

  imagePicker() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imagepath = image;
        imageName = image.name.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assest/image/background.png"),
                  fit: BoxFit.cover)),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.all(30),
              child: _isloading
                  ? Center(child: CircularProgressIndicator())
                  :Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: nameactorContllor,
                        cursorColor: Colors.white,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: " الأسم ",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'الرجاء   كتابة الاسم ';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: stateContllor,
                        cursorColor: Colors.white,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration:
                            InputDecoration(labelText: "ادخل  المسمى الوظيفي"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'الرجاء  كتابة المسمى الوظيفي   ';
                          }
                          return null;
                        },
                      ),
                      OutlinedButton(
                          onPressed: () {
                            imagePicker();
                          },
                          child: Text("اختار صورة")),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFF6C06),
                            fixedSize: const Size(150, 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: Text("إضافة "),
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          } else {
                            uploadImage();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
