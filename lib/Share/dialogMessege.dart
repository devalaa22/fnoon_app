
import 'package:flutter/material.dart';

class DialogMessege extends StatelessWidget {
  final String messege;
  final Function? funcation;
  const DialogMessege({super.key,  required this.messege,  this.funcation});

  @override
  Widget build(BuildContext context) {
    print("hear");
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
                messege,
                maxLines: 2,
                textAlign: TextAlign.center,
              )),
              // Divider(
              //   color: Colors.orange,
              //   thickness: 2.0,
              // ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: funcation as void Function()?,
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.red)),
                      child: Text("نعم")),
                  ElevatedButton(
                      onPressed: () =>  Navigator.of(context).pop(),
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.white)),
                      child: Text("لا")),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
