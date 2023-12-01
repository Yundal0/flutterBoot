import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SpaceObjectsScreen(),
    );
  }
}

class SpaceObjectsScreen extends StatefulWidget {
  @override
  _SpaceObjectsScreenState createState() => _SpaceObjectsScreenState();
}

class _SpaceObjectsScreenState extends State<SpaceObjectsScreen> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, int> spaceData = {
    'NGC 162': 1862,
    '87 Sylvia': 1866,
    'R 136a1': 1985,
    '28978 Ixion': 2001,
    'NGC 6715': 1778,
    '94400 Hongdaeyong': 2001,
    '6354 Vangelis': 1934,
    'C/2020 F3': 2020,
    'Cartwheel Galaxy': 1941,
    'Sculptor Dwarf Elliptical Galaxy': 1937,
    'Eight-Burst Nebula': 1835,
    'Rhea': 1672,
    'C/1702 H1': 1702,
    'Messier 5': 1702,
    'Messier 50': 1711,
    'Cassiopeia A': 1680,
    'Great Comet of 1680': 1680,
    'Butterfly Cluster': 1654,
    'Triangulum Galaxy': 1654,
    'Comet of 1729': 1729,
    'Omega Nebula': 1745,
    'Eagle Nebula': 1745,
    'Small Sagittarius Star Cloud': 1764,
    'Dumbbell Nebula': 1764,
    '54509 YORP': 2000,
    'Dia': 2000,
    '63145 Choemuseon': 2000,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My First ListView!'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: spaceData.length,
        itemBuilder: (context, index) {
          String key = spaceData.keys.elementAt(index);
          return Card(
             color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListTile(
               leading: Text('🛰️', style: TextStyle(fontSize: 24)), 
              title: Text('$key was discovered in ${spaceData[key]}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0.0,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
        },
        child: Icon(Icons.arrow_upward),
      ),
    );
  }
}
