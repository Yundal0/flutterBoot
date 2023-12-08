
import 'dart:math';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPoints = 0;

  void _showPointDialog() {
    showDialog(
      context: context,
      barrierDismissible: true, // 사용자가 다이얼로그 외부를 탭할 때 닫히도록 설정
      builder: (BuildContext context) {
        // 랜덤 점수 생성
        final List<int> randomPoints =
            List.generate(3, (index) => Random().nextInt(100) + 1);
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // 다이얼로그 모서리를 둥글게 설정
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 425,
              height: 150,
              child: Column(
                mainAxisSize: MainAxisSize.min, // 다이얼로그 내용에 맞게 크기 조절
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Choose your next point!',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24.0),
                  const Text('Choose one of the points below!'),
                  const Text(
                      'If you don\'t make a selection, your current score will be retained.'),
                  const SizedBox(height: 24.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: randomPoints
                        .map((points) => TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.transparent),
                              onPressed: () {
                                setState(() {
                                  _currentPoints = points;
                                });
                                Navigator.of(context).pop(); // 점수를 선택하면 다이얼로그 닫기
                              },
                              child: Text('$points'),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Your point : $_currentPoints',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22.0)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showPointDialog,
              child: Text('I want more points!',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15.0)),
            ),
          ],
        ),
      ),
    );
  }
}