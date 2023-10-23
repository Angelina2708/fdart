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
        title: Text('Переглядач картинок :)'),
      ),
      body: Column(
        children: [
          Text(
            'Переглядач картинок: Funny animamls',
            style: TextStyle(fontSize: 26),
            textAlign: TextAlign.center,
          ),
          Image.file(File('images/10.jpg'), width: 500, height: 350),
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
  int totalImages = 3; // Загальна кількість фотографій в папці (змініть на відповідне значення)

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(
              File('${widget.imagePath}/${widget.categoryName.toLowerCase()}-$currentImageIndex.jpeg'),
              width: 200,
              height: 200,
            ),
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
  }
}
