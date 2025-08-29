import 'package:flutter/material.dart';

class contanierListtileTable extends StatelessWidget {
  final String title;
  final String urlimage;
  const contanierListtileTable(
      {super.key,  required this.title,  required this.urlimage});

  @override
  Widget build(BuildContext context) {
    return 
       Container(
        margin: EdgeInsets.all(10),
        height: 100,
        width: 200,

            decoration: BoxDecoration(
                  color: Color(0XFFF9AC19),
          borderRadius: BorderRadius.circular(20),
          // image: DecorationImage(image: AssetImage(e),
          // fit: BoxFit.cover
          // )
        ),
        child: Row(children: [
          Text(title, style: TextStyle(fontSize: 15, color: Colors.white),),
          Image.asset(
            urlimage
            
          ),
        ],),
       

      //   child:
        //  Chip(
        //   padding: EdgeInsets.only( top: 5),
        //   avatar: Image.asset(
        //     urlimage,height:10 ,
            
        //   ),
        //   label: Center(
        //     child: AutoSizeText(
        //       title,
        //       textAlign:TextAlign.center,
        //       maxLines: 3,
        //       style: TextStyle(fontSize: 40, color: Colors.white),
        //     ),
        //   ),
        //   backgroundColor: Colors.orange,
        // ),
      // ),
    );
  }
}
