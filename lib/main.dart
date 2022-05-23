import 'package:flutter/material.dart';
import 'package:veggy_v1/screens/first_screen.dart';
import 'package:veggy_v1/screens/howTo.dart';
import 'package:veggy_v1/screens/menu_tab.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:veggy_v1/screens/searchResult.dart';
import 'package:veggy_v1/screens/startTheDay.dart';
import 'package:veggy_v1/screens/dinner.dart';
import 'package:veggy_v1/screens/fastfood.dart';
import 'package:veggy_v1/screens/dessert.dart';
import 'package:flutter/services.dart';
import 'package:veggy_v1/screens/ingredients.dart';
import 'package:veggy_v1/screens/testScreen.dart';


void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  



  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Sfui'),
    debugShowCheckedModeBanner: false,
    home: firstScreen(),

    routes: {
      '/firstScreen': (context) => firstScreen(),
      '/menu_tab': (context)  => menuTab(),
      '/startTheDay': (context) => startTheDay(),
      '/dinner':(context) => dinner(),
      '/fastfood':(context) => fastfood(),
      '/dessert':(context) => dessert(),
      '/ingredients':(context) => ingredients(),
      '/testScreen':(context) => testScreen(),
      '/howTo':(context) => howTo(),
      '/searchResult':(context) => searchResult(),

    }
  ));


}