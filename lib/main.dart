import 'package:flutter/material.dart';
import 'person.dart';
import 'person_container.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Nubs Breakfast',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload z  in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.deepOrange,
      ),
      home: new MyHomePage(title: 'The Nubs Breakfast Club'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Set<Person> _nubs = new Set<Person>.from([
    new Person(
      firstName: "Shane",
      lastName: "Spoor",
      nickname: "Shaner",
      birthday: new DateTime(1994, 8, 2),
      image: "assets/shaner.png",
    ),
    new Person(
      firstName: "Salman",
      lastName: "Shaharyar",
      nickname: "The Legendary Pokemon",
      birthday: new DateTime(1988, 4, 4),
      image: "assets/salmaster.png",
    ),
    new Person(
      firstName: "Abhishek",
      lastName: "Bhardwaj",
      nickname: "Abmaster",
      birthday: new DateTime(1993, 8, 16),
      image: "assets/abhishake.png",
    ),
  ]);

  Set<Person> _breakfast = new Set<Person>.from([
    new Person(
      firstName: "Shane",
      lastName: "Spoor",
      nickname: "Shaner",
      birthday: new DateTime(1994, 8, 2),
      image: "assets/shaner.png",
    ),
  ]);

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // I'm sure there's a better way to do all of this crazy height stuff,
        // but I'm just hacking this together for fun
        child: new SizedBox (
          height: ((MediaQuery.of(context).size.width - 3.0) * 2) -
                  ((MediaQuery.of(context).size.width - 3.0) / 1.8) +
                  30.0,
          child: new Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // Labels for each part of the Venn diagram
              new Positioned(
                top: 0.0,
                child: new Text("Nubs"),
              ),
              new Positioned(
                bottom: 0.0,
                child: new Text("People who are down to go out for breakfast"),
              ),
              new Positioned(
                top: (((MediaQuery.of(context).size.width - 3.0) * 2) -
                     ((MediaQuery.of(context).size.width - 3.0) / 1.8) +
                     30.0) / 3,
                child: new Text("Cool people"),
              ),

              // The circles making up the Venn diagram
              new Positioned(
                top: 15.0,
                left: 0.0,
                child: new Container(
                  width: MediaQuery.of(context).size.width - 3.0,
                  height: MediaQuery.of(context).size.width - 3.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: new Border.all(color: Theme.of(context).primaryColor, width: 3.0),
                  ),
                ),
              ),
              new Positioned(
                bottom: 15.0,
                left: 0.0,
                child: new Container(
                  width: MediaQuery.of(context).size.width - 3.0,
                  height: MediaQuery.of(context).size.width - 3.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      border: new Border.all(color: Theme.of(context).primaryColor, width: 3.0)
                  ),
                ),
              ),

              // Rows containing images of people in the respective rows
              new Positioned(
                top: 15.0 + MediaQuery.of(context).size.width / 10.0,
                child: new Row(
                  children: _nubs.difference(_breakfast).map((Person p) {
                    return new SizedBox(
                      height: MediaQuery.of(context).size.width / 5.0,
                      width: MediaQuery.of(context).size.width / 5.0,
                      child: new PersonContainer(person: p, isCool: false),
                    );
                  }).toList()
                )
              ),
              new Positioned(
                top: (((MediaQuery.of(context).size.width - 3.0) * 2) -
                     ((MediaQuery.of(context).size.width - 3.0) / 1.8) +
                     30.0) / 3 +
                     MediaQuery.of(context).size.width / 10.0,
                child: new Row(
                  children: _nubs.intersection(_breakfast).map((Person p) {
                    return new SizedBox(
                      height: MediaQuery.of(context).size.width / 5.0,
                      width: MediaQuery.of(context).size.width / 5.0,
                      child: new PersonContainer(person: p, isCool: true),
                    );
                  }).toList()
                )
              ),
              new Positioned(
                bottom: 15.0,
                child: new Row(
                  children: _breakfast.difference(_nubs).map((Person p) {
                    return new SizedBox(
                      height: MediaQuery.of(context).size.width / 5.0,
                      width: MediaQuery.of(context).size.width / 5.0,
                      child: new PersonContainer(person: p, isCool: false),
                    );
                  }).toList()
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
