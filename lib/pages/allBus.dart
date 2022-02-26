import 'dart:convert';
import 'package:dhakar_chaka/data/busList.dart';
import 'package:dhakar_chaka/data/destinationList.dart';
import 'package:dhakar_chaka/widgets/Text.dart';
import 'package:dhakar_chaka/pages/routeDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:search_choices/search_choices.dart';

class AllBus extends StatefulWidget {
  @override
  _AllBusState createState() => _AllBusState();
}

class _AllBusState extends State<AllBus> {
  String? search;

  List searchResults = [];
  Destination destination = Destination();
  BusList busList = BusList();
  List data = [];

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('lib/data/routeDetails.json');
    setState(() => data = json.decode(jsonText));
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextWidgetCustomUppercase("BUS LIST"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Visibility(visible: searchResults.isEmpty, child: SearchBus()),
            SizedBox(
              height: 5,
            ),
            Visibility(
              visible: searchResults.isEmpty,
              child: Text(''),
            ),
            showAll(),
            Visibility(
              visible: searchResults.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Searched List:',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        textAlign: TextAlign.center),
                    resetButton()
                  ],
                ),
              ),
            ),
            resultList(),
          ],
        ),
      ),
    );
  }

  Widget showAll() {
    return Visibility(
      visible: this.searchResults.length == 0,
      child: Expanded(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
              child: ListTile(
                title: Text(data[index]["busName"], style: TextStyle(fontWeight: FontWeight.w500),),
                subtitle: Text(data[index]["routeName"]),
                trailing: ElevatedButton.icon(
                  icon: Icon(Icons.info),
                  label: Text(
                    "Details",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      elevation: MaterialStateProperty.all(8),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.orange)),
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RouteDetailPage(
                            busName: data[index]['busName'],
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
              elevation: 10,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.orange, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
            );
          },
        ),
      ),
    );
  }
  Widget SearchBus() {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(
            color: Colors.grey,
            width: 1.0,
          )),
      margin: EdgeInsets.only(top: 16.0, left: 6, right: 6),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            SearchChoices.single(
                displayClearIcon: false,
                searchInputDecoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.blueAccent))),
                isExpanded: true,
                value: this.search == "" || this.search == null
                    ? "Search"
                    : this.search,
                items: busList.searches.map((e) {
                  return (DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ));
                }).toList(),
                hint: "Search By Bus Name",
                searchHint: "Search By Bus Name",
                onChanged: (value) {
                  setState(() {
                    this.search = value.toString();
                    data.forEach((element) {
                      if (element['busName'].contains(search)) {
                        setState(() {
                          searchResults.add(element);
                        });
                      }
                    });
                  });
                })
          ],
        ),
      ),
    );
  }
  Widget resultList() {
    return Visibility(
        visible: this.searchResults.length > 0,
        child: Flexible(
          child: ListView(children: listOfResults()),
        ));
  }
  List<Widget> listOfResults() {
    List<Widget> widgetList = [];

    if (this.searchResults.length > 0) {
      this.searchResults.forEach((element) {
        print(element['busName']);
        widgetList.add(Card(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
          child: ListTile(
            title: Text(element["busName"], style: TextStyle(fontWeight: FontWeight.w500),),
            subtitle: Text(element["routeName"]),
            trailing: ElevatedButton.icon(
              icon: Icon(Icons.info),
              label: Text(
                "Details",
                style: TextStyle(color: Colors.black),
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  elevation: MaterialStateProperty.all(8),
                  backgroundColor: MaterialStateProperty.all(Colors.orange)),
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RouteDetailPage(
                              busName: element['busName'],
                            )),
                  );
                });
              },
            ),
          ),
          elevation: 10,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.orange, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
        ));
      });
    } else {
      widgetList.add(TextWidgetCustom("No Results Found"));
    }

    return widgetList.toList();
  }
  Widget resetButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(side: BorderSide(color: Colors.white, width: 1.0,),primary: Colors.black, elevation: 8 ),
        onPressed: () {
          setState(() {
            this.searchResults.clear();
          });
        },
        child: Row(
          children: [
            Icon(Icons.restart_alt),
            SizedBox(
              width: 10,
            ),
            Text('Search Again')
          ],
        ));
  }
}
