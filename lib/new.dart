import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
        builder: (context) => MaterialApp(
          title: 'ShowcaseView Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeScreen(),
        ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey _one = GlobalKey();
  GlobalKey _two = GlobalKey();
  GlobalKey _three = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
          (_) => ShowCaseWidget.of(context).startShowCase([_one, _two, _three]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShowcaseView Demo'),
        actions: [
          Showcase(
            key: _one,
            description: 'This is the settings button',
            child: IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Showcase(
              key: _two,
              description: 'This is the add button',
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Add'),
              ),
            ),
            SizedBox(height: 20),
            Showcase(
              key: _three,
              description: 'This is a sample text widget',
              child: Text('Hello, ShowcaseView!'),
            ),
          ],
        ),
      ),
    );
  }
}
