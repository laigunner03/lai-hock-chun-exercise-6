import 'capitalizationbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => CubitConvert(),
        child: const MyHomePage(
          title: 'Flutter Demo Home Page',
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textController = TextEditingController();
  var userInput = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _getUserInput(),
    );
  }

  Widget _getUserInput() {
    return Form(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Enter word to capitalize :',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: textController,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              child: ElevatedButton(
                onPressed: () => {
                  context
                      .read<CubitConvert>()
                      .wordCapitalize(textController.text)
                },
                child: const Text('Capitalize'),
              ),
            ),
            BlocBuilder<CubitConvert, String>(builder: (context, state) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  state,
                  style: TextStyle(fontSize: 30),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
