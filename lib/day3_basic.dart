import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        children: [
          // 위쪽은 Expanded 고정 박아놓고
          // 아래쪽은 fittedBox??

          Expanded(
              child: Container(
            color: Colors.red,
          )),
          Flexible(
            flex: 6,
            child: Row(
              children: [
                Flexible(
                    child: Column(
                  children: [
                    Flexible(
                        child: Container(
                      color: Colors.blue,
                    )),
                    Flexible(
                        child: Container(
                      color: Colors.white,
                    )),
                  ],
                )),
                Flexible(
                    child: Column(
                  children: [
                    Flexible(
                        child: Container(
                      color: Colors.blue,
                    )),
                    Flexible(
                        child: Container(
                      color: Colors.white,
                    )),
                  ],
                )),
              ],
            ),
          ),
          Flexible(
            child: Container(
              color: Colors.green,
            ),
            flex: 4,
          ),

          Row(),
          Container(),
          Container(),
        ],
      )),
    );
  }
}
