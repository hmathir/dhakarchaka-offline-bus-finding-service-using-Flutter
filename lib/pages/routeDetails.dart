import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;
import '../data/mapMarkerData.dart';


class RouteDetailPage extends StatefulWidget {
  RouteDetailPage({required this.busName});
  final String busName;

  @override
  _RouteDetailPageState createState() => _RouteDetailPageState();
}

class _RouteDetailPageState extends State<RouteDetailPage> {
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

  List<Marker> markers = [];

  //TODO This code for PolyLine (Red Line On Map)
  // List<latLng.LatLng> points = [];
  List data = [];

  final latLangData = [MapMarkerData().latLngData];

  List<Widget> buildList() {
    List<Widget> widgetList = [];
    //  List<String> places = [];

    this.data.forEach((element) {
      if (element['busName'] == widget.busName) {
        if (element['places'].length > 1) {
          element['places'].forEach((element) {
            //map tiles
            MapMarkerData().latLngData.forEach((locElements) {
              if (element == locElements['name']) {
                this.markers.add(
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: new latLng.LatLng(locElements['lat'] as double,
                            locElements['lng'] as double),
                        builder: (ctx) => new Container(
                          child: Icon(Icons.location_on),
                        ),
                      ),
                    );
              }
            });

            widgetList.add(ListTile(
              leading: Icon(
                Icons.transfer_within_a_station_outlined,
              ),
              title: Text(element),
            ));
          });
        }
      }
    });

    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: "ROUTE",
                  ),
                  Tab(
                    text: "MAP",
                  )
                ],
              ),
              title: Text(widget.busName + ' Route Details')),
          body: TabBarView(
            children: [
              ListView(
                children: buildList(),
              ),
              FlutterMap(
                options: MapOptions(
                  center: latLng.LatLng(23.6850, 90.3563),
                  zoom: 11,
                  maxZoom: 20,
                  minZoom: 2,
                ),
                layers: <LayerOptions>[
                  TileLayerOptions(
                    urlTemplate:
                        "https://api.mapbox.com/styles/v1/hmathir/ckztlfu6a003n14pabtscl7y6/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaG1hdGhpciIsImEiOiJja3p0bDdobjU0MmFuMnVxcnpxYmM0aGp3In0.OrqxGvGlU-k0j24p93Hjng",
                  ),
                  MarkerLayerOptions(markers: this.markers),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
