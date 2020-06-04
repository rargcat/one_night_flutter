import 'package:flutter/material.dart';
import 'package:one_night/city_list.dart';
import 'package:one_night/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class Location extends StatelessWidget {

  Location(String city) {
    this.city.value = city;
  }
  final city = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    ()async{
      if (await Permission.location.request().isDenied) Navigator.pop(context);
    }();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 14, color: ICON_COLOR),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.menu, size: ICON_SIZE, color: ICON_COLOR),
              onPressed: () {}
            )
          ],
          centerTitle: true,
          title: GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ValueListenableBuilder(
                  valueListenable: city,
                  builder: (context, value, _) {
                    return Text('$value'.toUpperCase(), style: TextStyle(color: TXT_COLOR, fontSize: SUBTITLE_SIZE));
                  },
                ),
                SizedBox(width: 1),
                Icon(Icons.expand_more, color: ICON_COLOR, size: ICON_SIZE)
              ],
            ),
            onTap: () {
              () async {
                final result = await Navigator.of(context).push(MaterialPageRoute(builder: (_) => CityList(hasClose: true)));
                if (result != city.value) city.value = result;
              }();
            },
          ),
        ), 
        preferredSize: Size.fromHeight(APPBAR_HEIGHT)
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            zoomControlsEnabled: false,
            padding: const EdgeInsets.only(top: APPBAR_HEIGHT + 14),
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            onMapCreated: (_) {},
            initialCameraPosition: CameraPosition(
              target: const LatLng(45.521563, -122.677433),
              zoom: 11.0
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 100,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        padding: EdgeInsets.only(left: 8),
                        color: TXT_BG_COLOR.withOpacity(0.95),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('HOTEL CRESCENT COURT', style: TextStyle(color: Colors.yellow, fontSize: 12)),
                            Text('UPTOWN', style: TextStyle(color: TXT_COLOR, fontSize: SUBTITLE_SIZE))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      color: Colors.grey.withOpacity(0.9),
                      child: Center(
                        child: Text('SOLD OUT', style: TextStyle(color: TXT_COLOR, fontSize: SUBTITLE_SIZE)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          IgnorePointer(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [Colors.black, Colors.transparent],
                  stops: [0.0, 0.115]
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}