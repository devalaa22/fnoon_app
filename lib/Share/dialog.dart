import 'package:flutter/material.dart';

class dialog extends StatelessWidget {
  const dialog({super.key});


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Stack(children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                  child: Text(
                "عذراً ..... الحجز ممتلى في هذا اليوم لا يمكنك حجز موعد",
                maxLines: 2,
                textAlign: TextAlign.center,
              )),
               ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                fixedSize: const Size(300, 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("حسنا",
                                style: TextStyle(fontSize: 20)))
              
            ],
          ),
        )
      ]),
    );
  }
}
