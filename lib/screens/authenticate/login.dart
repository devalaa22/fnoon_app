import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fnoon_app_new/screens/authenticate/forgetpass.dart';
import 'package:fnoon_app_new/screens/home/home_page.dart';

// import '../../Share/continarlogin.dart';
// import '../../main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailContllor = TextEditingController();
  final passContllor = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailContllor.dispose();
    passContllor.dispose();

    super.dispose();
  }

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      if (!_formKey.currentState!.validate()) {
        return;
      } else {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailContllor.text.trim(),
          password: passContllor.text.trim(),
        );
        print(FirebaseAuth.instance.currentUser?.email);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HOME_PAGE()));
      }
    } on FirebaseAuthException {
      AlertDialog alert = AlertDialog(
        title: Text("رسالة خطأ"),
        content:
            //Text("${e}"),
            Text("يرجاء المحاولة لاحقاً"),
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
      //  return AlertDialog(
      //   title:Text(e.message.toString()),
      //   content:Text(e.message.toString()),
      //   // barrierDismissible: false,
      // );
      // print("kkkkkkkkkkkkkkk");
      // print(e.message);
      // return e.message;
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
                    "تسجيل الدخول",
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
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                ),
                            child: TextFormField(
                              controller: emailContllor,
                              //cursorColor: Colors.white,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              // ignore: missing_return
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'الرجاء إدخال الايميل';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                contentPadding: EdgeInsets.only(right: 20),
                                hintText: "الايميل",
                                border: OutlineInputBorder(
                                  borderSide:  BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 4,
                          ),
                          Container(
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                ),
                            child: TextFormField(
                              obscureText: flag,
                              controller: passContllor,
                              //cursorColor: Colors.white,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                contentPadding: EdgeInsets.only(right: 20),
                                  hintText: " كلمة السر",
                                  border: OutlineInputBorder(
                                  borderSide:  BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                  
                                
                                  suffixIcon: IconButton(
                                    icon: flag
                                        ? Icon(
                                            Icons.visibility_off,
                                            color: Colors.black26,
                                          )
                                        : Icon(
                                            Icons.visibility,
                                            color: Colors.black26,
                                          ),
                                    onPressed: () {
                                      setState(() {
                                        flag = !flag;
                                      });
                                    },
                                  )),

                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'الرجاء إدخال كلمة السر';
                                }
                                return null;
                              },
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                     builder: (context) => ForgetPass(key: UniqueKey()),
                                  ),
                                );
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 30),
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "نسيت كلمة المرور" "؟",
                                    style: TextStyle(fontSize: 20),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          //FlatButton(onPressed: onPressed, child: child)
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFFF6C06),
                                  fixedSize: const Size(300, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              onPressed: signIn,
                              child: Text(
                                "تسجيل الدخول",
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
