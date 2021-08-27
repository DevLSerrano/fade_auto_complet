import 'package:fade_auto_complet/fade_auto_complet.dart';
import 'package:fade_auto_complet/fade_auto_complet_future.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();
  final myFutureController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auto Complete Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              child: FadeAutoComplete(
                controller: myController,
                decoration: InputDecoration(
                  hintText: 'List Preenchida',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                keys: [
                  'teste',
                  'teste teste',
                  'Teste agua',
                  'Teste super',
                  'teste almeida',
                  'experiente',
                  'experiente fluxo',
                  'Porto',
                  'Porto pedra',
                  'Porto Pedra',
                  'Porto Pedra Pereira Agua',
                  'Preenchimento automatico de texto com fade como principal função'
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 300,
              height: 50,
              child: FadeAutoCompleteFuture(
                controller: myFutureController,
                decoration: InputDecoration(
                  hintText: 'List Future',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                getKeys: getKeys,
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<List<String>> getKeys() async {
    return await Future.delayed(Duration(seconds: 3), () {
      return [
        'teste',
        'teste teste',
        'Teste agua',
        'Teste super',
        'teste almeida',
        'experiente',
        'experiente fluxo',
        'Porto',
        'Porto pedra',
        'Porto Pedra',
        'Porto Pedra Pereira Agua',
        'Preenchimento automatico de texto com fade como principal função'
      ];
    });
  }
}
