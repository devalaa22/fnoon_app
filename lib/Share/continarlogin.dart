import 'package:flutter/material.dart';


class Continar_login extends StatelessWidget {
  final String title;
  final Function ontap;
  const Continar_login({super.key,  required this.title,  required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap(),
       //Get.to(HOME_PAGE),
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => HOME_PAGE())),
      // child: Padding(
      //   padding: const EdgeInsets.only(bottom:100),
      child: Container(
          margin: EdgeInsets.only(bottom: 20),
          height: 50,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.orange),
          child: Center(
              child: Text(
            title,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ))),
      // ),
    );
  }
}
