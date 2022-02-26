import 'package:dhakar_chaka/pages/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  runApp(DhakarChaka());

}

class DhakarChaka extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return
      MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Dhakar Chaka',
              theme: ThemeData(
                  primaryColor: Colors.lightBlue.shade900,
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      selectedItemColor: Colors.lightBlue.shade900,
                      selectedIconTheme:
                      IconThemeData(color: Colors.lightBlue.shade900)),
                  iconTheme: IconThemeData(color: Colors.lightBlue.shade900),
                  appBarTheme: AppBarTheme(
                      titleTextStyle: TextStyle(
                          color: Colors.white, fontSize: 20, fontFamily: 'Ubuntu'),
                      color: Colors.red, centerTitle: true)),
              home: SplashScreen()

    );
  }
}