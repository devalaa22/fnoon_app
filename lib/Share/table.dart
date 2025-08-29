import 'package:flutter/material.dart';

import '../models/event_calander.dart';

class table extends StatefulWidget {
  final Event eventData;
  const table({super.key,  required this.eventData});

  @override
  State<table> createState() => _tableState();
}

class _tableState extends State<table> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child:Table(
                border: TableBorder.all(color:Colors.orange),
                
                children: [
                  buildRow(["الفعالية",widget.eventData.title,],isHeader: true),
                  buildRow(["مالك الفعالية",widget.eventData.clientPerson,]),
                  buildRow(["المكان",widget.eventData.place,]),
                  buildRow(["نوع الباقة",widget.eventData.qute,]),
                  buildRow(["ملاحظة",widget.eventData.actor,]),
                  // buildRow(["الفنان"]),
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
child: Center(child: Text(e,textAlign:TextAlign.center ,
style: TextStyle(fontSize: 20,fontFamily: "bein-black" ),)),);
}).toList()

  );
