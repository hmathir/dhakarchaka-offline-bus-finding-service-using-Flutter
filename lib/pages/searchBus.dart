import 'dart:convert';
import 'package:dhakar_chaka/data/destinationList.dart';
import 'package:dhakar_chaka/widgets/Text.dart';
import 'package:flip_card/flip_card.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:search_choices/search_choices.dart';
import 'package:dhakar_chaka/pages/routeDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class SearchBus extends StatefulWidget {
  @override
  _SearchBusState createState() => _SearchBusState();
}

class _SearchBusState extends State<SearchBus> {
  String? start;
  String? end;
  final List<DropdownMenuItem> items = [];
  List searchResults = [];
  Destination destination = Destination();
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
      backgroundColor: searchResults.length == 0 ? Colors.red : Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextWidgetCustomUppercase("FIND BUS ROUTE"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Visibility(
              visible: searchResults.isEmpty,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                    color: Colors.black12,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white, width: 1.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          startInput(),
                          endInput(),
                          searchButton(),
                        ],
                      ),
                    )),
              ),
            ),
            SizedBox(
              width: 10,
            ),
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
            Visibility(
              visible: searchResults.isEmpty,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: FlipCard(
                  direction: FlipDirection.VERTICAL,
                  front: Card(
                      color: Colors.black12,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white, width: 1.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Text(
                                '⚠️ Disclaimer ⚠️',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ))),
                  back: Card(
                    color: Colors.black12,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white, width: 1.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            '⚠️ Disclaimer ⚠️',
                            style:
                                TextStyle(color: Colors.yellow, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          Divider(
                            thickness: 1.5,
                            color: Colors.white,
                          ),
                          Text(
                            "All information is taken from Internet. \nIf you do not find any information, it can be happened that information is not in our database. \nCome forward with the help of everyone by adding or updating new information",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                          TextButton(
                              onPressed: () {
                                UrlLauncher.launch(
                                    'https://forms.gle/bXAej9V5EQjC2afJ8');
                              },
                              child: Text(
                                'Add / Update Data',
                              ),
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(
                                              color: Colors.white)))))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> listOfResults() {
    List<Widget> widgetList = [];

    if (this.searchResults.length > 0) {
      this.searchResults.forEach((element) {
        widgetList.add(Card(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
          child: ListTile(
            title: Text(
              element["busName"],
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              element["routeName"],
            ),
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
        ));
      });
    } else {
      widgetList.add(TextWidgetCustom("No Results Found"));
    }

    return widgetList.toList();
  }

  Widget startInput() {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(color: Colors.grey, width: 1.0)),
      margin: EdgeInsets.all(5.0),
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
                value: this.start == "" || this.start == null
                    ? "Origin"
                    : this.start,
                items: destination.destinations.map((e) {
                  return (DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ));
                }).toList(),
                hint: "Origin",
                searchHint: "Origin",
                onChanged: (value) {
                  setState(() {
                    this.start = value.toString();
                  });
                })
          ],
        ),
      ),
    );
  }

  Widget endInput() {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(color: Colors.grey, width: 1.0)),
      margin: EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            SearchChoices.single(
                displayClearIcon: false,
                isExpanded: true,
                items: destination.destinations.map((e) {
                  return (DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ));
                }).toList(),
                hint: "Destination",
                value: end == "" || end == null ? "Destination" : end,
                searchHint: "Destination",
                onChanged: (value) {
                  setState(() {
                    end = value.toString();
                  });
                }),
          ],
        ),
      ),
    );
  }

  Widget searchButton() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  side: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                  primary: Colors.black,
                  elevation: 8),
              onPressed: () {
                if (start == null || end == null) {
                  Alert(
                    context: context,
                    type: AlertType.warning,
                    title: "Hey You!",
                    desc: 'Select "Origin" & "Destination" Point.',
                    style: AlertStyle(descStyle: TextStyle(fontSize: 15)),
                    buttons: [
                      DialogButton(
                        color: Colors.red,
                        child: Text(
                          "Close",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ).show();
                } else if (!(searchResults.length > 1)) {
                  data.forEach((element) {
                    if (element['places'].contains(start) &&
                        element['places'].contains(end)) {
                      setState(() {
                        searchResults.add(element);
                      });
                    }
                  });
                }
              },
              icon: Icon(Icons.search_outlined),
              label: TextWidgetCustomUppercase("FIND ROUTES"),
            ),
          ),
        ),
      ],
    );
  }

  Widget resultList() {
    return Visibility(
        visible: this.searchResults.length > 0,
        child: Flexible(
          child: ListView(children: listOfResults()),
        ));
  }

  Widget resetButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            side: BorderSide(
              color: Colors.white,
              width: 1.0,
            ),
            primary: Colors.black,
            elevation: 8),
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
