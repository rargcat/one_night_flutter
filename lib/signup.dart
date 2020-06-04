import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: Text('Sign Up'.toUpperCase(), style: TextStyle(fontSize: 16, color: Colors.white)),
        )
      ),
      backgroundColor: Color.fromARGB(255, 45, 45, 45),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 44,
                  child: FlatButton( 
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    color: Colors.grey,
                    textColor: Colors.white70,
                    child: Text("Sign Up".toUpperCase(), style: TextStyle(fontSize: 13)),
                    onPressed: () {},
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 44,
                          width: double.infinity,
                          child: FlatButton.icon(
                            icon: Icon(Icons.face),
                            label: Text("Sign Up With Facebook".toUpperCase()),
                            textColor: Colors.white70,
                            color: Color.fromARGB(255, 59, 89, 152),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Flexible(child: Divider(color: Colors.grey), flex: 1),
                              Padding(
                                padding: const EdgeInsets.only(left: 8, right: 8),
                                child: Text("OR", style: TextStyle(letterSpacing: -1, color: Colors.white70, fontSize: 20)),
                              ),
                              Flexible(child: Divider(color: Colors.grey), flex: 1)
                            ]
                          ),
                        ),
                        SizedBox(height: 12),
                        Text("Sign Up With Email Address".toUpperCase(), style: TextStyle(letterSpacing: -1, color: Colors.white70, fontSize: 20)),
                        SizedBox(height: 12),
                        Container(
                          height: 44,
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide: new BorderSide(color: Colors.grey, width: 0.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide: new BorderSide(color: Colors.grey, width: 0.5),
                              ),
                              labelText: "Email Address",
                              labelStyle: TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          height: 44,
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide: new BorderSide(color: Colors.grey, width: 0.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide: new BorderSide(color: Colors.grey, width: 0.5),
                              ),
                              labelText: "Password",
                              labelStyle: TextStyle(fontSize: 15, color: Colors.grey),
                              suffixIcon: Icon(Icons.remove_red_eye, size: 16, color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Text("Already Have An Account?".toUpperCase(), 
                          style: TextStyle(fontWeight: FontWeight.w100, color: Colors.white70),
                        ),
                        SizedBox(height: 16),
                        Text("Log In".toUpperCase(), 
                          style: TextStyle(fontWeight: FontWeight.w100, color: Colors.yellow, decoration: TextDecoration.underline),
                        ),
                        SizedBox(height: 48),
                        Text("Terms of Service / Privacy Policy".toUpperCase(), 
                          style: TextStyle(fontWeight: FontWeight.w100, color: Colors.yellow, decoration: TextDecoration.underline),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}