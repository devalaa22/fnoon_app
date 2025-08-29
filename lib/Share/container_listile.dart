import 'package:flutter/material.dart';

class contanierListtile extends StatelessWidget {
  final String title;
  final String urlimage;
  final Function ontap;
  const contanierListtile({super.key, required this.title, required this.urlimage, required this.ontap});

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
            height: height / 10,
            width: width / 2,
            // color:Colors.transparent,
            margin: EdgeInsets.all(8),
            //padding: EdgeInsets.all(10),
            padding: EdgeInsets.only(right: 10, left: 25),
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    title,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    //maxLines: 3,
                    style: TextStyle(
                        overflow: TextOverflow.visible,
                        fontSize: 15,
                        height:
                            1.4, // the height between text, default is null
                        letterSpacing: 1.0,
                        //wordSpacing: 5,
                        // letterSpacing: ,
                        color: Colors.white,
                        fontFamily: "bein-black"),
                  ),
                ),

                SizedBox(
                  width: 2,
                ),
                Image.asset(
                  urlimage,
                  height: height / 15,
                  width: width / 9,
                  // color: Colors.black,
                ),
              ],
            )
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
