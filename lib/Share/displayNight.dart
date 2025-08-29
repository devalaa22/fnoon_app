import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fnoon_app_new/Share/dialog.dart';
import 'package:fnoon_app_new/Share/table.dart';
import 'package:fnoon_app_new/Share/tableEmpty.dart';

import '../models/event_calander.dart';

class DisplayNight extends StatefulWidget {
  DateTime selectedDay;
  DisplayNight({super.key, required this.selectedDay});

  @override
  State<DisplayNight> createState() => _DisplayNightState();
}

class _DisplayNightState extends State<DisplayNight> {
  int indexList = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('ooo')
            // .where('date', isEqualTo: widget.selectedDay)
            .where('SelectedDay', isEqualTo: widget.selectedDay)
            .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData && snapshot.data!.docs.length > 0) {
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemBuilder: (context, index) {
                if (snapshot.data!.docs[index]['state'] == 'مساء') {
                  indexList = indexList + 1;
                  return Container(
                    child: Column(
                      children: [
                        table(
                            eventData: Event.fromDocument(
  snapshot.data!.docs[index] as DocumentSnapshot<Map<String, dynamic>>,
),
),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                                //padding: EdgeInsets.all(20),
                                alignment: Alignment.bottomCenter,
                                fixedSize: const Size(300, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => dialog(),
                              );
                            },
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text("إحجز موعدك",
                                  style: TextStyle(fontSize: 20)),
                            )),

                        indexList == snapshot.data!.docs.length
                            ? tableEmpty()
                            : Container()
                        // : snapshot.data.docs.length == 1
                        // ? tableEmpty(): snapshot.data.docs.length == 0
                        // ? tableEmpty()
                      ],
                    ),
                  );
                }
                // if(indexList==snapshot.data.docs.length){
                //       print("indexlist");
                //       return tableEmpty();
                // }

                else if (snapshot.data!.docs[index]['state'] == 'مساء'.isEmpty) {
                  return Column(
                    children: [
                      tableEmpty(),
                      // tableEmpty(),
                      // tableEmpty(),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      tableEmpty(),
                      // tableEmpty(),
                      // tableEmpty(),
                    ],
                  );
                }
              },
              itemCount: snapshot.data!.docs.length,
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.data!.docs.isEmpty) {
            return Column(
              children: [
                tableEmpty(),
                // tableEmpty(),
                // tableEmpty(),
              ],
            );
          } else {
            return const Text('Error');
          }
        });
  }
}
