

//  class DatabaseService{
     
//  final FirebaseFirestore _db = FirebaseFirestore.instance;

//   addEvent( Event eventData) async {
//     await _db.collection("Eventes").add(eventData.toMap());
//   }

// DatabaseService<Event> eventDBS = DatabaseService<Event>
// ("events",fromDS:(id,data)=> Event.fromDocumentSnapshot(id,data!), toMap:
// (event)=>event.toMap());
  //    updateEmployee(Employee employeeData) async {
  //   await _db.collection("Employees").doc(employeeData.id).update(employeeData.toMap());
  // }

  // Future<void> deleteEmployee(String documentId) async {
  //   await _db.collection("Employees").doc(documentId).delete();

  // }

  // Future<List<Employee>> retrieveEmployees() async {
  //   QuerySnapshot<Map<String, dynamic>> snapshot =
  //       await _db.collection("Employees").get();
  //   return snapshot.docs
  //       .map((docSnapshot) => Employee.fromDocumentSnapshot(docSnapshot))
  //       .toList();
  // }
 
    //final CollectionReference eventCollecti = FirebaseFirestore.instance.collection("event");
//  }

