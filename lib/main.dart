import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fnoon_app_new/screens/home/home_page.dart';
import 'package:fnoon_app_new/screens/home/welcame_page.dart';

import 'L10n/L10n.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//import 'flutter_gen/gen_l10n/app_localizations.dart';

// Future<void> backgroundHandler(RemoteMessage message) async {
//   print(message.data.toString());
//  	print(message.notification!.title);
// 	}
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  //  LocalNotificationService.initialize();
  runApp(MyApp());
  // await Firebase.initializeApp();
}

final navigatorKey = GlobalKey<NavigatorState>();
late SharedPreferences preferences;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // localizationsDelegates: [
        //  GlobalMaterialLocalizations.delegate,
        // ],
        // supportedLocales: [
        //   const Locale('en', ''), // English, no country code
        //   const Locale('ar', ''), // Arabic, no country code
        // ],
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'تطبيق فنون',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          fontFamily: "bein-black",
          // textTheme:
        ),
        supportedLocales: L10n.all,
        localizationsDelegates: [
          // AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool boolValue = false;
  @override
  void initState() {
    super.initState();
    getBoolValuesSF();
  }

  Future getBoolValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    boolValue = prefs.getBool("key") ?? false;
    setState(() {
      boolValue = boolValue;
    });

    //  print(boolValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       boolValue == false ?
       WELCOM_PAGE() 
      : HOME_PAGE(),
    );
  }
}
