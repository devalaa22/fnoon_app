// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:test2/models/event_calander.dart';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fnoon_app_new/models/event_calander.dart';
import 'package:fnoon_app_new/screens/eventcard.dart';
// import 'package:fnoon_app_new/screens/services/auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class CalanderEventDisplay extends StatefulWidget {
  final DateTime selectedDay;
 const CalanderEventDisplay(this.selectedDay, {super.key});

  @override
  State<CalanderEventDisplay> createState() => _CalanderEventDisplayState();
}

class _CalanderEventDisplayState extends State<CalanderEventDisplay> {
 final List<Event> _eventList=[];
// String userid="";


  @override
  void didChangeDependencies() {
    print('fffff');
    super.didChangeDependencies();
    getEventlist();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('event'),),
      body :SafeArea(
        child:
         ListView.builder(
           itemCount: _eventList.length,
          itemBuilder: (context,index){
            return 
            //Text('$index') ;
            EventCard(_eventList[index] );
          },

         )
    ),
    );
  }
  Future getEventlist() async{
    // final uid = AuthService().;
     //final userId = await FirebaseAuth.instance.currentUser!.uid ; 
     //FirebaseAuth.instance.currentUser!().uid;
    var data = await FirebaseFirestore.instance
              .collection('ooo')
              // .where('date', isEqualTo: widget.selectedDay)
              .where('SelectedDay', isEqualTo: widget.selectedDay)

              .get();
              setState(() {

                // _eventList =  List.from(data.docs.map((e){
                  
                // }));
                //  _eventList=List.from(data.docs.map((doc) => Event.fromMap(
                //   doc
                // // doc
                // )
                // )
                // );
                
                // userid= data.docs.map((e) => e.id).toString();
              });
  }

//   Future<void> getUpdataDetelis(Map<String,dynamic> data) async {
//     final user = await FirebaseAuth.instance.currentUser!;
//     return FirebaseFirestore.instance.collection('ooo').doc(user.uid).update(data);
// }

  // Future getEditDetelis() async{
  //   // final uid = AuthService().;
  //    //final userId = await FirebaseAuth.instance.currentUser!.uid ; 
  //    //FirebaseAuth.instance.currentUser!().uid;
  //   var data = await FirebaseFirestore.instance
  //             .collection('ooo')
  //             // .where('date', isEqualTo: widget.selectedDay)
  //             .where('SelectedDay', isEqualTo: widget.selectedDay)
  //             .get();
  //             setState(() {
  //               _eventList=List.from(data.docs.map((doc) => Event.fromDocumentSnapshot(doc.id)));
  //             });
  // }
}
// class CalanderEventDisplay extends StatefulWidget {
//   final DateTime selectedDay;
//   CalanderEventDisplay(this.selectedDay);

//   @override
//   State<CalanderEventDisplay> createState() => _CalanderEventDisplayState();
// }

// class _CalanderEventDisplayState extends State<CalanderEventDisplay> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text("data")),
//         body: StreamBuilder(
//           stream: FirebaseFirestore.instance
//               .collection('orders')
//               .where('date', isEqualTo: widget.selectedDay)
//               .snapshots(),
//           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
//             if (snapshot.hasData) {
//               List<Event> events = [];
//               for (var doc in snapshot.data!.docs) {
//                 var data = doc.data();
//                 // events.add(Event(
//                 //   title:doc.data()['title'],
//                 //   color:data['color'] ?? '',
//                 //   SelectedDay:data['SelectedDay'] = DateTime.now(),
//                 // ));
//               }
//               return Container();
//             }
//           },
//         ));
//   }
// }
