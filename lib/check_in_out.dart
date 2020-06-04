import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_night/city_list.dart';
import 'package:one_night/constants.dart';

final DateTime now = DateTime.now();
final days = ValueNotifier(1);

const double TXT_FIELD_HEIGHT = 44.0;

class CheckInOut extends StatelessWidget {

  CheckInOut(String city) {
    this.city.value = city;
  }

  final city = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    String checkInLabel = DateFormat('EEEEE, MMM dd').format(now);
    String oldCity = city.value;

    return Scaffold(
      backgroundColor: BG_COLOR_2,
      appBar: PreferredSize(
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            IconButton(
              splashColor: Colors.transparent,
              icon: Icon(Icons.close, size: ICON_SIZE, color: ICON_COLOR), 
              onPressed: () {
                Navigator.of(context).pop();
              }
            )
          ],
        ), 
        preferredSize: Size.fromHeight(APPBAR_HEIGHT)
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 2, left: 12, right: 12),
          child: Stack(
            children: <Widget>[
              Container(
                constraints: BoxConstraints.expand(),
                child: Column(
                  children: <Widget>[
                    ValueListenableBuilder(
                      valueListenable: city,
                      builder: (context, value, _) {
                        return InkWell(
                          child: Container(
                            color: TXT_BG_COLOR,
                            constraints: BoxConstraints.expand(height: TXT_FIELD_HEIGHT),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 4, left: 8),
                              child: Stack(
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('CITY', style: TextStyle(color: TXT_COLOR, fontSize: SUBTITLE_SIZE)),
                                      Text(value.toUpperCase(), style: TextStyle(color: value != oldCity ? Colors.yellow : TXT_COLOR_2, fontSize: SUBTITLE_SIZE)),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(Icons.arrow_forward_ios, color: ICON_COLOR, size: 16),
                                  )
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            () async {
                              final result = await Navigator.of(context).push(MaterialPageRoute(builder: (_) => CityList(hasClose: true)));
                              if (result != value) {
                                oldCity = value;
                                city.value = result;
                              }
                            }();
                          },
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    Container(
                      color: TXT_BG_COLOR,
                      constraints: BoxConstraints.expand(height: TXT_FIELD_HEIGHT),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4, left: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Check In'.toUpperCase(), style: TextStyle(color: TXT_COLOR, fontSize: SUBTITLE_SIZE)),
                            Text('$checkInLabel'.toUpperCase(), style: TextStyle(color: TXT_COLOR_2, fontSize: SUBTITLE_SIZE)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CheckOut(days),
                        SizedBox(width: 10),
                        NumberOfNights(),
                      ],
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  child: Container(
                    constraints: BoxConstraints.expand(height: 40),
                    color: Color.fromARGB(255, 158, 136, 85),
                    child: Center(
                      child: Text('OK', style: TextStyle(fontSize: SUBTITLE_SIZE, color: TXT_COLOR)),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context, city.value);
                  },
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}

class CheckOut extends StatelessWidget {

  const CheckOut(this.days);
  final ValueListenable<int> days;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: days, 
      builder: (context, value, _) {
        return Expanded(
          child: Container(
            height: TXT_FIELD_HEIGHT,
            color: TXT_BG_COLOR,
            child: Padding(
              padding: const EdgeInsets.only(right: 4, left: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('CHECK OUT', style: TextStyle(color: TXT_COLOR, fontSize: SUBTITLE_SIZE)),
                  Text("${getCheckOut(value)}".toUpperCase(), style: TextStyle(color: value == 1 ? TXT_COLOR_2 : Colors.yellow, fontSize: SUBTITLE_SIZE)),
                ],
              ),
            ),
          ),
          flex: 1,
        );
      }
    );
  }

  String getCheckOut(int value) {
    return DateFormat('EEEEE, MMM dd').format(now.add(Duration(days: value)));
  }
}

class NumberOfNights extends StatefulWidget {
  @override
  _NumberOfNightsState createState() => _NumberOfNightsState();
}

class _NumberOfNightsState extends State<NumberOfNights> {
  bool isExpanded = false;
  String selected = '1';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      child: Column(
        children: <Widget>[
          InkWell(
            child: Container(
              height: TXT_FIELD_HEIGHT,
              color: TXT_BG_COLOR,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('# OF NIGHTS', style: TextStyle(color: TXT_COLOR, fontSize: 11)),
                    SizedBox(height: 2),
                    Row(
                      children: <Widget>[
                        Icon(Icons.expand_more, color: TXT_COLOR, size: 11),
                        SizedBox(width: 24, height: 0),
                        Text('$selected', style: TextStyle(color: selected == '1' ? Color.fromARGB(175, 175, 175, 175) : Colors.yellow, fontSize: 11))
                      ],
                    )
                  ],
                ),
              ),
            ),
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
          ),
          SizedBox(
            height: 300,
            child: Visibility(
              child: ListView.builder(
                itemCount: 7,
                itemBuilder: (_, index) {
                  return Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      SizedBox(height: 4),
                      InkWell(
                        child: Container(
                          constraints: BoxConstraints.tightFor(width: 74, height: TXT_FIELD_HEIGHT),
                          color: TXT_BG_COLOR,
                          child: Center(
                            child: Text("${index + 1}", style: TextStyle(fontSize: SUBTITLE_SIZE, color: "${index + 1}" == selected && selected != '1' ? Colors.yellow : TXT_COLOR)),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selected = "${index + 1}";
                            isExpanded = false;
                            days.value = index + 1;
                          });
                        },
                      )
                    ],
                  );
                }
              ),
              visible: isExpanded,
            ),
          )
        ],
      ),
    );
  }
}