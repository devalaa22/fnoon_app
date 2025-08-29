import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fnoon_app_new/screens/home/add_image_Carousel.dart';
import '../../Share/Add_Delete_bouquet.dart';
import '../../Share/containerForAdmin.dart';
import '../../Share/deletTools.dart';
import '../adminAddbouquetmessege.dart';
import '../services/AdminAddTools.dart';
import 'deleteImage.dart';
import 'home_page.dart';

class TypeOfGridview {
  final String imageUrl;
  final String title;
  final VoidCallback onTap;

  TypeOfGridview({
    required this.imageUrl,
    required this.title,
    required this.onTap,
  });
}

class AdmainPage extends StatelessWidget {
  const AdmainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> logOut() async {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HOME_PAGE()));
    }

    List<TypeOfGridview> Images = <TypeOfGridview>[
      TypeOfGridview(
        imageUrl: "",
        title: "إضافة\nالاعلانـات",
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AdsImageCarousel()));
        },
      ),
      TypeOfGridview(
        imageUrl: "",
        title: "إضافة\n الفنانيين",
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => Allbouquets(key: UniqueKey())));
        },
      ),
      TypeOfGridview(
        imageUrl: "",
        title: "إضافة \nالأدوات المستخدمة",
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AdminAddTools()));
        },
      ),
      TypeOfGridview(
        imageUrl: "",
        title: "حذف \nالأدوات المستخدمة",
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DeleteTools()));
        },
      ),
      TypeOfGridview(
        imageUrl: "",
        title: "جـميع \nالاعلانات",
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DeleteImage()));
        },
      ),
      TypeOfGridview(
        imageUrl: "",
        title: "إضافة\n باقة",
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => AdminAddbouquetmessege());
        },
      ),
      TypeOfGridview(
        imageUrl: "",
        title: "حذف وتعديل\n باقة",
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => Allbouquets(key: UniqueKey()));
        },
      ),
      TypeOfGridview(
        imageUrl: "",
        title: "تسجيل \nالخروج",
        onTap: logOut,
      ),
    ];

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assest/image/FnoonBackground.png"),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, right: 25),
              width: width,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "صفحة مسؤول التطبيق",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 2.0,
                children: List.generate(
                  Images.length,
                  (index) => contanierForAdmin(
                    ontap: Images[index].onTap,
                    title: Images[index].title,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
