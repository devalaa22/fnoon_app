import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

// import '../../Share/continarlogin.dart';
// import '../../main.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({required Key key}) : super(key: key);

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final emailContllor = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailContllor.dispose();
    super.dispose();
  }

  Future forgetpass() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      if (!_formKey.currentState!.validate()) {
        return;
      } else {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailContllor.text.trim())
            .then((value) => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login(key: UniqueKey()))));
        print(FirebaseAuth.instance.currentUser?.email);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login(key: UniqueKey())));
      }
    } on FirebaseAuthException catch (e) {
      AlertDialog alert = AlertDialog(
        title: Text("رسالة خطأ"),
        content: Text(e.message.toString()),
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
    //navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assest/image/LOGO.png",
                  height: 250,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: Color(0xFFFF6C06)),
                  child: Center(
                      child: Text(
                    " نسيت كلمة المرور",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFFFFFFFF)),
                  )),
                ),
                Container(
                  decoration: BoxDecoration(color: Color(0XFFEBEBEB)),
                  child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.only(right: 20),
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white),
                            child: TextFormField(
                              controller: emailContllor,
                              //cursorColor: Colors.white,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  hintText: "الايميل",
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'الرجاء إدخال الايميل';
                                }
                                return null;
                              },
                            ),
                          ),

                          SizedBox(
                            height: 4,
                          ),
                          // Container(
                          //   margin: EdgeInsets.all(20),
                          //   padding: EdgeInsets.only(right: 20),
                          //   width: 300,
                          //   height: 50,
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(50),
                          //       color: Colors.white),
                          //   child: TextFormField(
                          //     obscureText: flag,
                          //     controller: passContllor,
                          //     //cursorColor: Colors.white,
                          //     textInputAction: TextInputAction.next,
                          //     keyboardType: TextInputType.emailAddress,
                          //     decoration: InputDecoration(
                          //       hintText: " كلمة السر",

                          //       border: InputBorder.none,
                          //       icon: Icon(
                          //         Icons.lock,
                          //         color: Colors.black,
                          //       ),
                          //       suffixIcon:IconButton(
                          //         icon:flag ?  Icon(
                          //         Icons.visibility_off,
                          //         color: Colors.black26,

                          //       ): Icon(
                          //         Icons.visibility,
                          //         color: Colors.black26,

                          //       ),
                          //       onPressed: (){
                          //         setState(() {
                          //           flag=!flag;
                          //         });
                          //       },
                          //       )

                          //     ),

                          //     validator: (value) {
                          //       if (value == null || value.isEmpty) {
                          //         return 'الرجاء إدخال كلمة السر';
                          //       }
                          //       return null;
                          //     },
                          //   ),
                          // ),

                          // Container(
                          //   margin: EdgeInsets.only(left: 30),
                          //   child: Align(
                          //     alignment: Alignment.bottomLeft,
                          //     child: Text("نسيت كلمة المرور"+"؟",style: TextStyle(fontSize: 20),)),
                          // ),
                          // SizedBox(
                          //   height: 30,
                          // ),
                          //FlatButton(onPressed: onPressed, child: child)
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFFF6C06),
                                  fixedSize: const Size(300, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              onPressed: forgetpass,
                              child: Text(
                                "إعادة كلمة السر",
                                style: TextStyle(fontSize: 20),
                              )),
                          SizedBox(
                            height: 300,
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
