import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fnoon_app_new/models/event_calander.dart';


class EventCard extends StatefulWidget {
  final Event _event;
  // final userid; // يمكنك إلغاء التعليق إذا أردت إضافة الـ userid

  const EventCard(this._event, {super.key});
  // إذا أردت إضافة userid كـ named parameter:
  // const EventCard(this._event, {super.key, this.userid});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
             Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Text('${widget._event.title}'),
                 ),
                 Text(DateFormat('MM/dd/yyyy').format(widget._event.selectedDay).toString()),
                 Text('${widget._event.documentId}'),
               ],),
               // ignore: prefer_const_literals_to_create_immutables
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [

                 GestureDetector(
                   child: Icon(Icons.edit,
                   color: Colors.red,
                   
                   ),
                   onTap:(){
//                showDialog(
//                               context: context,
//                               builder: (BuildContext context) =>
                                  
//                                   EditAdminEventDialog(
// SelectedDay:widget._event.SelectedDay,
// eventList: [],
// //userid:widget.userid,
//                                   )
//                                   );
  
                   }
                  
                 ),Text("تعديل",style: TextStyle(
                   color: Colors.red
                 ),)

               ],)

            ]),
        ),
         ),
    );
  }
}
