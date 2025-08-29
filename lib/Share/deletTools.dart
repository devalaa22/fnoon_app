import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../Share/dialogMessege.dart';
import '../../Share/dialogSuss.dart';
import '../screens/services/funcation_firebase.dart';

class DeleteTools extends StatelessWidget {
  const DeleteTools({super.key});

  @override
  Widget build(BuildContext context) {
    DatabaseService service = DatabaseService();
    return Scaffold(
      body: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection('AdminAddTools').get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData && snapshot.data!.docs.length > 0) {
              return ListView.separated(
                  itemCount: snapshot.data!.docs.length,
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          FittedBox(
                            fit: BoxFit.contain,
                            child: SizedBox(
                              height: 150,
                              width: 100,
                              child: Image.network(
                                  snapshot.data?.docs[index]['image']),
                            ),
                          ),
                          Text(snapshot.data?.docs[index]['name']),
                          Container(
                              margin: EdgeInsets.all(10),
                              // height: 200,
                              width: double.infinity,
                              child: AutoSizeText(
                                snapshot.data?.docs[index]['detales'],
                                maxLines: 5,
                                textAlign: TextAlign.justify,
                              )),
                          IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      DialogMessege(
                                    messege: "هل أنت متأكد من الحذف",
                                    funcation: () async {
                                      await service
                                          .deleteTools(
                                              snapshot.data!.docs[index].id)
                                          .then((value) => showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  DialogScss()).then((value) =>
                                              Navigator.of(context).pop()));
                                    },
                                  ),
                                );
                              }),
                        ],
                      ),
                    );
                  });
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text(
                  'لايوجد ادوات لعرضها  ',
                  style: TextStyle(fontSize: 25),
                ),
              );
            } else {
              return const Text('Error');
            }
          }),
    );
  }
}
