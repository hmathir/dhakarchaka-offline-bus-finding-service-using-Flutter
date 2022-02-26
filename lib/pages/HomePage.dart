
import 'package:dhakar_chaka/pages/allBus.dart';
import 'package:dhakar_chaka/pages/safetyTips.dart';
import 'package:dhakar_chaka/pages/searchBus.dart';
import 'package:dhakar_chaka/widgets/clip_shadow_path.dart';
import 'package:dhakar_chaka/widgets/custom_clipper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dua.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.red,
        body: Stack(
          children: [
            ClipShadowPath(
              shadow: BoxShadow(
                  color: Colors.black,
                  offset: Offset(4, 4),
                  blurRadius: 4,
                  spreadRadius: 8),
              clipper: BigClipper(),
              child: Container(
                color: Colors.orange,
              ),
            ),
            ClipShadowPath(
              shadow: BoxShadow(
                  color: Colors.black,
                  offset: Offset(4, 4),
                  blurRadius: 4,
                  spreadRadius: 8),
              clipper: SmallClipper(),
              child: Container(
                color: Colors.red,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Text(
                        'Dhakar Chaka',
                        style: GoogleFonts.redressed(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 250,),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClickableCard(
                        icon: Icon(
                          FontAwesomeIcons.route,
                          color: Colors.red,
                          size: 30,
                        ),
                        title: 'Find Routes',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchBus()));
                        },
                      ),
                      ClickableCard(
                        icon: Icon(
                          FontAwesomeIcons.busAlt,
                          color: Colors.red,
                          size: 30,
                        ),
                        title: 'Buses List',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllBus()));
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClickableCard(
                        icon: Icon(
                          FontAwesomeIcons.bookOpen,
                          color: Colors.red,
                          size: 30,
                        ),
                        title: "Journey Dua",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TravelDua()));
                        },
                      ),
                      ClickableCard(
                        icon: Icon(
                          FontAwesomeIcons.userShield,
                          color: Colors.red,
                          size: 30,
                        ),
                        title: 'Safety Tips',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SafeTyTips()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}

class ClickableCard extends StatelessWidget {
  ClickableCard(
      {required this.icon, required this.title, required this.onPressed});

  String title;
  Icon icon;
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        child: Container(
          height: MediaQuery.of(context).size.height * 1 / 6.5,
          width: MediaQuery.of(context).size.width * 1 / 3,
          child: Center(
            child: ListTile(
              title: Padding(padding: const EdgeInsets.all(10.0), child: icon),
              subtitle: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        shadowColor: Colors.black,
        color: Colors.white,
      ),
    );
  }
}
