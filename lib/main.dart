import 'package:flutter/material.dart';

// ! Need to import this to get StoreProvider
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hello_flutter_redux/redux/store.dart';
import 'package:hello_flutter_redux/redux/actions/counter_actions.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      // * This is the store from redux/store.dart
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyReduxHomePage(title: 'Flutter Redux Demo Home Page'),
      )
    );
  }
}

class MyReduxHomePage extends StatelessWidget {
  MyReduxHomePage({
    this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(title)
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Current counter count:',
                    ),
                    StoreConnector<AppState, int>(
                      converter: (store) => store.state.count,
                      builder: (context, count){
                        return Text(
                          '$count',
                          style: Theme.of(context).textTheme.display1,
                        );
                      },
                    ),
                  ]
                )
              )
            ),
            SafeArea(
              bottom: true,
              child: Container(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0
                ),
                child: _buildFloatingButtonsView(context)
              )
            )
          ],
        ),
      )
    );
  }

  Widget _buildFloatingButtonsView(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomRight,
          child: _buildFloatingButton(AddCounterAction())
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: FloatingActionButton(
            onPressed: () {
              StoreProvider.of<AppState>(context).dispatch(DecreaseCounterAction());
            },
            tooltip:'Decrement',
            child: Icon(Icons.remove),
          )
        )
      ]
    );
  }

  Widget _buildFloatingButton(dynamic action) {
    return StoreConnector<AppState, VoidCallback>(
      converter: (store) {
        return () {
          store.dispatch(action);
        };
      },
      builder: (context, handler) {
        return FloatingActionButton(
          onPressed: handler,
          tooltip: action is AddCounterAction ? 'Increment' : 'Decrement',
          child: new Icon(action is AddCounterAction ? Icons.add : Icons.remove),
        );
      }
    );
  }
}
