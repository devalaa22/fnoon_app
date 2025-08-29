import 'package:flutter/material.dart';
import 'package:fnoon_app_new/Share/BouquetMessege.dart';


class tableEmpty extends StatefulWidget {
  const tableEmpty({super.key});

  

  @override
  State<tableEmpty> createState() => _tableEmptyState();
}

class _tableEmptyState extends State<tableEmpty> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child:Column(
        children: [
          Table(
                    border: TableBorder.all(color:Colors.orange),
                    children: [
                      buildRow(["الفعالية"," "],isHeader: true),
                      buildRow(["مالك الفعالية"," "]),
                      buildRow(["المكان"," "]),
                      buildRow(["ملاحظة"," "]),
                      
                      // buildRow(["الفنان"]),
                    ],
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                fixedSize: const Size(300, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    BouquetMessege(),
                              );
                            },
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text("إحجز موعدك",
                                  style: TextStyle(fontSize: 20,fontFamily: "bein-black")),
                            ))
        ],
      ),

      
    );
  }
}

TableRow buildRow( List<String> cells,{bool isHeader=false})=>
  TableRow(children:
  cells.map((e) {
 final style=TextStyle(
  //  color: Colors.white,
   fontWeight: isHeader? FontWeight.bold :FontWeight.normal,
   );
return Padding(padding:EdgeInsets.all(12),
child: Center(child: Text(e,style: TextStyle(fontSize: 20,fontFamily: "bein-black"),)),);
}).toList()

  );
