import 'dart:async';
import 'package:flutter/material.dart';

class GaugePage extends StatefulWidget {
  @override
  _GaugePageState createState() => _GaugePageState();
}

class _GaugePageState extends State<GaugePage> {
  double gaugeValue = 0.0;
  int score = 0;
  Timer? timer;

  void increaseGauge() {
    const increment = 0.1;
    const maxGaugeValue = 1.0;

    if (timer != null && timer!.isActive) {
      timer!.cancel();
    }

    setState(() {
      gaugeValue += increment;
      if (gaugeValue >= maxGaugeValue) {
        gaugeValue = maxGaugeValue;
        score++;
      }
    });

    timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        gaugeValue -= increment / 2;
        if (gaugeValue <= 0) {
          gaugeValue = 0;
          timer.cancel();
          score = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Column(children: [
                const Text('Your score',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Text('$score',
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold)),
              ]),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 400,
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RotatedBox(
                      quarterTurns: -1,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: 300,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          child: LinearProgressIndicator(
                            value: gaugeValue,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.purple),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Colors.purple.withOpacity(0.5)),
                          minimumSize: MaterialStateProperty.all(Size(75, 75)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)))),
                      onPressed: increaseGauge,
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}