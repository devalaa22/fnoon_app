// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/adminAddbouquetmessege.dart';
import '../screens/home/add_event_youtub.dart';
import '../screens/home/add_image_Carousel.dart';
import '../screens/home/deleteImage.dart';
import '../screens/home/home_page.dart';
import '../screens/services/AdminAddAboutUs.dart';
import '../screens/services/AdminAddTools.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
  Future <void> logOut() async{
    print('mmmmmmmmmmmmmm');
   await FirebaseAuth.instance.signOut().then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => HOME_PAGE())));
   print("jjjjjjjjjjjjj");
  }
  
    return Drawer(
        backgroundColor: Colors.orange.withOpacity(0.4),
        child: ListView(padding: EdgeInsets.zero, children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xFFFF6C06)),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset("assest/image/LOGO.png", height: 200)),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 8.0),
              decoration: BoxDecoration(
                  // color: Color(0xFFFF6C06),
                  ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: ListTile(
                      title: Text(
                        " إضافة الاعلانات",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                      ),
                      onTap: (){
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdsImageCarousel()));
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: ListTile(
                      title: Text(
                        " إضافة الفنانيين",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                      ),
                      onTap: (){
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddEventYoutub(key: UniqueKey())));
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: ListTile(
                      title: Text(
                        "إضافة الهيكل الإداري ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                      ),
                      onTap: (){
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminAddAboutUs()));
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: ListTile(
                        title: Text(
                          " إضافة الأدوات المستخدمة",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textDirection: TextDirection.rtl,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminAddTools()));
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: ListTile(
                        title: Text(
                          "جميع الاعلانات ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textDirection: TextDirection.rtl,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DeleteImage()));
                        }
                        ),
                  ),
                 
                   Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: ListTile(
                      title: Text(
                        "إضافة باقة ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                      ),
                      onTap: (){
                        showDialog(
                  context: context,
                  builder: (BuildContext context) => AdminAddbouquetmessege()
                      );
                    
                      },
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: ListTile(
                      title: Text(
                        "تسجيل الخروج ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                      ),
                      onTap:
                      logOut,
                      // (){

                        // Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //                 builder: (context) => Login()));
                     // },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Card(
          //       child: ListTile(
          //     title: const Text('Item 1',textDirection: TextDirection.rtl,),
          //     onTap: () {

          //     },
          //   ),
          // ),
          // Card(
          //       child: ListTile(
          //     title: const Text('Item 1',textDirection: TextDirection.rtl,),
          //     onTap: () {

          //     },
          //   ),
          // ),
        ]));
  }
}
