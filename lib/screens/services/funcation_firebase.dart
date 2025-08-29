import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fnoon_app_new/models/event_calander.dart';


class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  addEmployee(Event employeeData) async {
    await _db.collection("ooo").add(employeeData.toMap());
  }

  updateEmployee(Event employeeData, String eventid) async {
    await _db.collection("ooo").doc(eventid).update(employeeData.toMap());
  }

  Future<void> deleteEmployee(String documentId) async {
    await _db.collection("ooo").doc(documentId).delete();
  }

  Future<void> deleteEventYOUtub(String documentId) async {
    await _db.collection("AddAllEvent").doc(documentId).delete();
  }

  Future<void> deleteImage(String documentId) async {
    await _db.collection("image").doc(documentId).delete();
  }

  Future<void> deleteTools(String documentId) async {
    await _db.collection("AdminAddTools").doc(documentId).delete();
  }

  Future<void> deletebouquets(String documentId) async {
    await _db.collection("AdminAddbouquetmessege").doc(documentId).delete();
  }

  updatebouquets(
      {required String bouquetsid, required String title1, required String title2, required String title3}) async {
    await _db.collection("AdminAddbouquetmessege").doc(bouquetsid).update({
      'title': title1,
      'title2': title2,
      'title3': title3,
    });
  }

  Future<List<DocumentSnapshot>> retrievebouquet() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('AdminAddbouquetmessege')
        .orderBy('dateTime', descending: true)
        .get();
    return snapshot.docs;
        // .map((docSnapshot) => bouquetmessege.Map(docSnapshot))
        // .toList();
  }
  // Future<List<Event>> retrieveEmployees(DateTime selectedDay) async {
  //    QuerySnapshot<Map<String, dynamic>> snapshot = await _db
  //             .collection('ooo')
  //             // .where('date', isEqualTo: widget.selectedDay)
  //             .where('SelectedDay', isEqualTo:selectedDay)
  //             .get();
  //             //print(snapshot.docs.length);
  //   // QuerySnapshot<Map<String, dynamic>> snapshot =
  //   //     await _db.collection("ooo").get();
  //   return List.from(snapshot.docs.map((docSnapshot) => Event.fromMap(
  //          docSnapshot)));

  // snapshot.docs
  //     .map((docSnapshot) => Event.fromMap(docSnapshot))
  //     .toList();
}
// Future  retrieveEmployees2(DateTime selectedDay) async {
//      QuerySnapshot<Map<String, dynamic>> snapshot = await _db
//               .collection('ooo')
//               // .where('date', isEqualTo: widget.selectedDay)
//               .where('SelectedDay', isEqualTo:selectedDay)
//               .get();    
//               //print(snapshot.docs.length);
//     // QuerySnapshot<Map<String, dynamic>> snapshot =
//     //     await _db.collection("ooo").get();
//     return List.from(snapshot.docs.map((docSnapshot) => Event.fromMap(
//            docSnapshot)));

// }

// }


