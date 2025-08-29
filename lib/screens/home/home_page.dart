
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fnoon_app_new/Share/container_listile.dart';
import 'package:fnoon_app_new/models/GridItem.dart';
//import 'package:fnoon_app_new/Share/table_booking.dart';
import 'package:fnoon_app_new/screens/calender.dart';
import 'package:fnoon_app_new/screens/home/archives.dart';
import 'package:fnoon_app_new/screens/home/carousel.dart';
//import 'package:fnoon_app_new/screens/home/marriages.dart';
import 'package:fnoon_app_new/screens/home/toolsToUse.dart';
import 'package:url_launcher/link.dart';
import '../../Share/containerSearch.dart';
// import '../../Share/continarlogin.dart';

import '../ComplaintsSuggestions.dart';
import '../CustomDialog.dart';
import '../aboutas.dart';
import '../authenticate/login.dart';
import 'activWeek.dart';
import 'admainPage.dart';

class HOME_PAGE extends StatelessWidget {
  const HOME_PAGE({super.key});

  @override
  Widget build(BuildContext context) {
  List<GridItem> Images = <GridItem>[
  GridItem(
    imageUrl: 'assest/image/calendar.png',
    title: "جــدول \nالحــجــوزات",
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Calender()),
      );
    },
  ),
  GridItem(
    imageUrl: 'assest/image/red-carpet.png',
    title: "فعاليات \nالأسبوع",
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const activeWeek()),
      );
    },
  ),
  GridItem(
    imageUrl: 'assest/image/email.png',
    title: "الشكاوي \nوالاقتراحات",
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ComplaintsSuggestions()),
      );
    },
  ),
  GridItem(
    imageUrl: 'assest/image/movie.png',
    title: "الأرشيف",
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Archives()),
      );
    },
  ),
  GridItem(
    imageUrl: 'assest/image/info.png',
    title: "من نحن",
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AboutAs()),
      );
    },
  ),
  GridItem(
    imageUrl: 'assest/image/camera.png',
    title: "الأدوات \nالمستخدمة",
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ToolaToUse(title: "الأدوات المستخدمة"),
        ),
      );
    },
  ),
];


    final user = FirebaseAuth.instance.currentUser;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: ( user?.email !=null)
        //     ? AppBar(
        //         elevation: 0,
        //         backgroundColor: Color(0XFF707070),
        //       )
        //     : null,
        // drawer: user?.email!=null ? DrawerMenu() : null,
        body: SafeArea(
          child: Container(
            width: width,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage("assest/image/FnoonBackground.png"),
                    fit: BoxFit.cover)),
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SingleChildScrollView(
                          child: Row(
                            children: [
                              (user?.email != null)
                                  ? IconButton(
                                      icon: Icon(Icons.menu),
                                      iconSize: width / 9,
                                      color: Color(0xFFFFFFFF),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AdmainPage()));
                                      },
                                    )
                                  : Container(),
                              IconButton(
                                icon: Icon(Icons.person),
                                
                                iconSize: width / 9,
                                color: Color(0xFFFFFFFF),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Login()),
                                    );
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.phone),
                                iconSize: width / 9,
                                color: Color(0xFFFFFFFF),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          CustomDialog());
                                },
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          "assest/image/logowhite.png",
                          height: height / 9,
                        )
                      ],
                    ),
                  ),
                  // SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.only(
                        top: 10, right: 20, left: 20, bottom: 5),
                    height: height / 13,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.orange),
                        color: Colors.white),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => container_search()));
                      },
                      child: Container(
                         // padding: EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "إبحث عن فعالية",
                                  style: TextStyle(
                                      fontFamily: "ArbFONTS-beIN Normal"),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                container_search()));
                                  },
                                  icon: Icon(
                                    Icons.search,
                                    color: Colors.orange,
                                  )),
                            ],
                          )),
                    ),
                  ),
                  // SizedBox(
                  //   height: 3,
                  // ),
                  Expanded(flex: 3, child: Carousel()),
                  // SizedBox(height: 5),
                  Expanded(
                      flex: 4,
                      child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing:0,

                          childAspectRatio: 2.0,
                          children: List.generate(
  Images.length,
  (index) => contanierListtile(
        ontap: Images[index].onTap,  // <-- هنا فقط
        title: Images[index].title,
        urlimage: Images[index].imageUrl,
      ),
)
)),
                  Link(
                    target: LinkTarget.blank,
                    uri: Uri.parse("https://www.facebook.com/novelsoft22/"),
                    builder: (context, folloeLink) => GestureDetector(
                      onTap: folloeLink,
                      child: Container(
                        color: Colors.transparent,
                        child: Text(
                          "تصميم وبرمجة شركة نوفل سوفت للبرمجيات",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
