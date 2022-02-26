import 'package:flutter/material.dart';

import '../widgets/Text.dart';

class TravelDua extends StatelessWidget {
  const TravelDua({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextWidgetCustomUppercase("Dua for Travelling"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  color: Colors.red,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 1.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'سُبْحَانَ الَّذِي سَخَّرَ لَنَا هَذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ وَإِنَّا إِلَى رَبِّنَا لَمُنْقَلِبُونَ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                        Text(
                          'Subhana-alladhi sakh-khara la-na hadha wa ma kunna la-hu muqrinin.Wa inna ila Rabbi-na la munqalibun.َ',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                        Text(
                          'সুবহানাল্লাজি সাখখারা লানা হা-জা ওয়ামা কুননা লাহু মুক্বরিনীন, \nওয়া ইন্না ইলা রাব্বিনা লামুনক্বালিবুন।',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          '- Surah Az-Zukhruf 43:13-14َ',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  color: Colors.red,
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
                          'যানবাহনে আরোহনের সময় প্রাসঙ্গিক সুন্নাত:',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                        Text(
                          'যানবাহনে উঠার সময় ‘বিসমিল্লাহ’ বলে পা রাখা।',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Colors.black),

                        ),
                        Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                        Text(
                          'যানবাহনের উঠার পর স্থির হলে বা বসার পর ‘আলহামদুলিল্লাহ’ বলা তার পর আরোহনের দোয়াটি পড়া।',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                        Text(
                          'দোয়া পড়ার পর তিনবার ‘আলহামদুলিল্লাহ’ এবং তিনবার ‘আল্লাহু আকবার’ বলা।',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          '- তিরমিজিَ',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  color: Colors.black,
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
                          'কোথাও কোন ভুল বা অসংগতি আপনার দৃষ্টিগোচর \nহলে তা অনুগ্রহ করে আমাদের অবহিত করুন, \nযেন আমরা দ্রুত সংশোধন করতে পারি।',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
