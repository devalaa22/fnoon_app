
import 'package:flutter/material.dart';

class DetailsDialog extends StatelessWidget {
  final String discrabction;
  final String title;
  final String urlImage;

  const DetailsDialog({super.key, required this.discrabction, required this.title, required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Stack(children: [
        Container(
          padding: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.orange,
                        )),
                  ],
                ),
                CircleAvatar(
                  radius: 60.0,
                  backgroundColor: Colors.transparent,
                  // backgroundImage:
                  //     NetworkImage(urlImage),
                  child: ClipOval(
                    child: Image.network(
                      urlImage,
                    ),
                  ),
                ),
                // CircleAvatar(
                //   backgroundColor: Colors.black,
                //   radius: 100,
                //   // maxRadius: 36.0,
                //   // minRadius: 12.0,
                //   // backgroundImage: NetworkImage(urlImage),
                //   foregroundImage:NetworkImage(urlImage) ,

                //   //AssetImage(snapshot.data!.docs[0]['image']) ,
                // ),
                SizedBox(
                  height: 5,
                ),
                Center(
                    child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: "bein-black"),
                )),
                Divider(
                  color: Colors.orange,
                  thickness: 2.0,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      discrabction,
                      //maxLines: 10,
                      textAlign: TextAlign.justify,
                    ))
              ],
            ),
          ),
        )
      ]),
    );
  }
}
