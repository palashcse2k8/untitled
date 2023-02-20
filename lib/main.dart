import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp1());
}

class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePg(title: "flutter demo"),
    );
  }
}

class MyHomePg extends StatefulWidget {
  const MyHomePg({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _MyHomePgState();
}

class _MyHomePgState extends State<MyHomePg> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      ++_counter;
    });
  }

  void _decrementCounter() {
    setState(() {
      --_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: (_counter % 2 == 0) ? Colors.red : Colors.brown,
        ),
        body: Builder(
          builder: (BuildContext context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Current Value :',
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        '$_counter',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  )),
                  TextButton(
                    child: const Text('Open BottomSheet'),
                    onPressed: () {
                      Scaffold.of(context).showBottomSheet<void>(
                        (BuildContext context) {
                          return Container(
                            alignment: Alignment.center,
                            height: 200,
                            color: Colors.amber,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const Text('BottomSheet'),
                                  OutlinedButton(
                                    onPressed: () async {
                                      await Future<void>.delayed(
                                          const Duration(seconds: 1));
                                      if (context.mounted) {
                                        Navigator.of(context).pop();
                                      }
                                    },
                                    child: const Text('Delayed pop'),
                                  ),
                                  ElevatedButton(
                                    child: const Text('Close BottomSheet'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: Wrap(
          direction: Axis.vertical,
          children: <Widget>[
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: "my tooltip",
              child: const Icon(Icons.plus_one),
            ),
            FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: "my tooltip",
              child: const Icon(Icons.exposure_minus_1),
            )
          ],
        ));
  }
}
