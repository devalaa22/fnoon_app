import 'package:flutter/material.dart';


class contanierForTable extends StatelessWidget {
  final String title;
  final String urlimage;
  final Color color;
  const contanierForTable(
      {super.key,  required this.title,  required this.urlimage, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10,left: 9),
           padding: EdgeInsets.only(right: 10,left: 10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
            
          ),
          height: 50,
          width: 100,
          child:
           Row(
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               
              
               Expanded(
                 child: Image.asset(
                             urlimage,
                             height: 30,
                             width: 70,
                             // color: Colors.black,
                           ),
               ),
               FittedBox(
                fit:BoxFit.contain,
                 child: Text(
                  title,
                  textAlign:TextAlign.center,
                  maxLines: 3,
                  style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: "bein-black"), 
                  ),
               ),
             ],
           ),
           
      
      //  Container(
      //     decoration: BoxDecoration(
      //       color: Colors.orange,
      //       borderRadius: BorderRadius.circular(30),
            
      //     ),
      //     height: 30,
      //     width: 50,
      //    // color:Colors.transparent,
      //     margin: EdgeInsets.all(10),
      //     padding: EdgeInsets.only(right: 7,left: 5),
      //     child:Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Expanded(
      //         child:
      //         AutoSizeText(
      //         title,
      //         textAlign:TextAlign.center,
      //         maxLines: 3,
      //         style: TextStyle(fontSize: 25, color: Colors.white), 
      //         )
      //       ),
      //         Image.asset(
      //         urlimage,
      //         height: 10,
      //         width: 10,
      //         // color: Colors.black,
      //       ),
           
      //       ],
      //     )
      //     //  Chip(
      //     //   padding: EdgeInsets.only(right: 5, top: 5),
            
      //     //   label: AutoSizeText(
      //     //     title,
      //     //     textAlign:TextAlign.center,
      //     //     maxLines: 3,
      //     //     style: TextStyle(fontSize: 25, color: Colors.white),
      //     //   ),
      //     //   avatar: Image.asset(
      //     //     urlimage,
      //     //     height: 30,
      //     //     // color: Colors.black,
      //     //   ),
      //     //   backgroundColor: Colors.orange,
      //     // ),
      //   ),
      
    );
  }
}
