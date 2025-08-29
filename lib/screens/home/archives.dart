import 'package:flutter/material.dart';
import 'package:fnoon_app_new/Share/container_listile.dart';
import 'package:fnoon_app_new/screens/home/marriages.dart';
import '../../models/type_of_GridView.dart';

class Archives extends StatelessWidget {
  const Archives({super.key}); // إضافة key اختياري

  @override
  Widget build(BuildContext context) {
 List<TypeOfGridview> Images = <TypeOfGridview>[
  TypeOfGridview(
    imageUrl: 'assest/image/wedding-ring.png',
    title: "زواجــات",
    function: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Marriages(title: "زواجات")),
      );
    },
  ),
  TypeOfGridview(
    imageUrl: 'assest/image/mortarboard.png',
    title: "حفلات \nالتخرج",
    function: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Marriages(title: "حفلات تخرج")),
      );
    },
  ),
  TypeOfGridview(
    imageUrl: 'assest/image/party.png',
    title: "مهرجانات",
    function: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Marriages(title: "مهرجانات")),
      );
    },
  ),
  TypeOfGridview(
    imageUrl: 'assest/image/television.png',
    title: "برامج",
    function: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Marriages(title: "برامج")),
      );
    },
  ),
  TypeOfGridview(
    imageUrl: 'assest/image/newspaper-folded.png',
    title: "تقارير \nإخبارية",
    function: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Marriages(title: "تقارير إخبارية")),
      );
    },
  ),
  TypeOfGridview(
    imageUrl: 'assest/image/theater.png',
    title: "مسرحيات",
    function: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Marriages(title: "مسرحيات")),
      );
    },
  ),
  TypeOfGridview(
    imageUrl: 'assest/image/advertising.png',
    title: "إعلانات",
    function: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Marriages(title: "إعلانات")),
      );
    },
  ),
  TypeOfGridview(
    imageUrl: 'assest/image/movie.png',
    title: "أفلام \nوثائقية",
    function: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Marriages(title: "أفلام وثائقية")),
      );
    },
  ),
  TypeOfGridview(
    imageUrl: 'assest/image/broadcast.png',
    title: "بث \nمباشر",
    function: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Marriages(title: "بث مباشر")),
      );
    },
  ),
  TypeOfGridview(
    imageUrl: 'assest/image/ellipsis.png',
    title: "أخرى",
    function: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Marriages(title: "أخرى")),
      );
    },
  ),
];


    return Directionality(
      textDirection: TextDirection.rtl, // استخدم RTL إذا أردت اللغة العربية
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assest/image/FnoonBackground.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, right: 25),
                width: double.infinity,
                height: 70,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "الأرشيف",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 2.0,
                  children: List.generate(
                    Images.length,
                    (index) => contanierListtile(
                      ontap: Images[index].function,
                      urlimage: Images[index].imageUrl,
                      title: Images[index].title,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
