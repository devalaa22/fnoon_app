import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart';

import 'deleteImage.dart';

class AdsImageCarousel extends StatefulWidget {
  const AdsImageCarousel({super.key});


  @override
  State<AdsImageCarousel> createState() => _AdsImageCarouselState();
}

class _AdsImageCarouselState extends State<AdsImageCarousel> {
  final imageContllor = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String imageName = "";
  late XFile imagepath;
  final ImagePicker _picker = ImagePicker();
  FirebaseFirestore fierstorRef = FirebaseFirestore.instance;
  FirebaseStorage storegeRef = FirebaseStorage.instance;
  String collectionName = "image";
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
        fierstorRef
            .collection(collectionName)
            .doc(uniquekey.id)
            .set({'image': uploadPath}).then((value) => Navigator.push(context,
                MaterialPageRoute(builder: (context) => DeleteImage())));
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
      //  imageContllor.text=Faker().
    });
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
                  image: AssetImage("assest/image/FnoonBackground.png"),
                  fit: BoxFit.cover)),
          child: Center(
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  
                  borderRadius: BorderRadius.circular(20),
                  
                  
                  ),
              margin: EdgeInsets.all(30),
              child: _isloading
                    ? Center(child: CircularProgressIndicator())
                    :Form(
                key: _formKey,
                child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // TextFormField(
                          //   controller: imageContllor,
                          //   cursorColor: Colors.white,
                          //   textInputAction: TextInputAction.next,
                          //   keyboardType: TextInputType.emailAddress,
                          //   decoration:
                          //       InputDecoration(labelText: "ادخل الاعلان"),
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'الرجاء  اختيار صورة';
                          //     }
                          //     return null;
                          //   },
                          // ),

                          OutlinedButton(
                              onPressed: () {
                                imagePicker();
                              },
                              child: Text("اختار صورة")),
                          
                          SizedBox(height: 30,),
                          ElevatedButton(
                              child: Text("رفع الصورة"),
                              onPressed: () {
                                uploadImage();
                              }
                              // pickImage,
                              ),
                              Text(imageName),
                              
                          
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
