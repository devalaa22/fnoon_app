
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fnoon_app_new/models/allEvent.dart';

import '../../Share/dialogSuss.dart';

import 'package:firebase_storage/firebase_storage.dart';

class EditEventYoutub extends StatefulWidget {
  final AllEvent edit;
  const EditEventYoutub(this.edit, {super.key});

  @override
  State<EditEventYoutub> createState() => _EditEventYoutubState();
}

class _EditEventYoutubState extends State<EditEventYoutub> {
  final youtubUrlContllor = TextEditingController();
  final actorContllor = TextEditingController();
  final titleContllor = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String imageName = "";
  late XFile imagepath;
  String imagename="";
  final ImagePicker _picker = ImagePicker();
  FirebaseFirestore fierstorRef = FirebaseFirestore.instance;
  FirebaseStorage storegeRef = FirebaseStorage.instance;
  String collectionName = "AddAllEvent";
  bool _isloading = false;
  getEdit() async {
    youtubUrlContllor.text = widget.edit.youtubUrl;
    actorContllor.text = widget.edit.actor;
    titleContllor.text = widget.edit.title;
    valuestate = widget.edit.state;
    imagename=widget.edit.imageUrl;

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  void initState() {
    // TODO: implement initState
    getEdit();

    super.initState();
  }

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
        fierstorRef.collection(collectionName).doc(uniquekey.id).update({
          'image': uploadPath,
          'title': titleContllor.text,
          'state':
              valuechoose,
          'youtubUrl': youtubUrlContllor.text,
          'actor': actorContllor.text
        }).then((value) => showDialog(
            context: context, builder: (BuildContext context) => DialogScss()));
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
    setState(() {
      imagepath = image!;
      imageName = image.name.toString();
      imagename=image.name.toString();
    });
    }

  final itemsState = [
    {"name": "حفلات تخرج", "value": "حفلات تخرج"},
    {"name": "زواجات", "value": "زواجات"},
    {"name": "مهرجانات", "value": "مهرجانات"},
    {"name": "برامج", "value": "برامج"},
    {"name": "تقارير إخبارية", "value": "تقارير إخبارية"},
    {"name": "مسرحيات", "value": "مسرحيات"},
    {"name": "إعلانات", "value": "إعلانات"},
    {"name": "أفلام وثائقية", "value": "أفلام وثائقية"},
    {"name": "بث مباشر", "value": "بث مباشر"},
    {"name": "أخرى", "value": "أخرى"},
  ];
  String valuestate = "حفلات تخرج";
  late String valuechoose;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assest/image/FnoonBackground.png"),
                  fit: BoxFit.cover)),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.all(30),
              child: _isloading
                  ? Center(child: CircularProgressIndicator())
                  : Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 20,),
                            CircleAvatar(
                                        radius: 40.0,
                                        backgroundImage: NetworkImage(
                                          imagename
                                            // CartDatabaseHelper.list[index].imageUrl
                                            ),
                                        //AssetImage(snapshot.data!.docs[0]['image']) ,
                                      ),
                            TextFormField(
                              controller: titleContllor,
                              cursorColor: Colors.white,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(right: 20),
                                labelText: " اسم الفعالية",
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'الرجاء   كتابة اسم الفعالية';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                            height: 4,
                          ),
                            TextFormField(
                              controller: actorContllor,
                              cursorColor: Colors.white,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(right: 20),
                                  labelText: " اكتب اسم الفنان"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'الرجاء   كتابة اسم الفنان';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                            height: 4,
                          ),
                            TextFormField(
                              controller: youtubUrlContllor,
                              cursorColor: Colors.white,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(right: 20),
                                  labelText: "ادخل رابط الفيديو"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'الرجاء إدخال رابط الفيديو';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                            height: 4,
                          ),
                            SizedBox(
                              width: double.infinity,
                              child: DropdownButton(
                                hint: Text("اختر نوع الفعالية"),
                                value: valuestate,
                                onChanged: (newvalue) {
                                  setState(() {
                                    print(newvalue);
                                    valuechoose = newvalue.toString();
                                    valuestate = newvalue.toString();
                                    print(valuechoose);
                                  });
                                },
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  size: 33,
                                  color: Colors.orange,
                                ),
                                items: itemsState.map((valueitem) {
                                  return DropdownMenuItem(
                                    value: valueitem["value"],
                                    child: Text(valueitem["name"].toString()),
                                  );
                                }).toList(),
                              ),
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
                                  // await FirebaseFirestore.instance.collection('ooo').add({
                                  //   'title': titleContllor.text,
                                  //   'state': stateContllor.text,
                                  //   'youtubUrl': youtubUrlContllor.text,
                                  //   'actor': actorContllor.text
                                  // });
                                }
                              },
                            ),
                            //         Continar_login(title: "kkk",ontap: (){
                            //           Navigator.push(
                            // context, MaterialPageRoute(builder: (context) => HOME_PAGE()));
                            //         },),
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
