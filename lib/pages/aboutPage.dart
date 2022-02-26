import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import '../widgets/Text.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextWidgetCustomUppercase("About Dhakar Chaka"),
      ),
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  color: Colors.black12,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 1.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          'What & Why?',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        Divider(
                          thickness: 1.5,
                          color: Colors.white,
                        ),
                        Text(
                          "\"Dhakar Chaka\" is Free Offline Based Bus Route Finding Service. \nYou can use it whenever you want without Internet Connection. \nAll the data collected from Internet. \nMade with ❤️",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  color: Colors.black12,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 1.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          'Resource Helper:',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        Divider(
                          thickness: 1.5,
                          color: Colors.white,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image(
                              height: 50,
                              width: 50,
                              image: AssetImage(
                                'assets/rongdhonu.png',
                              ),
                            ),
                            Image(
                              height: 50,
                              width: 50,
                              image: AssetImage(
                                'assets/islamicfinder.png',
                              ),
                            ),
                            Image(
                              height: 50,
                              width: 50,
                              image: AssetImage(
                                'assets/arrival.png',
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  color: Colors.black12,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 1.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                        children: [
                          Text(
                            'Dev Corner',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          Divider(
                            thickness: 1.5,
                            color: Colors.white,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  UrlLauncher.launch(
                                      'https://facebook.com/athirofficial');
                                },
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                  AssetImage(
                                    'assets/hmathir.jpeg',
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  UrlLauncher.launch(
                                      'https://facebook.com/itsmjahidofficial');
                                },
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                  AssetImage(
                                    'assets/jahid.jpeg',
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  UrlLauncher.launch(
                                      'https://www.facebook.com/profile.php?id=100009527750162');
                                },
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                  AssetImage(
                                    'assets/asif.jpg',
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  UrlLauncher.launch(
                                      'https://www.facebook.com/rashedul.is');
                                },
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                  AssetImage(
                                    'assets/rashed.jpg',
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  UrlLauncher.launch(
                                      'https://www.facebook.com/profile.php?id=100011001872171');
                                },
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                  AssetImage(
                                    'assets/sakib.jpeg',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  color: Colors.black12,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 1.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          'Need An Application?',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        Divider(
                          thickness: 1.5,
                          color: Colors.white,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FlipCard(
                              // Fill the back side of the card to make in the same size as the front.
                              direction: FlipDirection.VERTICAL,
                              front: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.orange, width: 1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ListTile(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.contact_page),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('Contact Us'),
                                    ],
                                  ),
                                ),
                              ),
                              back: Card(
                                child: ListTile(
                                  leading: IconButton(icon: Icon(FontAwesomeIcons.globe, color: Colors.red,), onPressed: () {                                      UrlLauncher.launch(
                                      'https://google.com'); },),
                                  title: IconButton(icon: Icon(FontAwesomeIcons.phone, color: Colors.red,), onPressed: () {                                      UrlLauncher.launch(
                                      'tel: +8801858906527'); },),
                                  trailing: IconButton(icon: Icon(FontAwesomeIcons.envelope, color: Colors.red,), onPressed: () {                                      UrlLauncher.launch(
                                      'mailto:athiralazad@gmail.com'); },),
                                ),
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.orange, width: 1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
