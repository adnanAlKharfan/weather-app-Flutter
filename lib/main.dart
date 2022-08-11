import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'weather app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<weather>(
        create: (context) => weather(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic> locationData = new Map<String, dynamic>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    getCurrentLocation();
    super.didChangeDependencies();
  }

  void getCurrentLocation() async {
    PermissionStatus permissionGranted;
    var location = Location.instance;

    permissionGranted = await location.hasPermission();

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted == PermissionStatus.denied) {
        return;
      } else {
        var temp = await location.getLocation();

        setState(() {
          locationData["lat"] = temp.latitude;
          locationData["lon"] = temp.longitude;
        });
      }
    } else {
      var temp = await location.getLocation();

      setState(() {
        locationData["lat"] = temp.latitude;
        locationData["lon"] = temp.longitude;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var b = BlocProvider.of<weather>(context);
    if (locationData.isNotEmpty)
      b.add(locationData);
    else
      b.add("syria");
    return Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(30.0),
            child:
                BlocBuilder<weather, weatherState>(builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.blue, fontSize: 32.0),
                          children: [
                        TextSpan(
                            text:
                                (state as weatherState).temperature.toString()),
                        TextSpan(
                            text: "o",
                            style: TextStyle(
                              fontFeatures: [
                                FontFeature.enable('sups'),
                              ],
                            )),
                        TextSpan(text: "C")
                      ])),
                  (state as weatherState).icon,
                  Text(
                    (state as weatherState).name,
                    style: TextStyle(fontSize: 32.0),
                  )
                ],
              );
            })

            // This trailing comma makes auto-formatting nicer for build methods.
            ));
  }
}
