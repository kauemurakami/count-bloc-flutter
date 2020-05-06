import 'package:counterblocflutter/blocs/home_page/home_event.dart';
import 'package:counterblocflutter/theme/theme_app.dart';
import 'package:flutter/material.dart';

import 'blocs/home_page/home_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    final _bloc = HomeBloc();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder(
            stream: _bloc.counter,
            initialData: 0,
            builder: (context, snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    snapshot.data.toString(),
                    style: Theme.of(context).textTheme.display1,
                  ),
                ],
              );
            }),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        FloatingActionButton(
          onPressed: () => _bloc.counterEventSink.add(IncrementEvent()),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        SizedBox(width: 12),
        FloatingActionButton(
          onPressed: () => _bloc.counterEventSink.add(DecrementEvent()),
          tooltip: 'Decrement',
          child: Icon(Icons.remove),
        )
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    );

  }

}
