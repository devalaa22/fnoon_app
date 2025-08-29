import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../Share/dialogMessege.dart';
import '../../Share/dialogSuss.dart';
import '../services/funcation_firebase.dart';

class DeleteImage extends StatelessWidget {
  const DeleteImage({super.key});

  @override
  Widget build(BuildContext context) {
    DatabaseService service = DatabaseService();
    return Scaffold(
      body: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection('image').get(),
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
                      child: Row(
                        children: [
                          Expanded(
                              child: Image.network(
                                  snapshot.data?.docs[index]['image'])),
                          Expanded(
                            child: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed:(){
                              
                                  showDialog(context:context ,builder:(BuildContext context)=>
                                   DialogMessege(
                                          messege:"هل أنت متأكد من الحذف",
                                          funcation:() async {
                                            await service
                                                .deleteImage(snapshot.data!.docs[index].id)
                                                .then((value) => showDialog(
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
                                                        DialogScss()).then((value) => 
                                                        Navigator.of(context).pop()));
                                          },
                                           
                                        ),
                                        
                                   );
                                 
                                }
                                ),
                          ),
                        ],
                      ),
                    );
                  });
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text(
                  'لايوجد إعلانات',
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
