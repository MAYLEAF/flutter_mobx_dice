import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'dice_counter.dart';

final diceCounter = DiceCounter();

void main() {
  runApp(FlutterMobxDiceApp());
}

class FlutterMobxDiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: TextButton(
                  child: Observer(
                    builder: (_) =>
                        Image.asset('images/dice${diceCounter.left}.png'),
                  ),
                  onPressed: diceCounter.roll,
                )),
                Expanded(
                    child: TextButton(
                  child: Observer(
                    builder: (_) =>
                        Image.asset('images/dice${diceCounter.right}.png'),
                  ),
                  onPressed: diceCounter.roll,
                )),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Observer(
                builder: (context) => Text('Total ${diceCounter.total}',
                    style: Theme.of(context).textTheme.headline4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
