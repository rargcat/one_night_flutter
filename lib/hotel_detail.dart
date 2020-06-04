import 'package:flutter/material.dart';
import 'package:one_night/constants.dart';
import 'package:one_night/settings.dart';

const ABOUT = "TUCKED IN BEAUTIFUL BEVERLY HILLS, THE AVALON HOTEL EXPERIENCE CURATE'S UNREPEATABLE VIBES. FOR A MERE \$15+TAX DAILY, GET HIGH SPEED WIFI, UNLIMITED LOCAL CALLS, 24/7 ACCESS TO WELLNESS CENTER, USE OF SOLE BICYCLES AND COMPLIMENTARY MORNING COFFEE.";
const AMENITIES = ['WIFI', 'POOL', 'PET FRIENDLY', 'RESTAURANT', 'FITNESS CENTER', 'MINI-BAR', 'VALET PARKING'];
const NOTES = ['CHECK-IN AGE MINIMUM 21+', '\$15(+TAX) PER NIGHT RESORT FEE TO BE PAID ON PROPERTY PETS (DOGS ONLY) WELCOME UNDER 35LBS, FEES APPLY', 'FEES APPLY TO VALET PARKING'];
const ADDRESS = '9400 W OLYMPIC BLVD';

class HotelDetail extends StatelessWidget {

  const HotelDetail(this.hotel);
  final String hotel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: IconButton(
            splashColor: Colors.transparent,
            icon: Icon(Icons.arrow_back_ios, size: ICON_SIZE, color: ICON_COLOR), 
            onPressed: () => Navigator.pop(context)
          ),
          actions: <Widget>[
            IconButton(
              splashColor: Colors.transparent,
              icon: Icon(Icons.menu, size: ICON_SIZE, color: ICON_COLOR),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => Settings())),
            )
          ],
        ), 
        preferredSize: Size.fromHeight(APPBAR_HEIGHT)
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 800,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/bg_480x800.jpg')
                        )
                      ),
                    ),
                    Container(
                      height: 800,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [Colors.black, Colors.transparent],
                          stops: [0.0, 0.4]
                        )
                      ),
                    ),
                    Positioned.fill(child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 500,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          gradient: LinearGradient(
                            begin: FractionalOffset.bottomCenter,
                            end: FractionalOffset.topCenter,
                            colors: [Colors.black, Colors.black, Colors.black54, Colors.transparent],
                            stops: [0.0, 0.7, 0.95, 1.0]
                          )
                        ),
                      ),
                    ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 400, 8, 18),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('CLOSED UNTIL FURTHER NOTICE', style: TextStyle(color: TXT_COLOR, fontSize: 11)),
                            Text('$hotel'.toUpperCase(), style: TextStyle(color: Colors.yellow, fontSize: 40))
                          ],
                        ),
                      ),
                      SizedBox(height: 18),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('ABOUT', style: TextStyle(color: Colors.yellow, fontSize: 20)),
                          SizedBox(height: 18),
                          Text(ABOUT, style: TextStyle(color: TXT_COLOR, fontSize: 11), textAlign: TextAlign.center),
                          SizedBox(height: 18),
                          Text('AMENITIES', style: TextStyle(color: Colors.yellow, fontSize: 20)),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.only(top: 18),
                            shrinkWrap: true,
                            itemCount: AMENITIES.length,
                            itemBuilder: (_, index) {
                              return Text(AMENITIES[index], style: TextStyle(color: TXT_COLOR, fontSize: 11), textAlign: TextAlign.center);
                            }
                          ),
                          SizedBox(height: 18),
                          Text('NOTES', style: TextStyle(color: Colors.yellow, fontSize: 20)),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.only(top: 18),
                            shrinkWrap: true,
                            itemCount: NOTES.length,
                            itemBuilder: (_, index) {
                              return Text(NOTES[index], style: TextStyle(color: TXT_COLOR, fontSize: 11), textAlign: TextAlign.center);
                            }
                          ),
                          SizedBox(height: 18),
                          Text('ADDRESS', style: TextStyle(color: Colors.yellow, fontSize: 20)),
                          SizedBox(height: 18),
                          Text(ADDRESS, style: TextStyle(color: Colors.yellow, fontSize: 12, fontWeight: FontWeight.w100, decoration: TextDecoration.underline), textAlign: TextAlign.center),
                          SizedBox(height: 18),
                          Wrap(
                            alignment: WrapAlignment.center,
                            children: <Widget>[
                              Icon(Icons.camera_alt, size: 12, color: Colors.yellow),
                              SizedBox(width: 2),
                              Text('INSTAGRAM', style: TextStyle(color: Colors.yellow, fontSize: 12, fontWeight: FontWeight.w100, decoration: TextDecoration.underline)),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: APPBAR_HEIGHT,
              child: FlatButton(
                padding: EdgeInsets.only(left: 12, right: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                color: Colors.yellow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('24-HOUR INSIDER TIPS', style: TextStyle(fontWeight: FontWeight.w600)),
                    Icon(Icons.arrow_forward_ios, color: ICON_COLOR, size: 14)
                  ]
                ),
                onPressed: () {},
              ),
            ),
            Container(
              width: double.infinity,
              height: APPBAR_HEIGHT,
              child: FlatButton(
                padding: EdgeInsets.only(left: 12, right: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                color: LIGHT_COLOR,
                child: Text('SOLD OUT', style: TextStyle(color: TXT_COLOR, fontSize: SUBTITLE_SIZE)),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}