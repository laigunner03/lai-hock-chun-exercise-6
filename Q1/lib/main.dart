import 'package:flutter/material.dart';
import 'package:flutter_bloc_exercise_2/counterbloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 final CounterBloc _counterBloc = CounterBloc();
  
  @override
  void dispose() {
    // Don't forget to close all the stream
    _counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          // wrap counter text with StreamBuilder
          // it rebuilds itself when new data comes in stream
          StreamBuilder<int>(
            //listen to the counterStream
            stream: _counterBloc.counterStream,
            initialData: 0,
            builder: (context, snapshot) {
              // get the data
              final counter = snapshot.data;
              return Text(
                '$counter',
                style: Theme.of(context).textTheme.headline4,
              );
            },
          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    ),
  );
}
// this call back will be called on button press
void _incrementCounter() {
  // add event to notify bloc
  _counterBloc.eventSink.add(CounterEvent.Increment);
}
}