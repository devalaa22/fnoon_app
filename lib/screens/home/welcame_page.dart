import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WELCOM_PAGE extends StatefulWidget {
  const WELCOM_PAGE({super.key});

  @override
  State<WELCOM_PAGE> createState() => _WELCOM_PAGEState();
}

class _WELCOM_PAGEState extends State<WELCOM_PAGE> {
  late SharedPreferences preferences;
  

  Future init() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    init();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        
        decoration: BoxDecoration(color: Color(0xFFFFFFFF),),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              
              SizedBox(height: height/5),
              Center(
                child: Image.asset(
                  "assest/image/LOGO.png",
                  height: height/2,
                  width: width,
                ),
              ),
              SizedBox(height: height/9),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF6C06),
                      fixedSize: const Size(300, 50),
                      // const Size(300, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {
                    preferences.setBool("key", true);
                    print("hhhhhhhhhhhhhhhhhhhhh");
                    print(preferences.getBool("key"));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HOME_PAGE()));
                  },
                  child: Text(
                    " ياحــيـــا وســهـــلا",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: "ArbFONTS-beIN Normal"),
                  )),
              SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }
}
