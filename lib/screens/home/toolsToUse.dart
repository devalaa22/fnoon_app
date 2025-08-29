import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fnoon_app_new/models/allEvent.dart';
import '../../Share/detailsDialog.dart';

class ToolaToUse extends StatefulWidget {
  String title;
  ToolaToUse({super.key, required this.title});

  @override
  State<ToolaToUse> createState() => _ToolaToUseState();
}

class _ToolaToUseState extends State<ToolaToUse> {
  List<AllEvent> allevent = [];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assest/image/FnoonBackground.png"),
                fit: BoxFit.cover)),
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 10, right: 25),
            width: width,
            height: height / 9,
            decoration: BoxDecoration(),
            child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: "bein-black"),
                )),
          ),
          Expanded(
            child: FutureBuilder<QuerySnapshot>(
                future: FirebaseFirestore.instance
                    .collection('AdminAddTools')
                    .get(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData && snapshot.data!.docs.length > 0) {
                    return GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 1.0,
                      children: List.generate(
                        snapshot.data!.docs.length,
                        (index) => Container(
                          height: height / 2,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)
                                        //Radius.circular(20)
                                        )),
                                child: 
                                // FittedBox(
                                //   fit: BoxFit.scaleDown,
                                //   child: Image.network(
                                //    snapshot.data.docs[index]['image'], ),
                                // )
                                Container(
                                  margin: EdgeInsets.all(5),
                                  width: width,
                                  height: height / 7,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              snapshot.data!.docs[index]['image']),
                                          fit: BoxFit.fill)
                                          ),
                                     
                                  // child: FittedBox(
                                  //   child: Image.network(
                                  //     snapshot.data.docs[index]['image'],
                                  //     // width: width,
                                  //     // height: height / 7,
                                  //     // // fit: BoxFit.contain,
                                  //     //  height: height/9,
                                  //      fit:BoxFit.fi ,
                                  //   ),
                                  // ),
                                ),
                              ),
                            ),
                            // Divider(
                            //   color: Colors.black12,
                            //   thickness: 1.0,
                            // ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                snapshot.data!.docs[index]['name'],
                                style: TextStyle(
                                      fontSize: 15,
                                        color: Colors.black,
                                        fontFamily: "bein-black"),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            DetailsDialog(
                                              discrabction: snapshot
                                                  .data?.docs[index]['detales'],
                                              title: snapshot.data?.docs[index]
                                                  ['name'],
                                              urlImage: snapshot.data?.docs[index]
                                                  ['image'],
                                            ));
                                  },
                                  child: Text(
                                    "عرض المزيد",
                                    style: TextStyle(
                                      fontSize: 15,
                                        color: Colors.blue,
                                        fontFamily: "bein-black"),
                                  )
                                  ),
                            ),
                            // SizedBox(height: 20,)
                          ]),
                        ),
                      ),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.data?.docs.isEmpty ?? true) {
                    return Center(
                        child: Text(
                      'لايوجد بيانات لعرضها',
                      style: TextStyle(fontSize: 25),
                    ));
                  } else {
                    return const Text('Error');
                  }
                }),
          )
        ]),
      ),
    );
  }
}
