import 'package:flutter/material.dart';
import 'package:one_night/constants.dart';
import 'package:one_night/hotel_list.dart';

class CityList extends StatelessWidget {

  CityList({this.hasClose = false});
  final bool hasClose;

  final filterCity = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BG_COLOR,
      appBar: hasClose ? PreferredSize(
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
      ) : null,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
              child: TextField(
                cursorColor: Color.fromARGB(255, 199, 190, 95),
                cursorWidth: 0.8,
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, size: 24, color: ICON_COLOR),
                  prefixIconConstraints: BoxConstraints.tightFor(height: 24, width: 36),
                  border: InputBorder.none,
                  hintText: 'Enter city',
                  hintStyle: TextStyle(color: LIGHT_COLOR),
                  filled: true,
                  fillColor: TXT_BG_COLOR
                ),
                onChanged: (text) => filterCity.value = text,
              ),
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: filterCity,
                builder: (context, value, _) {
                  final newList = Data.CITIES.where((e) => e == '' || e.toLowerCase().contains(value.toLowerCase())).toList();
                  return ListView.builder(
                    itemCount: newList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Center(
                          child: Text(newList[index].toUpperCase(), 
                            style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 14,
                              fontFamily: PRIMARY_FONT,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                        onTap: () {
                          if (!hasClose) {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HotelList(newList[index])));
                          } else {
                            Navigator.pop(context, newList[index]);
                          }
                        },
                      );
                    }
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}