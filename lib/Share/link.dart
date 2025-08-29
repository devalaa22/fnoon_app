
import 'package:flutter/material.dart';

import 'package:url_launcher/link.dart';
Widget link(String url,String imageurl){
  return
   Link(
                target: LinkTarget.blank,
                uri: Uri.parse(url),
                builder:(context,folloeLink)=> GestureDetector(
                  onTap: folloeLink,
                  child: Container(
                     margin: EdgeInsets.only(right: 2,left: 2),
                      // height: 20,
                      // width: 20,
                      // decoration: BoxDecoration(
                      //     shape: BoxShape.circle, color:Colors.orange),
                    child: Image.asset(
                      imageurl,
                      color: Colors.white,
                      //  width: 10,
                      //  height: 10,
                       //fit: BoxFit.cover,
                    ), 
                    ),
                ),
                
              );
}

