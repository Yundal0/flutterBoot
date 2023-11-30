import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  TextEditingController firstTextController =
      TextEditingController(text: 'Hello');
  TextEditingController secondTextController =
      TextEditingController(text: 'FlutterBoot!');

  void changeFocus(
      BuildContext context, FocusNode currentFocus, FocusNode targetFocus) {
    if (currentFocus.hasFocus && currentFocus.context != null) {
      FocusScope.of(context).requestFocus(targetFocus);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello TextField!'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: RawKeyboardListener(
                    focusNode: FocusNode(), // RawKeyboardListener용 별도 FocusNode
                    onKey: (RawKeyEvent event) {
                      if (event is RawKeyDownEvent &&
                          event.logicalKey == LogicalKeyboardKey.backspace &&
                          firstTextController.text.isEmpty) {
                        changeFocus(context, firstFocusNode, secondFocusNode);
                      }
                    },
                    child: TextField(
                      focusNode: firstFocusNode,
                      controller: firstTextController,
                      onChanged: (String value) {
                        if (value.isEmpty) {
                          changeFocus(context, firstFocusNode, secondFocusNode);
                        }
                      },
                      onSubmitted: (String value) {
                        changeFocus(context, firstFocusNode, secondFocusNode);
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: RawKeyboardListener(
                    focusNode: FocusNode(),
                    onKey: (RawKeyEvent event) {
                      if (event is RawKeyDownEvent &&
                          event.logicalKey == LogicalKeyboardKey.backspace &&
                          secondTextController.text.isEmpty) {
                        changeFocus(context, secondFocusNode, firstFocusNode);
                      }
                    },
                    child: TextField(
                      focusNode: secondFocusNode,
                      controller: secondTextController,
                      onChanged: (String value) {
                        if (value.isEmpty) {
                          changeFocus(context, secondFocusNode, firstFocusNode);
                        }
                      },
                      onSubmitted: (String value) {
                        changeFocus(context, secondFocusNode, firstFocusNode);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
