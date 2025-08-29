// ignore_for_file: prefer_const_constructors


import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../Share/link.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Stack(children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              //color: Colors.white,
              // shape:BoxShape.rectangle,
              // borderRadius:
              // BorderRadius.all(Radius.circular(20.0)),
              // boxShadow:[
              //   BoxShadow(
              //     color: Colors.black,
              //     blurRadius: 10.0,
              //     offset: Offset(0.0,10.0),
              //   )
              //   ]
              ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                      child: Text(
                    "للتواصل",
                    maxLines: 2,
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  )),
                  SizedBox(
                    width: 60,
                  ),
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.orange,
                      ))
                ],
              ),
              Divider(
                color: Colors.orange,
                thickness: 2.0,
              ),
              contanerAboutAs(
                title: "712344777 - 734288518 -777950310",
                ImageURL: "assest/image/smartphone-call.png",
              ),
              SizedBox(
                height: 10,
              ),
              contanerAboutAs(
                title: "05 309533",
                ImageURL: "assest/image/call.png",
              ),
              SizedBox(
                height: 10,
              ),
              contanerAboutAs(
                title: "700330303",
                ImageURL: "assest/image/whatsapp.png",
              ),
              SizedBox(
                height: 10,
              ),
              contanerAboutAs(
                title: "fnon701@gmail.com",
                ImageURL: "assest/image/email.png",
              ),
              SizedBox(
                height: 10,
              ),
              contanerAboutAs(
                title: "اليمن - حضرموت - المكلا - أربعين شقة",
                ImageURL: "assest/image/location-pin.png",
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(30)),
                            child: link("https://t.me/fnon701",
                                'assest/image/telegram.png')),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(30)),
                          child: link("https://www.instagram.com/fnon701",
                              'assest/image/instagram.png'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(30)),
                          child: link(
                              "https://youtube.com/channel/UCBEFkxU9h85SwKQMgM5R2mA",
                              'assest/image/youtube.png'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(30)),
                          child: link("https://www.twitter.com/fnon701",
                              'assest/image/twitter.png'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(30)),
                          child: link("https://www.facebook.com/fnon701",
                              'assest/image/facebook-app-symbol.png'),
                        ),
                      ]),
                ),
              ),
              Center(
                  child: Text(
                " فنون للإنتاج الإعلامي",
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
            ],
          ),
        )
      ]),
    );
  }
}

class contanerAboutAs extends StatelessWidget {
  String title;
  String ImageURL;
  contanerAboutAs({super.key, required this.title, required this.ImageURL});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          margin: EdgeInsets.only(right: 0,left: 9),
            height: 25,
            width: 25,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.orange, borderRadius: BorderRadius.circular(30)),
            child: Image.asset(
              ImageURL,
            )),
        // SizedBox(
        //   width: 15,
        // ),
        Expanded(
          child: Center(
            child: AutoSizeText(
              title,
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 17),
              maxLines: 1,
            //  minFontSize: 14,
            ),
          ),
        ),
      ]),
    );
  }
}

