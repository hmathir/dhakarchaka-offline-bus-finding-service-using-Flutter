import 'package:flutter/material.dart';

import '../widgets/Text.dart';

class SafeTyTips extends StatelessWidget {
  const SafeTyTips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextWidgetCustomUppercase("Safety on the Bus"),
      ),
      body: SafeArea(
        child: RawScrollbar(
          thumbColor: Colors.white,
          thickness: 3,
          isAlwaysShown: true,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 5,
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
                            ' - Allow the elderly and people with disabilities to use the priority seating in the front of the bus.'
                            '\n'
                            '\n - Passengers should remain seated as much as possible while the bus is in motion.'
                            '\n'
                            '\n - Do not switch seats; do not reach across the aisle or to seats around you.'
                            '\n'
                            '\n - The safest place in an accident is within the framework of the seats which are well padded to protect you.'
                            '\n'
                            '\n - If it is necessary to stand or walk while the bus is moving, passengers should always use handrails.'
                            '\n'
                            '\n - Hold on to the railings and steady yourself to prevent falls when standing or walking through the bus.'
                            '\n'
                            '\n - Always stand behind the line that is located on the floor opposite the driver.'
                            '\n'
                            '\n - Do not talk to or distract the bus operator while he or she is driving.'
                            '\n'
                            '\n - Remain silent at all railroad crossings. The bus driver needs to listen for oncoming trains'
                            '\n'
                            '\n - Never block the centre aisle and stand clear of doorways whenever possible.'
                            '\n'
                            '\n - Do not extend your legs or other personal belongings into the aisle - This can present a tripping hazard.'
                            '\n'
                            '\n - Nothing should be in the aisle, no legs, arms, book, bags, or other objects that someone could trip over.'
                            '\n'
                            '\n - Do not put any part of your body outside the bus window.'
                            '\n'
                            '\n - Ask the bus driver before opening any windows [Luxury buses should have air conditioning.]'
                            '\n'
                            '\n - Approach eating with caution - If you choke, or have food allergies, you may die before the driver can do anything about it.'
                            '\n'
                            '\n - Avoid opening or tampering with emergency windows, except during an emergency.'
                            '\n'
                            '\n - Avoid tampering with or operating equipment intended for the bus driver’s exclusive use;',
                            style: TextStyle(color: Colors.white,fontSize: 17),
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
      ),
    );
  }
}
