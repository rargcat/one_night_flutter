import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_night/check_in_out.dart';
import 'package:one_night/constants.dart';
import 'package:one_night/hotel_detail.dart';
import 'package:one_night/location.dart';
import 'package:one_night/settings.dart';

class HotelList extends StatelessWidget {

  HotelList(String city) {
    this.city.value = city;
  }
  final city = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String fromDate = DateFormat('MMM dd').format(now);
    String toDate = DateFormat('MMM dd').format(now.add(Duration(days: 1)));

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: InkWell(
          splashColor: Colors.transparent,
          child: Column(
            children: <Widget>[
              ValueListenableBuilder(
                valueListenable: city,
                builder: (context, value, _) {
                  return Text('$value'.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: SUBTITLE_SIZE));
                },
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('$fromDate - $toDate'.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: SUBTITLE_SIZE)),
                  Icon(Icons.expand_more, size: 18.0, color: ICON_COLOR)
                ],
              )
            ],
          ),
          onTap: () {
            () async {
              final result = await Navigator.of(context).push(MaterialPageRoute(builder: (_) => CheckInOut(city.value)));
              if (result != null && result != city.value) city.value = result;
            }();
          },
        ),
        leading: IconButton(
          icon: Icon(Icons.location_on, size: ICON_SIZE, color: LIGHT_COLOR),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => Location(city.value)));
          },
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.menu, size: ICON_SIZE), onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => Settings()));
          })
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset('assets/images/bldg.gif', fit: BoxFit.cover),
          ),
          SafeArea(
            child: ListView.builder(
              itemCount: 9,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => HotelDetail('Casa Laguna')));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Casa Laguna'.toUpperCase(), 
                          style: TextStyle(fontSize: TITLE_SIZE, color: Colors.yellow)
                        ),
                        SizedBox(height: 10),
                        Text('Closed Until Further Notice'.toUpperCase(), 
                          style: TextStyle(fontSize: SUBTITLE_SIZE, color: Colors.white)
                        ),
                        SizedBox(height: 10),
                        Text('Sold Out'.toUpperCase(), 
                          style: TextStyle(fontSize: SUBTITLE_SIZE, color: Colors.white)
                        ),
                        SizedBox(height: 15),
                        Divider(color: LIGHT_COLOR, height: 1)
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}