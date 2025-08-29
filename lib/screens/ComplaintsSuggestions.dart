import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Share/dialogSuss.dart';
import 'authenticate/google_auth.dart';
import 'dart:io';

class ComplaintsSuggestions extends StatefulWidget {
  const ComplaintsSuggestions({super.key});

  @override
  State<ComplaintsSuggestions> createState() => _ComplaintsSuggestionsState();
}

class _ComplaintsSuggestionsState extends State<ComplaintsSuggestions> {
  final subjectContllor = TextEditingController();
  final textContllor = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future SendEmail() async {
    final user = await GoogleAuth.signIn();
    final email = user?.email;
    final auth = await user?.authentication;
    final token = auth?.accessToken;
    GoogleAuth.signOut;

    print("authentiction: $email");
    final smtpServer = gmailSaslXoauth2(email!, token.toString());
    final message = Message()
      ..from = Address(email, user?.displayName)
      ..recipients = ['fnoon701@gmail.com']
      ..subject = subjectContllor.text
      ..text = textContllor.text;
    try {
      await send(message, smtpServer).then((value) => showDialog(
          context: context, builder: (BuildContext context) => DialogScss()));
      textContllor.clear();
      subjectContllor.clear();
      print("Send email successfully");
    } on MailerException catch (e) {
      print(e);
    }
  }

  openwhtsapp() async {
    var whatsappurlAndriod = "whatsapp://send?phone=+967777950310&text=${"الموضوع:"" "+subjectContllor.text }+${"الشكوى:"" "+textContllor.text}";
    // var whatsappURL_ios = "https://wa.me/+967700330303";
    if (Platform.isAndroid) {
      if (await canLaunch(whatsappurlAndriod)) {
        await launch(whatsappurlAndriod);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assest/image/FnoonBackground.png"),
                      fit: BoxFit.cover)),
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, right: 25),
                    width: width,
                    height: height / 9,
                    decoration: BoxDecoration(),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "الشكاوي والإقتراحات",
                          style: TextStyle(
                              fontSize: width / 15,
                              color: Colors.white,
                              fontFamily: "bein-black"),
                        )),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Center(
                            child: Text(
                          "للتطوير من خدماتنا و إرضائكم ",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: "bein-black"),
                        )),
                        Center(
                            child: Text(
                          "نسعد بإستقبال إقتراحاتكم ",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: "bein-black"),
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Form(
                              key: _formKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "الموضوع" ":",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontFamily: "bein-black"),
                                      ),
                                    ),
                                    Container(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          fillColor: Colors.black,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            borderSide: BorderSide(
                                              color: Colors.orange,
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                        controller: subjectContllor,
                                        cursorColor: Colors.white,
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.text,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'الرجاء كتابة عنوان للرسالة';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "الشكوى/الإقتراح" ":",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontFamily: "bein-black"),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            borderSide: BorderSide(
                                              color: Colors.orange,
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                        controller: textContllor,
                                        cursorColor: Colors.white,
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.text,
                                        maxLines: 10,
                                        minLines: 5,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'الرجاء  كتابة محتوى الرسالة';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.orange,
                                          fixedSize: const Size(150, 10),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50))),
                                      child: Text(
                                        "إرسال ",
                                        style:
                                            TextStyle(fontFamily: "bein-black"),
                                      ),
                                      onPressed: () async{
                                        if (!_formKey.currentState!.validate()) {
                                          return;
                                        } else  {
                                        // await Share.share('check out my website https://example.com', subject: 'Look what I made!');
                                          //Share.share('check out my website https://example.com', subject: 'Look what I made!');
                                          openwhtsapp();
                                          //SendEmail();
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              )),
                        )
                      ]),
                    ),
                  )
                ]),
              ),
            ),
          )),
    );
  }
}
