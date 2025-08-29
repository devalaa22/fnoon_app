// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// import '../models/allEvent.dart';

// class CartDatabaseHelper {
//   static final CartDatabaseHelper instance = CartDatabaseHelper.init();

//   static Database _database;
//   CartDatabaseHelper.init();

//   Future<Database> get database async {
//     if (_database != null) return _database;

//     _database = await _initDb('images.db');
//     return _database;
//   }

//   Future<Database> _initDb(String filePath) async {
//     final dbpath = await getDatabasesPath();
//     final path = join(dbpath, filePath);
//     return await openDatabase(path, version: 1, onCreate: _createDB);
//   }

//   Future close() async {
//     final db = await instance.database;
//     db.close();
//   }

//   Future _createDB(Database db, int version) async {
//     await db.execute('''
//     CREATE TABLE $tableAllEvent (
//     ${AllEventFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
//     ${AllEventFields.title} TEXT NOT NULL,
//     ${AllEventFields.youtubUrl} TEXT NOT NULL,
//     ${AllEventFields.state} TEXT NOT NULL,
//     ${AllEventFields.imageUrl} TEXT NOT NULL,
//     ${AllEventFields.actor} TEXT NOT NULL
    
    
    
    
//     )
//     ''');
//   }

//   Future<void> insert(AllEvent model) async {
//     var dbClient = await database;
//     final id = await dbClient.insert(
//       tableAllEvent,
//       model.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//     getAllEvents();
//   }
//   static List<AllEvent> list=[];
//   Future<List<AllEvent>> getAllEvents() async {
//     try {
//       var dbClient = await database;
//       List<Map<String, dynamic>> maps = await dbClient.query('$tableAllEvent');

//        list = maps.isNotEmpty
//           ? maps.map((product) => AllEvent.fromJson(product)).toList()
//           : [];
//       return list;
//     } catch (e) {
//       print(e);
//       return List<AllEvent>();
//     }
//   }

//   Future<AllEvent> getEvents(int id) async {
//     var dbClient = await database;
//     final maps = await dbClient.query(
//       tableAllEvent,
//       columns: AllEventFields.values,
//       where: '${AllEventFields.id}=?',
//       whereArgs: [id],
//     );
//   }

//   deleteSingleEvent(int id) async {
//     var dbClient = await database;
//     await dbClient
//         .delete(tableAllEvent, where: '$AllEventFields.id = ?', whereArgs: [id]);
//   }

//   deleteAllProduct() async {
//     var dbClient = await database;
//     await dbClient.delete('$tableAllEvent');
//   }

//   Future<void> updateEvent(AllEvent model) async {
//     // Get a reference to the database.
//     final db = await database;

//     // Update the given Dog.
//     await db.update(
//       '$tableAllEvent',
//       model.toMap(),
//       // Ensure that the Dog has a matching id.
//       where: 'id = ?',
//       // Pass the Dog's id as a whereArg to prevent SQL injection.
//       whereArgs: [model.id],
//     );
//   }
// }
