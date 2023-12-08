import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterBoot',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HelloLayout(),
    );
  }
}


class HelloLayout extends StatelessWidget {
  const HelloLayout({Key? key}) : super(key: key);

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('I can layout this'),
      backgroundColor: Colors.red,
    );
  }

  Widget _getRemains() {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.yellow,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.brown,
            ),
          )
        ],
      ),
    );
  }

  BorderSide _getTableBorder() {
    return const BorderSide(
      width: 5,
      color: Colors.black,
      style: BorderStyle.solid,
    );
  }

  Widget _getTable(BuildContext context) {
    return Table(
      border: TableBorder(
        horizontalInside: _getTableBorder(),
        verticalInside: _getTableBorder(),
      ),
      children: <TableRow>[
        TableRow(children: <Widget>[
          TableCell(
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(color: Colors.grey),
            ),
          ),
          TableCell(
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                alignment: Alignment.topCenter,
                child: AspectRatio(
                  aspectRatio: 2 / 1,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          )
        ]),
        TableRow(children: <Widget>[
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.bottom,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: AspectRatio(
                  aspectRatio: 3 / 1,
                  child: Container(
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ),
          TableCell(
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                alignment: Alignment.topCenter,
                child: AspectRatio(
                  aspectRatio: 2 / 1,
                  child: Container(
                    color: Colors.yellowAccent,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        _getTable(context),
        _getRemains(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    ));
  }
}