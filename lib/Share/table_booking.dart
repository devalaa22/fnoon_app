import 'package:flutter/material.dart';
import 'package:fnoon_app_new/Share/contanierForTable.dart';
import 'package:fnoon_app_new/Share/displayNight.dart';
import 'package:fnoon_app_new/screens/displayMorning.dart';
import 'package:fnoon_app_new/screens/displayeEvent.dart';

class TableBooking extends StatefulWidget {
  DateTime selectedDay;
  TableBooking({super.key, required this.selectedDay});

  @override
  State<TableBooking> createState() => _TableBookingState();
}

class _TableBookingState extends State<TableBooking> {
  bool morrning = false;
  bool even = false;
  bool night = true;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assest/image/FnoonBackground.png"),
                  fit: BoxFit.cover)),
          child: Container(
            child: Column(children: [
              Text(
                "جدول الحجوزات",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontFamily: "bein-black"),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          night = false;
                          morrning = true;
                          even = false;
                        });
                      },
                      child: contanierForTable(
                        title: "صباح",
                        urlimage: 'assest/image/sunny.png',
                        color: morrning ? Colors.grey : Colors.orange,
                      )),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          night = false;
                          morrning = false;
                          even = true;
                        });
                      },
                      child: contanierForTable(
                        title: "عصر",
                        urlimage: 'assest/image/afternoon.png',
                        color: even ? Colors.grey : Colors.orange,
                      )),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          night = true;
                          morrning = false;
                          even = false;
                        });
                      },
                      child: contanierForTable(
                        title: "مساء",
                        urlimage: 'assest/image/night-mode.png',
                        color: night ? Colors.grey : Colors.orange,
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "${widget.selectedDay.year  } ""/"+ "${widget.selectedDay.month  } "+"/"+ "${widget.selectedDay.day  } ",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: "bein-black"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: night
                        ? DisplayNight(
                            selectedDay: widget.selectedDay,
                          )
                        : morrning
                            ? DisplayMorning(
                                selectedDay: widget.selectedDay,
                              )
                            : DisplayEvent(
                                selectedDay: widget.selectedDay,
                              )),
              ),
            ]),
          ),
        ),
      )),
    );

    // DefaultTabController(
    //   length: 3,
    //   child: Directionality(
    //     textDirection: TextDirection.rtl,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         backgroundColor: Color(0XFF707070),
    //         title:
    //            Text(
    //             "جدول الحجوزات",
    //             style: TextStyle(fontSize: 30, color: Colors.white),

    //         ),
    //         bottom: TabBar(tabs: [
    //           Tab(
    //             child: contanierListtileTable(
    //               title: "مساء",
    //               urlimage: "assest/image/night-mode.png",
    //               // icon:Icon(Icons.abc),
    //             ),
    //           ),
    //           Tab(
    //             child: contanierListtileTable(
    //               title: "عصر",
    //               urlimage: "assest/image/afternoon.png",
    //               //icon:Icon(Icons.abc),
    //             ),
    //           ),
    //           Tab(
    //             child: contanierListtileTable(
    //               title: "صباح",
    //               urlimage: "assest/image/sunny.png",
    //               //icon:Icon(Icons.abc),
    //             ),
    //           )
    //         ]),
    //       ),
    //       body: Container(
    //         decoration: BoxDecoration(
    //           //color: Colors.black,
    //             image: DecorationImage(
    //                 image: AssetImage("assest/image/fnoonbackground.png"),
    //                 fit: BoxFit.cover)),
    //         child: TabBarView(

    //           children: [
    //           DisplayNight(selectedDay: widget.selectedDay,),
    //           DisplayEvent(selectedDay: widget.selectedDay,),
    //           DisplayMorning(selectedDay: widget.selectedDay,),
    //         ]),
    //       ),
    //     ),
    //   ),
    // );
  }
}

// import 'package:flutter/material.dart';
// import 'package:test2/Share/contanarListtileTable.dart';
// import 'package:test2/Share/continarlogin.dart';
// import 'package:test2/Share/table.dart';

// import '../screens/aboutas.dart';
// import 'container_listile.dart';
// class TableBooking extends StatefulWidget {
//   const TableBooking({ Key? key }) : super(key: key);

//   @override
//   State<TableBooking> createState() => _TableBookingState();
// }

// class _TableBookingState extends State<TableBooking> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//                     image: AssetImage("assest/image/fnoonbackground.png"),
//                     fit: BoxFit.cover)
//         ),

//         // margin: EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                padding: EdgeInsets.only(top: 10,right: 25),

//                 width: double.infinity,
//                 height: 70,
//                 decoration: BoxDecoration(
//                   color: Colors.grey,

//                 // image: DecorationImage(
//                 //     image: AssetImage("assest/image/fnoonbackground.png"),
//                 //     fit: BoxFit.cover)

//                 ),
//                 child: Align(
//                   alignment: Alignment.topRight,
//                   child: Center(
//                     child: Text("جدول الحجوزات",style: TextStyle(
//                       fontSize: 30,
//                       color: Colors.white
//                     ),
//                     ),
//                   )),
//               ),
//               Container(
//                 width: double.infinity,
//                 height: 30,
//                  decoration: BoxDecoration(
//                 color: Colors.white,
//                     ),
//                     child: Center(child: Text("hhh",style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black
//                     ))),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment:MainAxisAlignment.spaceBetween,

//                 children: [

//                   contanierListtileTable(

//                     title: "مساء",
//                     urlimage: "assest/image/night-mode.png",
//                    // icon:Icon(Icons.abc),
//                   ),

//                   contanierListtileTable(

//                     title: "عصر",
//                     urlimage: "assest/image/afternoon.png",
//         //icon:Icon(Icons.abc),
//                   ),
//                   contanierListtileTable(

//                     title: "صباح",
//                     urlimage:"assest/image/sunny.png",
//         //icon:Icon(Icons.abc),
//                   ),

//                 ],
//               ),
//         SizedBox(
//                 height: 20,
//               ),
//               Container(
//                  decoration: BoxDecoration(
//                 color: Colors.white,

//                     ),
//                 // child: table()
//               ),
//               SizedBox(height: 20,),
//               Continar_login(title:"إحجز موعدك",
//               ontap: (){},),
//         //       SizedBox(height: 20,),
//         //       table(),
//         //       SizedBox(
//         //         height: 20,
//         //       ),
//         // Continar_login(title:"إحجز موعدك",
//         //       ontap: (){},),
//         //        SizedBox(height: 20,),
//         //       table(),
//         //       SizedBox(
//         //         height: 20,
//         //       ),
//         // Continar_login(title:"إحجز موعدك",
//         //       ontap: (){},),
//             ],
//           ),
//         ),
//       ),

//     );

//   }
// }
