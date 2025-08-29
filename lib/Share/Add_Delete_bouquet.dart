import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fnoon_app_new/Share/dialogSuss.dart';

import '../screens/editbouquets.dart';
import '../screens/services/funcation_firebase.dart';
import 'dialogMessege.dart';

class Allbouquets extends StatefulWidget {
  const Allbouquets({required Key key}) : super(key: key);

  @override
  _AllbouquetsState createState() => _AllbouquetsState();
}

DatabaseService service = DatabaseService();

class _AllbouquetsState extends State<Allbouquets> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage("assest/image/FnoonBackground.png"),
                    fit: BoxFit.cover)),
            child: FutureBuilder<QuerySnapshot>(
                future: FirebaseFirestore.instance
                    .collection('AdminAddbouquetmessege')
                    .orderBy('dateTime', descending: true)
                    .get(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData && snapshot.data!.docs.length > 0) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(5),
                          child: Card(
                            elevation: 3,
                            color: Colors.white,
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("باقة1" ':' '  '),
                                      const SizedBox(
                                        width: 20.0,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: AutoSizeText(
                                          snapshot.data!.docs[index]['title'],
                                          maxLines: 1,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    children: [
                                      Text("باقة2" ':' '  '),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: AutoSizeText(
                                          snapshot.data?.docs[index]['title2'],
                                          maxLines: 1,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    children: [
                                      Text("باقة3" ':' '  '),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: AutoSizeText(
                                          snapshot.data?.docs[index]['title3'],
                                          maxLines: 1,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        AdminEditbouquetmessege(
                                                          id: snapshot.data
                                                              !.docs[index].id,
                                                          title1: snapshot.data
                                                                  ?.docs[index]
                                                              ['title'],
                                                          title2: snapshot.data
                                                                  ?.docs[index]
                                                              ['title2'],
                                                          title3: snapshot.data
                                                                  ?.docs[index]
                                                              ['title3'],
                                                        ));
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.grey,
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  DialogMessege(
                                                messege:
                                                    "هل أنت متأكد من الحذف",
                                                funcation: () async {
                                                  await service
                                                      .deletebouquets(snapshot
                                                          .data!.docs[index].id)
                                                      .then((value) => showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                                  context) =>
                                                              DialogScss()).then(
                                                          (value) =>
                                                              Navigator.of(
                                                                      context)
                                                                  .pop()));
                                                },
                                              ),
                                            );
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text(' لم يتم تسجيل اي باقة '),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ),
      ),
    );
  }
}
