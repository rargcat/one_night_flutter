import 'package:flutter/material.dart';
import 'package:one_night/login.dart';
import 'package:one_night/signup.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 45, 45, 45),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(44),
        child: AppBar(
          elevation: 1,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            splashColor: Colors.transparent,
            icon: Icon(Icons.arrow_back_ios, size: 15),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          title: Text('Settings', style: TextStyle(fontSize: 16, color: Colors.white)),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 28, 12, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            InkWell(
              child: Container(
                constraints: BoxConstraints.expand(height: 42),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(125, 45, 45, 45),
                  border: Border.all(color: Colors.grey)
                ),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Log In', style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                  )),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => Login()));
              },
            ),
            SizedBox(height: 15),
            InkWell(
              child: Container(
                constraints: BoxConstraints.expand(height: 42),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(125, 45, 45, 45),
                  border: Border.all(color: Colors.grey)
                ),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Create Account', style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                  )),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignUp()));
              },
            ),
            SizedBox(height: 15),
            InkWell(
              child: Container(
                constraints: BoxConstraints.expand(height: 42),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(125, 45, 45, 45),
                  border: Border.all(color: Colors.grey)
                ),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Contact', style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.0,
                      )),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.arrow_forward_ios, size: 15, color: Colors.white),
                      ),
                    )
                  ],
                )
              ),
              onTap: () {},
            ),
            SizedBox(height: 15),
            InkWell(
              child: Container(
                constraints: BoxConstraints.expand(height: 42),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(125, 45, 45, 45),
                  border: Border.all(color: Colors.grey)
                ),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('FAQ', style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.0,
                      )),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.arrow_forward_ios, size: 15, color: Colors.white),
                      ),
                    )
                  ],
                )
              ),
              onTap: () {},
            ),
            SizedBox(height: 15),
            InkWell(
              child: Container(
                constraints: BoxConstraints.expand(height: 42),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(125, 45, 45, 45),
                  border: Border.all(color: Colors.grey)
                ),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Terms / Privacy Policy', style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.0,
                      )),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.arrow_forward_ios, size: 15, color: Colors.white),
                      ),
                    )
                  ],
                )
              ),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}