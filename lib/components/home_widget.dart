import 'package:flutter/material.dart';
import '../screens/shelf.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    Shelf(),
    Shelf(),
    Shelf(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.book),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.lightbulb),
            label: 'Recommendations',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Read'
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    // setState triggers build method to be run again with with the state passed in
    setState(() {
      _currentIndex = index;
    });
  }


}