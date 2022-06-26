import 'package:flutter/material.dart';
import 'package:online_food_app/src/ui/main/MainNavigation.dart';
import 'package:online_food_app/src/utility/SessionManager.dart';

class Akun extends StatefulWidget {
  @override
  State<Akun> createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                  left: 30.0,
                  right: 30.0,
                  top: 100.0,
                ),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            30.0,
                          ),
                        ),
                        color: Colors.blue,
                        onPressed: () {
                          SessionManager().removeSession();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainNavigation(),
                              ),
                              (route) => false);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 20.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 16.0,
                                width: 16.0,
                              ),
                              Expanded(
                                child: Text(
                                  'LOGOUT',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // Text('Akun'),
              // FlatButton(
              //   onPressed: () {
              //     SessionManager().removeSession();
              //     Navigator.pushAndRemoveUntil(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => MainNavigation(),
              //         ),
              //         (route) => false);
              //   },
              //   child: Text('Logout'),
              // )
            ],
          ),
        ),
      ),
    );
  }

 
}
