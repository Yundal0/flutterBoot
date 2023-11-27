import 'dart:math';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int squareCount = 0;
  int circleCount = 0;
  Random random = Random();
  String draggableShape = 'square'; 
  void incrementCount(String shape) {
    setState(() {
      if (shape == 'square') {
        squareCount++;
      } else {
        circleCount++;
      }
      draggableShape = random.nextBool() ? 'square' : 'circle';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildTargetShape('square', squareCount),
              buildTargetShape('circle', circleCount),
            ],
          ),
          Draggable<String>(
            data: draggableShape,
            feedback: draggableShapeWidget(draggableShape),
            childWhenDragging: Container(),
            child: draggableShapeWidget(draggableShape),
          ),
        ],
      ),
      
    );
  }

  Widget buildTargetShape(String shape, int count) {
    return DragTarget<String>(
      onAccept: (data) {
        if (data == shape) {
          incrementCount(shape);
        }
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: shape == 'square' ? BorderRadius.circular(5) : null,
            border: Border.all(color: Colors.black, width: 2),
            shape: shape == 'square' ? BoxShape.rectangle : BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$count',
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
          ),
        );
      },
    );
  }

  Widget draggableShapeWidget(String shape) {
    return Material(
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: shape == 'square' ? BorderRadius.circular(5) : null,
          border: Border.all(color: Colors.black, width: 2),
          shape: shape == 'square' ? BoxShape.rectangle : BoxShape.circle,
        ),
        child: const Center(
          child: Text(
            'Drag me!',
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
      ),
    );
  }
}