import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OwnCard(),
    );
  }
}

class OwnCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isLandscape = screenWidth > screenHeight;

    return Scaffold(
      appBar: AppBar(
        title: Text('Own Card'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(isLandscape ? 40.0 : 20.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromRGBO(4, 250, 25, 1), Colors.blueAccent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (isLandscape)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 120.0,
                      backgroundImage: FileImage(File('img/1.jpg')),
                    ),
                    SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nianchur Angelina',
                          style: TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Student of Ogienko university',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              if (!isLandscape)
                Column(
                  children: [
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: FileImage(File('img/1.jpg')),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Nianchur Angelina',
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Student of Ogienko university',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              SizedBox(height: isLandscape ? 40.0 : 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.email, color: Colors.white),
                  SizedBox(width: 10.0),
                  Text(
                    'kn1b21.nianchur@kpnu.edu.ua',
                    style: TextStyle(
                      fontSize: isLandscape ? 12.0 : 8.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: isLandscape ? 20.0 : 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.phone, color: Colors.white),
                  SizedBox(width: 10.0),
                  Text(
                    '0965951600',
                    style: TextStyle(
                      fontSize: isLandscape ? 12.0 : 8.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
