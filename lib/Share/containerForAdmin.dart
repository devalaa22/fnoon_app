import 'package:flutter/material.dart';

class contanierForAdmin extends StatelessWidget {
  final String title;
  final Function ontap;
  const contanierForAdmin({super.key, required this.title, required this.ontap});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () => ontap(),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(30),
            ),
            height: height / 6,
            width: width / 2,
            // color:Colors.transparent,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(right: 5, left: 10),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          //maxLines: 3,
                          style: TextStyle(
                              overflow: TextOverflow.visible,
                              fontSize: 15,
                              color: Colors.white,
                              fontFamily: "bein-black"),
                        ),
                      ),
              ],
            ),
                
            //  Chip(
            //   padding: EdgeInsets.only(right: 5, top: 5),

            //   label: AutoSizeText(
            //     title,
            //     textAlign:TextAlign.center,
            //     maxLines: 3,
            //     style: TextStyle(fontSize: 25, color: Colors.white),
            //   ),
            //   avatar: Image.asset(
            //     urlimage,
            //     height: 30,
            //     // color: Colors.black,
            //   ),
            //   backgroundColor: Colors.orange,
            // ),
            ),
      ),
    );
  }
}
