import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OverlayDemo(),
    );
  }
}

class OverlayDemo extends StatefulWidget {
  @override
  _OverlayDemoState createState() => _OverlayDemoState();
}

class _OverlayDemoState extends State<OverlayDemo> {
  OverlayEntry? _overlayEntry;
  final List<GlobalKey> _buttonKeys = List.generate(4, (_) => GlobalKey());
  final List<LayerLink> _layerLinks = List.generate(4, (_) => LayerLink());
  bool _isOverlayVisible = false;

  void _showOverlay(BuildContext context, int buttonIndex) {
    _overlayEntry = _createOverlayEntry(context, buttonIndex);
    Overlay.of(context)!.insert(_overlayEntry!);
    setState(() => _isOverlayVisible = true);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    setState(() {
      _isOverlayVisible = false;
      _overlayEntry = null;
    });
  }

OverlayEntry _createOverlayEntry(BuildContext context, int buttonIndex) {
  final RenderBox renderBox = _buttonKeys[buttonIndex].currentContext!.findRenderObject() as RenderBox;
  final size = renderBox.size;
  final offset = renderBox.localToGlobal(Offset.zero);

  return OverlayEntry(
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _removeOverlay,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: CompositedTransformFollower(
                link: _layerLinks[buttonIndex],
                showWhenUnlinked: false,
                                offset: Offset(size.width / 2, -30), // 오버레이 위치 조정
                child: Material(
                  elevation: 4.0,
                  child: Container(
                    color: Colors.grey,
                    child: const Text(" ↓ You clicked this 😎"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(int index) {
    final buttonTitles = ["Hello!", "Press", "any", "button!"];

    return CompositedTransformTarget(
      link: _layerLinks[index],
      child: ElevatedButton(
        key: _buttonKeys[index], // GlobalKey 할당
        style: ButtonStyle(
          minimumSize:
              MaterialStateProperty.all<Size>(const Size(double.infinity, 36)),
        ),
        onPressed: () {
          if (_isOverlayVisible) {
            _removeOverlay();
          } else {
            _showOverlay(context, index);
          }
        },
        child: Text(buttonTitles[index]), 
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello Overlay"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(4, (index) => _buildButton(index)),
        ),
      ),
    );
  }
}