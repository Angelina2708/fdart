import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Лабораторна робота №2, перегляд картинок як слайдер ;)'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Переглядач картинок: Funny animals',
                    style: TextStyle(fontSize: 26),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Image.file(File('images/10.jpg'), width: constraints.maxWidth, height: constraints.maxHeight * 0.4),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CategoryScreen('dogs', 'images/dogs'),
                            ),
                          );
                        },
                        child: Text('dogs'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CategoryScreen('cats', 'images/cats'),
                            ),
                          );
                        },
                        child: Text('cats'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CategoryScreen('rabbits', 'images/rabbits'),
                            ),
                          );
                        },
                        child: Text('rabbits'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CategoryScreen extends StatefulWidget {
  final String categoryName;
  final String imagePath;

  CategoryScreen(this.categoryName, this.imagePath);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int currentImageIndex = 1;
  int totalImages = 3;

  void showNextImage() {
    if (currentImageIndex < totalImages) {
      setState(() {
        currentImageIndex++;
      });
    }
  }

  void showPreviousImage() {
    if (currentImageIndex > 1) {
      setState(() {
        currentImageIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.file(
                    File('${widget.imagePath}/${widget.categoryName.toLowerCase()}-$currentImageIndex.jpeg'),
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.4,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: showPreviousImage,
                        icon: Icon(Icons.arrow_back),
                      ),
                      IconButton(
                        onPressed: showNextImage,
                        icon: Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('На головну'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
