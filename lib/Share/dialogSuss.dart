import 'package:flutter/material.dart';

class DialogScss extends StatelessWidget {
  const DialogScss({super.key});

  @override
  Widget build(BuildContext context) {
    return
     Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Stack(children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage("assest/image/check.png"),
                backgroundColor: Colors.orange,
                //AssetImage(snapshot.data!.docs[0]['image']) ,
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                "لقد تمت العملية بنجاح",
                maxLines: 2,
                textAlign: TextAlign.center,
              )),
              
            ],
          ),
        )
      ]),
    );
  }
}
